//
//  ViewController.m
//  ChooseTitle
//
//  Created by Superman on 2018/7/14.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ViewController.h"
#import "TitleModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *array;
    NSMutableDictionary *cellMarkDic;
    NSMutableArray *cellMarkArray;
}
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView=[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    _tableView=tableView;
    
    array = [NSMutableArray array];
    cellMarkArray = [NSMutableArray array];
    
    for (int i = 0; i<5; i++) {
        cellMarkDic = [NSMutableDictionary dictionary];
        TitleModel *model = [[TitleModel alloc] init];
        model.title = @" 2015年10月，十八届五中全会决定，全面实施二孩政策，据图推测最主要的原因是:";
        model.one = @"A．我国人口数量开始在减少，为了补充劳动力人口数量";
        model.two = @"B．我国人口出现人口老龄化和劳动力将不足的现象";
        model.three = @"C．我国经济发展速度快，不需要担心人口增多的问题";
        model.four = @"D．政府考虑人们的生育愿望，更多人希望有两个子女";
        [array addObject:model];
        [cellMarkDic setObject:@"0" forKey:@"cellMark"];
        [cellMarkArray addObject:cellMarkDic];
    }
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleModel *model = array[indexPath.row];
    
    return [self getNewsHeightIsNewsPage:model];
}
-(float)getNewsHeightIsNewsPage:(TitleModel *)model
{
    float Height = 20 + [self height:model.title]+[self height:model.one]+[self height:model.two]+[self height:model.three]+[self height:model.four];
    
    return Height +60;
}
-(CGFloat)height:(NSString *)text
{
    CGRect titleLbframe = [text boundingRectWithSize:CGSizeMake(self.view.frame.size.width-52, 9999) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil];
    return titleLbframe.size.height;
}

//cell协议
-(void)addTager:(UIButton *)sender
{
    CGPoint point = sender.center;
    point = [self.tableView convertPoint:point fromView:sender.superview];
    NSIndexPath* indexpath = [self.tableView indexPathForRowAtPoint:point];
    //    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexpath];
    
    NSMutableDictionary *dic = cellMarkArray[indexpath.row];
    
    
    if (sender.tag == 1) {
        
        [dic setObject:@"1" forKey:@"cellMark"];
        
    }else if (sender.tag == 2)
    {
        [dic setObject:@"2" forKey:@"cellMark"];
    }else if (sender.tag == 3)
    {
        [dic setObject:@"3" forKey:@"cellMark"];
    }else
    {
        [dic setObject:@"4" forKey:@"cellMark"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
