//
//  NSObject+MTKVO.m
//  KVO
//
//  Created by mt y on 2018/7/9.
//  Copyright © 2018年 mt y. All rights reserved.
//

#import "NSObject+MTKVO.h"
#import <objc/message.h>
@implementation NSObject (MTKVO)

- (void)MT_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    //1.判断kayPath是否存在
    SEL setterSeletor = NSSelectorFromString([NSString stringWithFormat:@"set%@:",keyPath.capitalizedString]);
    Class superClass = object_getClass(self.class);

    //2.自定义一个被观察类的子类
    NSString *oldClassName = NSStringFromClass(self.class);
    NSString *newClassName = [NSString stringWithFormat:@"MTKVO_%@",oldClassName];
    //创建一个类
     Class newClass = objc_allocateClassPair(self.class, newClassName.UTF8String, 0);
    //注册该类
    objc_registerClassPair(newClass);
    //2.动态修改该类和被观察类绑定
    object_setClass(self, newClass);
    
    //3.添加setName方法,此时一定要对应setName这样类似的方法，IMP是函数指针找到对应的函数,“V”表示void，@表示oc参数
    class_addMethod(newClass, setterSeletor, (IMP)haha, "v@:@");
    
}
//oc方法中有2个隐藏参数：id self,SEL _cmd,此时应该添加上，否者打印不出对应属性
void haha(id self,SEL _cmd, NSString *newName){
    NSLog(@"%@",newName);
}
@end
