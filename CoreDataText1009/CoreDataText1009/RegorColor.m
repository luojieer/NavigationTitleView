//
//  RegorColor.m
//  CoreDataText1009
//
//  Created by Roger on 15/10/10.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "RegorColor.h"

@implementation RegorColor

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
      _red = [aDecoder decodeFloatForKey:@"red"];
      _green = [aDecoder decodeFloatForKey:@"green"];
      _blue = [aDecoder decodeFloatForKey:@"blue"];
       _alpha = [aDecoder decodeFloatForKey:@"alpha"];
    }
    return self;
    
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeFloat:_red forKey:@"red"];
    [aCoder encodeFloat:_green forKey:@"green"];
    [aCoder encodeFloat:_blue forKey:@"blue"];
    [aCoder encodeFloat:_alpha forKey:@"alpha"];

}

@end
