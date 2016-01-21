//
//  SXSChooseBankViewController.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSChooseBankViewController.h"
#import "SXSChooseBankCardCell.h"
@interface SXSChooseBankViewController()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)UITableView * listView;
@property(nonatomic,weak)UIButton * conform;
@end
@implementation SXSChooseBankViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}
- (void)initUI
{
    self.title = @"选择银行";
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.sectionFooterHeight = 0.0f;
    tableView.sectionHeaderHeight = 0.0f;
    tableView.rowHeight = 80;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[SXSChooseBankCardCell class] forCellReuseIdentifier:@"chooseBankCardCell"];
    [self.view addSubview:tableView];
    self.listView = tableView;
    
    UIView * foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 60)];
    UIButton * conform = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, self.view.width-20, 40)];
    [conform addTarget:self action:@selector(conformClick) forControlEvents:UIControlEventTouchUpInside];
    conform.backgroundColor = [UIColor redColor];
    [conform setTitle:@"确定" forState:UIControlStateNormal];
    [foot addSubview:conform];
    self.conform = conform;
    self.listView.tableFooterView = foot;
}
#pragma mark -- UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SXSChooseBankCardCell * cell = [tableView dequeueReusableCellWithIdentifier:@"chooseBankCardCell"];
    if(indexPath.row == 5)//最后一个
    {
        cell.isLast = YES;//控制底线是否闭合
    }
    else
    {
        cell.isLast = NO;//控制底线是否闭合
    }
    return cell;
}
- (void)conformClick
{
    NSLog(@"---conformClick---");
    
}
@end
