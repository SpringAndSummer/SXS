//
//  SXSSetCardViewController.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSSetCardViewController.h"
#import "SXSSetCardCountDownCell.h"
#import "SXSSetCardNormalCell.h"
#import "SXSSetCardImageCodeCell.h"
#import "SXSChooseBankViewController.h"

@interface SXSSetCardViewController()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)UITableView * listView;
@property(nonatomic,weak)UIButton * conform;//确认按钮
@property(nonatomic,weak)UILabel * headTitle;
@property(nonatomic,assign)NSInteger errorCount;
@property(nonatomic,assign)BOOL flag;
@property (nonatomic,strong)NSArray * itemsArr;//元素数组
@end
@implementation SXSSetCardViewController
- (void)viewDidLoad
{
    _errorCount = 0;
    [super viewDidLoad];
    [self initUI];
}
- (void)initUI
{
    self.title = @"绑定银行卡";
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.sectionFooterHeight = 0.0;
    tableView.sectionHeaderHeight = 0.0;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 50;//固定的行高,直接写,不要用代理
    [tableView registerClass:[SXSSetCardNormalCell class] forCellReuseIdentifier:@"setCardNormalCell"];
    [tableView registerClass:[SXSSetCardCountDownCell class] forCellReuseIdentifier:@"setCardCountDownCell"];
    [tableView registerClass:[SXSSetCardImageCodeCell class] forCellReuseIdentifier:@"setCardImageCodeCell"];
    self.itemsArr = @[@"选择银行:",@"银行账号:",@"银行预留手机号:"];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.listView = tableView;
    
    UIView * foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 60)];
    UIButton * conform = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, self.view.width-20, 40)];
    [conform addTarget:self action:@selector(conformClick) forControlEvents:UIControlEventTouchUpInside];
    conform.backgroundColor = [UIColor redColor];
    [conform setTitle:@"完成" forState:UIControlStateNormal];
    [foot addSubview:conform];
    self.conform = conform;
    self.listView.tableFooterView = foot;
    
    UIView * head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 30)];
    head.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    UILabel * headTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.view.width-10, 20)];
    headTitle.text = @"1.填写个人信息 > 2.绑定银行卡";
    [head addSubview:headTitle];
    self.listView.tableHeaderView = head;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(_flag == YES)
    {
        return 2;
    }
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
       return 4;
    }
    else if(section == 1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        if(indexPath.row < 3)
        {
            SXSSetCardNormalCell * cell = [tableView dequeueReusableCellWithIdentifier:@"setCardNormalCell"];
            cell.name.text = self.itemsArr[indexPath.row];
            return cell;
        }
        else
        {
            SXSSetCardCountDownCell * cell = [tableView dequeueReusableCellWithIdentifier:@"setCardCountDownCell"];
            return cell;
        }
    }
    else if(indexPath.section == 1)
    {
        SXSSetCardImageCodeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"setCardImageCodeCell"];
        return cell;
    }
    else
    {
        return [UITableViewCell new];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * devi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 10)];
    devi.backgroundColor = [UIColor lightGrayColor];
    return devi;
}
- (void)conformClick
{
    _errorCount = 3;
    if (_errorCount == 3) {
        _flag = YES;
        
        [self.listView reloadData];
    }
    else
    {
        _flag = NO;
    }
    SXSChooseBankViewController * vc = [[SXSChooseBankViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
