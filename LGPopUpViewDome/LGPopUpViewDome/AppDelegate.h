//
//  AppDelegate.h
//  LGPopUpViewDome
//
//  Created by carnet on 2018/11/4.
//  Copyright © 2018年 TP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

