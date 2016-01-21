//
//  ViewController.m
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "ViewController.h"
#import "SXSSettingNormalCell.h"
#import "SXSSettingHeadCell.h"
#import "SXSSettingSwitchCell.h"
#import "PasswordAccount.h"
#import "GestureViewController.h"
#import "SXSSetPayPasswordController.h"
#import "SXSChangeBindingIphoneViewController.h"
#import "SXSSetTool.h"
#import "SXSUserCertifyViewController.h"
#import "SXSChangePayPasswordController.h"
#import "SXSChangeLogINPasswordViewController.h"
#import "UIView+Extension.h"



@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,SXSSettingSwitchCellDelegate>
@property (nonatomic,weak)UITableView * settingTableView;
@property(nonatomic,strong)NSArray *allItems;//cell的元素
@property(nonatomic,strong)NSArray *allItems1;//cell的元素
@property (nonatomic,weak)UIButton * headIcon;//头像
@property (nonatomic,weak)UILabel * iphoneLabel;//电话号码
@property (nonatomic,weak)UILabel * authenticationOrBindingLabel;//认证成功后显示绑定提示
@property (nonatomic,weak)UIButton * authenticationOrBindingStateButton;//认证或者绑定提示按钮
@property (nonatomic,weak)UIImageView * customerImage;//客服电话
@property (nonatomic,weak)UIButton * investmentButton;//立即投资按钮
@property (nonatomic,assign)BOOL ifSettingPassword;//是否设置过登陆密码
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.ifSettingPassword = YES;
    self.view.backgroundColor = UIColorFromHex(0xf2f2f2);

     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadView) name:@"isSettingNotice" object:nil];
    
    _isSetting = [PasswordAccount isOnWithNeedPassword];
    [self initUI];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[SXSSetTool imageWithColor:RGB(255, 81, 83) forFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, 64)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];//去掉导航栏下方黑线
}
-(void)reloadView
{
    _isSetting = [PasswordAccount isOnWithNeedPassword];
    [self.settingTableView reloadData];
}
- (void)initUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = UIColorFromHex(0xf2f2f2);
    tableView.rowHeight = 50;
    tableView.sectionFooterHeight = 0.0;
    tableView.sectionHeaderHeight = 0.0;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.settingTableView = tableView;
    
    //注册cell
    [self.settingTableView registerClass:[SXSSettingNormalCell class] forCellReuseIdentifier:@"settingNormalCell"];
    
    [self.settingTableView registerClass:[SXSSettingSwitchCell class] forCellReuseIdentifier:@"settingSwitchCell"];

    [self.settingTableView registerClass:[SXSSettingHeadCell class] forCellReuseIdentifier:@"settingHeadCell"];
    self.allItems = @[@"设置支付密码",@"修改登陆密码",@"手势密码",@"修改手势密码"];
    self.allItems1 = @[@"检查版本更新",@"关于",@"更改绑定手机号"];
    
    [self customHeadAndBottomView];
}
//头部和底部视图
- (void)customHeadAndBottomView
{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 150)];
    headView.backgroundColor =  RGB(255, 81, 83);

    UIButton * head = [UIButton new];
    head.frame = CGRectMake(10.0, 45, 60.0, 60.0);
    
    head.backgroundColor = [UIColor yellowColor];
    head.layer.borderWidth = 0.5;
    head.layer.cornerRadius = 30.0;
    head.clipsToBounds = YES;
    //取出本地的图片
    NSData * headData = [[NSUserDefaults standardUserDefaults] valueForKey:@"headImage"];
    UIImage * headImage = [UIImage imageWithData:headData];
    [head setBackgroundImage:headImage forState:UIControlStateNormal];

    
    [head addTarget:self action:@selector(iconTapClick) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:head];
    
    self.headIcon = head;

    
