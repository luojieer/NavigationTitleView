//
//  ScanTableViewController.m
//  CoreDataText1009
//
//  Created by Roger on 15/10/9.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ScanTableViewController.h"
#import "AppDelegate.h"
#import "Student+CoreDataProperties.h"
#import "RegorColor.h"
@interface ScanTableViewController()
{
    NSArray *_stuArray;
}
@end


@implementation ScanTableViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //这里调用时让其显示出来
    [self scan];
    
}

- (void)scan {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //管理上下文
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
#if 0
    //创建数据请求对象
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Student"];
//     执行数据请求
    _stuArray = [context executeFetchRequest:request error:nil];

#else
    NSFetchRequest *request = [appDelegate.managedObjectModel fetchRequestTemplateForName:@"StudentRequest"];
    //    zhix数据请求
    _stuArray = [context executeFetchRequest:request error:nil];
#endif
#if 0
    //方式1 kvc
    NSManagedObject *student = [_stuArray firstObject];
    NSLog(@"name:%@ ,age:%@,address:%@ ",[student valueForKey:@"name"],[student valueForKey:@"age"],[student valueForKey:@"address"]);
#endif
    for (Student * student1 in _stuArray) {
        NSLog(@"name:%@,age:%d,address:%@",student1.name,student1.age,student1.address);
    }
    //做删除用
    [self.tableView reloadData];

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _stuArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;


    cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
     Student *student = _stuArray[indexPath.row];
    cell.textLabel.text = student.name;
    cell.imageView.image = [UIImage imageWithData:student.headImage];
    RegorColor *color1 = student.color;
    cell.textLabel.backgroundColor = [UIColor colorWithRed:color1.red green:color1.green blue:color1.blue alpha:color1.alpha];
//    Book *book = [student.books anyObject];
//    NSString *title = book.title;
//    int price = book.price;
//    int age = stu.age;
    return cell;

}
//删除操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    Student *stu = _stuArray[indexPath.row];
//    数据的删除
    [context deleteObject:stu];
    //数据持久化,如果不加这一句，那么数据不会彻底删除，第二次运行还会有
    
    [context save:nil];
    //这里调用，在加上  [self.tableView reloadData],让其直接从浏览处删除
    [self scan];
    
}

@end
