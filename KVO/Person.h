//
//  Person.h
//  KVO
//
//  Created by mt y on 2018/7/6.
//  Copyright © 2018年 mt y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Person : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, strong)Dog *dogg;
@property (nonatomic, strong)NSMutableArray *arr;

@end