#warning 需要获得真实的手机号
    UILabel * iphoneTemp = [[UILabel alloc]init];
    iphoneTemp.text = @"11111111111";
    iphoneTemp.font = [UIFont systemFontOfSize:14];
    [headView addSubview:iphoneTemp];
    self.iphoneLabel = iphoneTemp;
    
   #warning label上的文字是需要变化的
    UILabel * authenticationOrBindingTemp = [[UILabel alloc]init];
    authenticationOrBindingTemp.text = @"未认证用户 ,赶快认证绑定吧";
    [headView addSubview:authenticationOrBindingTemp];
    self.authenticationOrBindingLabel = authenticationOrBindingTemp;
    
    
    #warning button上的文字是需要变化的
    UIButton * authenticationOrBindingTempButton = [[UIButton alloc]init];
    authenticationOrBindingTempButton.titleLabel.font = [UIFont systemFontOfSize:13];
    authenticationOrBindingTempButton.layer.cornerRadius = 8.0;
    authenticationOrBindingTempButton.layer.borderColor = [UIColor whiteColor].CGColor;
    authenticationOrBindingTempButton.clipsToBounds =YES;
    authenticationOrBindingTempButton.layer.borderWidth = 1.0;

    authenticationOrBindingTempButton.titleLabel.text = @"认证";
    [headView addSubview:authenticationOrBindingTempButton];
    [authenticationOrBindingTempButton addTarget:self action:@selector(autherClick) forControlEvents:UIControlEventTouchUpInside];
    self.authenticationOrBindingStateButton = authenticationOrBindingTempButton;
    
    
    [self.iphoneLabel sizeToFit];
    self.iphoneLabel.frame = CGRectMake(self.headIcon.right+20.0, self.headIcon.y+10.0, self.iphoneLabel.width, self.iphoneLabel.height);
    
    [self.authenticationOrBindingLabel sizeToFit];
    self.authenticationOrBindingLabel.frame = CGRectMake(self.iphoneLabel.x, self.iphoneLabel.bottom + 10, self.authenticationOrBindingLabel.width, self.authenticationOrBindingLabel.height);
    
    self.authenticationOrBindingStateButton.frame = CGRectMake(UI_SCREEN_WIDTH-10.0-50, self.authenticationOrBindingLabel.y, 50 , 20);
    [self.authenticationOrBindingStateButton setTitle:@"认证" forState:UIControlStateNormal];
  
    self.settingTableView.tableHeaderView = headView;

    //尾视图
    UIView * footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH,150)];
    footerView.backgroundColor = [UIColor greenColor];
    UIImageView * customerTempImage = [[UIImageView alloc]init];
