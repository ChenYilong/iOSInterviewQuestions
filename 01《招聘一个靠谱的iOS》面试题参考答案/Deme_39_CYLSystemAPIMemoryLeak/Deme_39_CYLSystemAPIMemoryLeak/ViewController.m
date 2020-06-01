//
//  ViewController.m
//  Deme_39_CYLSystemAPIMemoryLeak
//
//  Created by chenyilong on 2020/6/1.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "ViewController.h"
#import "UIViewAnimationsBlock.h"
#import "NSNotificationCenterBlock.h"
#import "NSNotificationCenterIVARBlock.h"
#import "GCDBlock.h"
#import "NSOperationQueueBlock.h"
#import "NSOperationQueueIVARBlock.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iTeaTime(技术清谈)";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    NSDictionary *infoUIViewAnimationsBlock = @{
      @"title" : @"情况❶ UIViewAnimationsBlock",
      @"ViewController" : @"UIViewAnimationsBlock",
      @"color" : [UIColor greenColor],
      @"description": @"[UIView animateWithDuration:duration animations:^{ [self.superview layoutIfNeeded]; }];"
    };
       
    NSDictionary *infoNSNotificationCenterBlock = @{
      @"title" : @"情况❷ NSNotificationCenterBlock",
      @"ViewController" : @"NSNotificationCenterBlock",
      @"color" : [UIColor blueColor],
      @"description": @""
    };
     
    NSDictionary *infoNSNotificationCenterIVARBlock = @{
         @"title" : @"情况❸ NSNotificationCenterIVARBlock",
         @"ViewController" : @"NSNotificationCenterIVARBlock",
         @"color" : [UIColor orangeColor],

         @"description": @""
       };
     /*
      _observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"testKey"
                                                                    object:nil
                                                                     queue:nil
                                                                usingBlock:^(NSNotification *note) {
          [self dismissModalViewControllerAnimated:YES];
      }];
      */
    
    NSDictionary *infoGCDBlock = @{
            @"title" : @"情况❹ GCDBlock",
            @"ViewController" : @"GCDBlock",
            @"color" : [UIColor systemPinkColor],
            @"description": @""
          };
       /*
        //情况❹ GCDBlock GCDBlock
        dispatch_group_async(self.operationGroup, self.serialQueue, ^{
            [self doSomething];
        });
        */
    
    NSDictionary *infoNSOperationQueueBlock = @{
            @"title" : @"情况❺ NSOperationQueueBlock",
            @"ViewController" : @"NSOperationQueueBlock",
            @"color" : [UIColor purpleColor],
            @"description": @""
          };
    /*
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{ self.someProperty = xyz; }];
     */

    NSDictionary *infoNSOperationQueueIVARBlock = @{
            @"title" : @"情况❻ NSOperationQueueIVARBlock",
            @"ViewController" : @"NSOperationQueueIVARBlock",
            @"color" : [UIColor blueColor],
            @"description": @""
          };
    /*
    _mainQueue = [[NSOperationQueue mainQueue] addOperationWithBlock:^{ self.someProperty = xyz; }];
    */
    
    NSArray *array = @[
      infoUIViewAnimationsBlock,
      infoNSNotificationCenterBlock,
      infoNSNotificationCenterIVARBlock,
      infoGCDBlock,
      infoNSOperationQueueBlock,
      infoNSOperationQueueIVARBlock
    ];
    self.dataSource = array;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.dataSource[indexPath.row][@"ViewController"];
    CYLBaseViewController *vc  = [self.storyboard instantiateViewControllerWithIdentifier:text];
    vc.text = text;
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
      if (cell == nil) {
          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
      }
      cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
      cell.textLabel.font = [UIFont systemFontOfSize:22];
      cell.backgroundColor  = self.dataSource[indexPath.row][@"color"];
    
      return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

@end
