////
////  SaveTableViewController.m
////  CoreDataText1009
////
////  Created by Roger on 15/10/10.
////  Copyright © 2015年 apple. All rights reserved.
////
//
//#import "SaveTableViewController.h"
//#import "AppDelegate.h"
//#import "Student+CoreDataProperties.h"
//#import "RegorColor.h"
//@interface SaveTableViewController()
//{
//    NSArray *_studentArray;
//}
//@end
//@implementation SaveTableViewController
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    [self save];
//}
//- (void)save{
//
//        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        //获取上下文管理,相当于数据库
//        NSManagedObjectContext *context = appdelegate.managedObjectContext;
////        创建请求
//    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Student"];
//    _studentArray = [context executeFetchRequest:request error:nil];
//    for (Student *student in _studentArray) {
//        NSLog(@"%@   %d   %@",student.name,student.age,student.address);
//    }
//
//
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return _studentArray.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = nil;
//    cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    Student *student = _studentArray[indexPath.row];
//    cell.textLabel.text = student.name;
//    cell.imageView.image = [UIImage imageWithData:student.headImage];
//    RegorColor *color1 = student.color;
//    cell.textLabel.backgroundColor = [UIColor colorWithRed:color1.red green:color1.green blue:color1.blue alpha:color1.alpha];
//    return cell;
//}
//@end
//
//
//
//
//
//
//
//
//
//
//
//
