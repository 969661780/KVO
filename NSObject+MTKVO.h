//
//  NSObject+MTKVO.h
//  KVO
//
//  Created by mt y on 2018/7/9.
//  Copyright © 2018年 mt y. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MTKVO)

- (void)MT_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
@end
