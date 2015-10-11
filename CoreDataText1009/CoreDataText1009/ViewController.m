//
//  ViewController.m
//  CoreDataText1009
//
//  Created by Roger on 15/10/9.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ScanTableViewController.h"
#import "RegorColor.h"
#import "Student+CoreDataProperties.h"
#import "Book+CoreDataProperties.h"

@interface ViewController ()
{
    NSArray *_stuArray;
}
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
- (IBAction)saveButton:(id)sender;
- (IBAction)scanButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)saveButton:(id)sender {
    NSString *name = _nameTextField.text;
    int age = _ageTextField.text.intValue;
    NSString *address = _addressTextField.text;
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //获取上下文管理,相当于数据库
    NSManagedObjectContext *context = appdelegate.managedObjectContext;
    //创建实体

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
#if 0
    //方式1 使用kvc
    //插入数据库,但是并没有持久化
    NSManagedObject *student = [[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:context];
    [student setValue:name forKey:@"name"];
    [student setValue:@(age) forKey:@"age"];
    [student setValue:address forKey:@"address"];
#endif
    Student *student1 = [[Student alloc]initWithEntity:entity insertIntoManagedObjectContext:context];
    student1.name = name;
    student1.age = age;
    student1.address = address;
    RegorColor *color1 = [[RegorColor alloc]init];
    color1.red = arc4random_uniform(255)/255.0;
    color1.green = arc4random_uniform(255)/255.0;
    color1.blue = arc4random_uniform(255)/255.0;
    color1.alpha = arc4random_uniform(255)/255.0;
    student1.color = color1;
    
    NSEntityDescription *bookEntity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
    
    Book *book = [[Book alloc]initWithEntity:bookEntity insertIntoManagedObjectContext:context];
    book.title = @"盗墓笔记";
    book.price = 39;
//    student1.books = [NSOrderedSet ];

    //这里要记得应该勾选的属性，optional和允许其他的存储平台
    UIImage *imageHead = [UIImage imageNamed:@"1.jpg"];
    NSData *image = UIImageJPEGRepresentation(imageHead, 0.6);
    student1.headImage = image;
    NSError *err;
    if ([context save:&err]) {
        NSLog(@"保存成功");
    }else
    {
//        age的数据加了限制，如果在数据限制以外的数据则不合规则
        NSLog(@"保存失败:%@",err);
      [context deleteObject:err.userInfo[@"NSValidationErrorObject"]];
        
       if ([err.userInfo[@"NSValidationErrorKey"] isEqualToString:@"age"])
       {
           
//        if (err.code == NSValidationNumberTooLargeError || err.code == NSValidationNumberTooSmallError)
//        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"年龄超出了范围" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            //弹出警告框
            [self presentViewController:alert animated:YES completion:nil];
        }
//       }
    }
    
}


- (IBAction)scanButton:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //管理上下文
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
#if 0
    //创建数据请求对象
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Student"];
    //    zhix数据请求
    _stuArray = [context executeFetchRequest:request error:nil];
#endif
//    条件限制请求
    NSFetchRequest *request = [appDelegate.managedObjectModel fetchRequestTemplateForName:@"StudentRequest"];
    _stuArray = [context executeFetchRequest:request error:nil];
#if 0
    //方式1 kvc
    NSManagedObject *student = [_stuArray firstObject];
    NSLog(@"name:%@ ,age:%@,address:%@ ",[student valueForKey:@"name"],[student valueForKey:@"age"],[student valueForKey:@"address"]);
#endif
    for (Student * student1 in _stuArray) {
        NSLog(@"name:%@,age:%d,address:%@ image:%@",student1.name,student1.age,student1.address,student1.headImage);
    }


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end






















