//
//  ViewController.m
//  Lesson_16
//
//  Created by maxud on 03.10.17.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) NSArray *headerArray;
@property (nonatomic, strong) NSArray *footerArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.array =@[@"String1",@"String2"];
    self.headerArray = @[@"haeder1",@"header2",@"header3"];
    self.footerArray = @[@"footer1",@"footer2",@"footer3"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"My name" forKey:@"key1"];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  self.headerArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 90.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 45.0f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderIdentifier"];
    if (!headerView)
    {
        headerView = [[UITableViewHeaderFooterView alloc]
              initWithReuseIdentifier:@"HeaderIdentifire"];
        headerView.contentView.backgroundColor = [UIColor redColor];
        
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 320, 90)];
//        [headerView.contentView addSubview:label];
        HeaderView *header = [HeaderView new];
        [headerView.contentView addSubview:header];
    }
    
    
//    UILabel *textlabel = headerView.contentView.subviews.firstObject;
//    textlabel.text = self.headerArray[section];
    HeaderView *header = headerView.contentView.subviews.firstObject;
    
    header.titleLabel.text = self.headerArray[section];
    [header.button setTitle:@"HI" forState:(UIControlStateNormal)];
    
    return headerView;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FotterIdentifire"];
    if (!footerView)
    {
        footerView = [[UITableViewHeaderFooterView alloc]
                      initWithReuseIdentifier:@"FooterIdentifire"];
        footerView.contentView.backgroundColor = [UIColor greenColor];
    }
    return footerView;
}

@end