#warning 少图片
    customerTempImage.backgroundColor = [UIColor redColor];
    customerTempImage.frame = CGRectMake((UI_SCREEN_WIDTH-100)/2.0, 20.0, 100, 50);
    [footerView addSubview:customerTempImage];
    self.customerImage = customerTempImage;
    
    UIButton * investmentTempButton = [[UIButton alloc]init];
    investmentTempButton.layer.cornerRadius = 8.0;
    investmentTempButton.layer.masksToBounds = YES;
    [investmentTempButton setTitle:@"立即投资" forState:UIControlStateNormal];
    investmentTempButton.backgroundColor = RGB(255, 81, 83);
    investmentTempButton.frame = CGRectMake(20.0, self.customerImage.y+self.customerImage.height+20, UI_SCREEN_WIDTH-40.0, 44);
    
    [footerView addSubview:investmentTempButton];
    
    self.investmentButton = investmentTempButton;
       self.settingTableView.tableFooterView = footerView;

}
//认证或者绑定银行卡
- (void)autherClick
{
    SXSUserCertifyViewController * userCertifyViewController = [[SXSUserCertifyViewController alloc ]init];
    [self.navigationController pushViewController:userCertifyViewController animated:YES];
}
//点击头像选择
- (void)iconTapClick
{
    [self iconSheet];
}
//头像
- (void)iconSheet
{
    UIActionSheet * iconSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册中选择", nil];
    [iconSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        //点击的是头像
        if(buttonIndex == 0)
        {
            //拍照
            //判断照相机是否可用
            if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])
            {
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            }
            [self presentViewController:picker animated:YES completion:nil];
        }else if(buttonIndex == 1)
        {
            //相册
            if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])
            {
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            
            [self presentViewController:picker animated:YES completion:nil];
        }else
        {
            return;
        }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //获取图片
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage * headImage = [SXSSetTool thumbnailImage:CGSizeMake(30.0, 30.0) withImage:image];
    [self.headIcon setBackgroundImage:headImage forState:UIControlStateNormal];
    
    
    NSData * iconUrl = UIImageJPEGRepresentation(image,  0.25);
    //把头像存到本地
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:iconUrl forKey:@"headImage"];
    [ud synchronize];

    //转为base64字符串
    NSString * headIcon = [iconUrl base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
#warning 上传数据
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark-tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
     if (section == 0) {
         return _isSetting ?4:3;
    }
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0|| indexPath.row == 1|| indexPath.row ==3) {
            SXSSettingNormalCell * normalCell = [tableView dequeueReusableCellWithIdentifier:@"settingNormalCell" forIndexPath:indexPath ];
            
            normalCell.descpritionLabel.text = self.allItems[indexPath.row];
            if (indexPath.row == self.allItems.count-1) {
                normalCell.lineLabel.hidden = YES;
            }
            if (indexPath.row == 0) {
                if (self.ifSettingPassword == YES) {
                    normalCell.descpritionLabel.text = @"修改支付密码";

                }
            }
            return normalCell;
            
        }
       
        if (indexPath.row == 2) {
            SXSSettingSwitchCell * switchCell = [tableView dequeueReusableCellWithIdentifier:@"settingSwitchCell" forIndexPath:indexPath];
            switchCell.delegate = self;
            switchCell.descpritionLabel.text = self.allItems[indexPath.row];
            
          //            [self.view addSubview:sw];
//            self.mySwitch = sw;
            switchCell.ifSwitch.on = [PasswordAccount isOnWithNeedPassword];//
            return switchCell;
        }
    }
    else if(indexPath.section == 1) {
        SXSSettingNormalCell * normalCell = [tableView dequeueReusableCellWithIdentifier:@"settingNormalCell" forIndexPath:indexPath ];
        
        normalCell.descpritionLabel.text = self.allItems1[indexPath.row];
        normalCell.lineLabel.hidden = NO;

        if (indexPath.row == 2) {
            normalCell.lineLabel.hidden = YES;
        }
        return normalCell;
    }
    return nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, 10.0)];
    head.backgroundColor = [UIColor lightGrayColor];
    return head;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row== 0) {
            if (self.ifSettingPassword) {
                SXSChangePayPasswordController * changePayPasswordController = [[SXSChangePayPasswordController alloc]init];
                [self.navigationController  pushViewController:changePayPasswordController animated:YES];
            }else
            {
                SXSSetPayPasswordController * setPayPasswordController  = [[SXSSetPayPasswordController alloc]init];
                [self.navigationController pushViewController:setPayPasswordController  animated:YES];
            }
          
        }
        if (indexPath.row == 1) {
            SXSChangeLogINPasswordViewController * changeLogINPasswordViewController = [[SXSChangeLogINPasswordViewController alloc]init];
            [self.navigationController pushViewController:changeLogINPasswordViewController animated:YES];
        }
        if (indexPath.row == 3) {
            GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:VerifyMode];
            ges.isFormer = NO;
            [self.navigationController pushViewController:ges animated:YES];
        }
    }
    if (indexPath.section == 1) {
        if(indexPath.row == 0)
        {
            [self updateSXSApp];
        }
        if (indexPath.row == 2) {
            SXSChangeBindingIphoneViewController *  changeBindingIphoneViewController = [[SXSChangeBindingIphoneViewController alloc]init];
            [self.navigationController pushViewController:changeBindingIphoneViewController animated:YES];
        }
    }
}
- (void)setGesterPassword:(BOOL)isOn
{
    
        if (isOn == YES) {
            GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:VerifyMode];
            ges.isFormer = YES;
            [self.navigationController pushViewController:ges animated:YES];
    
        }else{
            GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:ResetMode];
            ges.isFormer = NO;
            [self.navigationController pushViewController:ges animated:YES];
        }
}
//版本更新
//跳转App Store
-(void)updateSXSApp
{
    NSString *appidStr = @"957111030";
    NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@",appidStr ];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
