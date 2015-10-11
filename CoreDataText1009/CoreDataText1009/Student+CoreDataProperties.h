//
//  Student+CoreDataProperties.h
//  CoreDataText1009
//
//  Created by Roger on 15/10/10.
//  Copyright © 2015年 apple. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nonatomic) int16_t age;
@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSData *headImage;
@property (nullable, nonatomic, retain) id color;
@property (nullable, nonatomic, retain) NSOrderedSet<Book *> *books;

@end

@interface Student (CoreDataGeneratedAccessors)

- (void)insertObject:(Book *)value inBooksAtIndex:(NSUInteger)idx;
- (void)removeObjectFromBooksAtIndex:(NSUInteger)idx;
- (void)insertBooks:(NSArray<Book *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeBooksAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInBooksAtIndex:(NSUInteger)idx withObject:(Book *)value;
- (void)replaceBooksAtIndexes:(NSIndexSet *)indexes withBooks:(NSArray<Book *> *)values;
- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSOrderedSet<Book *> *)values;
- (void)removeBooks:(NSOrderedSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END
