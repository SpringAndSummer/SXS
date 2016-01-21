//
//  SXSCardListViewController.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSCardListViewController.h"
#import "SXSCardListcell.h"
#import "SXSChooseBankViewController.h"
@interface SXSCardListViewController()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)UITableView * listView;
@property(nonatomic,weak)UIButton * addCard;
@end
@implementation SXSCardListViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}
- (void)initUI
{
    self.title = @"绑定银行卡列表";
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.5];
    tableView.sectionFooterHeight = 0.0f;
    tableView.sectionHeaderHeight = 0.0f;
    tableView.rowHeight = 100;//设置cell的高度
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[SXSCardListcell class] forCellReuseIdentifier:@"cardListcell"];
    [self.view addSubview:tableView];
    self.listView = tableView;
    
    
    UIView * head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 30)];
    head.backgroundColor = [UIColor lightGrayColor];
    UILabel * headTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, head.width-10, 20)];
    headTitle.font = [UIFont systemFontOfSize:14];
    headTitle.text = @"您已经绑定了三张银行卡,您可以再绑定三张银行卡";
    [head addSubview:headTitle];
    self.listView.tableHeaderView = head;

    
    UIView * foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 60)];
    UIButton * addCard = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, self.view.width-20, 20)];
    [addCard addTarget:self action:@selector(addCardClick) forControlEvents:UIControlEventTouchUpInside];
    addCard.backgroundColor = [UIColor lightGrayColor];
    addCard.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//让button的tittle左对齐
    addCard.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);//让btn标题往右再移动10
//    [addCard setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 100)];
//    addCard.titleLabel.textAlignment = NSTextAlignmentLeft;
    [addCard setTitle:@"+ 添加绑定银行卡 >" forState:UIControlStateNormal];
    [foot addSubview:addCard];
    self.addCard = addCard;
    self.listView.tableFooterView = foot;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SXSCardListcell * cell = [tableView dequeueReusableCellWithIdentifier:@"cardListcell"];

    return cell;
}
- (void)addCardClick
{
    SXSChooseBankViewController * vc = [[SXSChooseBankViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
