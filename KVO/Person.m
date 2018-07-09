//
//  Person.m
//  KVO
//
//  Created by mt y on 2018/7/6.
//  Copyright © 2018年 mt y. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    if (self = [super init]) {
        _dogg = [Dog new];
        _arr = [NSMutableArray new];
    }
    return self;
}
+ (BOOL)automaticallyNotifiesObserversOfName
{
    return YES;
}
+(NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    NSLog(@"%@",key);
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"dogg"]) {
        NSArray *arr = @[@"_dogg.age",@"_dogg.ageee"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:arr];
        
    }
    return keyPaths;
}
@end
