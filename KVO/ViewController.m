//
//  ViewController.m
//  KVO
//
//  Created by mt y on 2018/7/6.
//  Copyright © 2018年 mt y. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+MTKVO.h"

@interface ViewController ()

@property (nonatomic, strong)Person *personPeople;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p = [Person new];
    
    _personPeople = p;
    [_personPeople MT_addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
//    [p addObserver:self forKeyPath:@"dogg" options:(NSKeyValueObservingOptionNew) context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",change);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int a = 0;
//    [_personPeople willChangeValueForKey:@"name"];
    _personPeople.name = [NSString stringWithFormat:@"%d",a++];
//     [_personPeople didChangeValueForKey:@"name"];
//   NSMutableArray *arr = [self.personPeople mutableArrayValueForKey:@"arr"];
//    [arr addObject:@"123"];
    
}
@end
