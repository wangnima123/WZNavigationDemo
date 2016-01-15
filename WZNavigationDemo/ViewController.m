//
//  ViewController.m
//  WZNavigationDemo
//
//  Created by chenstone on 16/1/14.
//  Copyright © 2016年 chenstone. All rights reserved.
//
//编译执行时的第一件事儿应该是替换文本,然后才是导入关联性文件
#define URL_TABLEVIEW @"https://api.108tian.com/mobile/v3/EventList?cityId=1&step=10&theme=0&page=0"

#import "ViewController.h"
#import "EventListDataService.h"
#import "Item.h"
#import "ItemCell.h"
#import "MJRefresh.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy)NSArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController
//记住:创建本类对象时,实例方法用id返回,类方法用instanceType返回..
- (id)initWithTitle:(NSString *)title{
    self = [super init];
    if(self){
        self.titleText = title;
    }
    return self;
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    [self setupUI];
    [self setRefreshHeader];
    [self.myTableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)setRefreshHeader{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(setupData)];
    self.myTableView.mj_header = header;
}

- (void)setupData{
    [self startLoad];
    [EventListDataService getWithUrl:URL_TABLEVIEW param:nil modelClass:[Item class] responseBlock:^(id responseObject, NSError *error){
        [self stopLoad];
        [self.myTableView.mj_header endRefreshing];
        self.dataSource = (NSArray *)responseObject;
        [self.myTableView reloadData];
    }];
}

- (void)setupUI{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.estimatedRowHeight = 44;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ItemCell class]) bundle:nil] forCellReuseIdentifier:@"CustomCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identy = @"CustomCell";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identy forIndexPath:indexPath];
    cell.item = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"我被点击了!");
}

@end
