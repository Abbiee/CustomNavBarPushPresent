//
//  AppDelegate.m
//  WKWebViewObjC
//
//  Created by Abbie on 07/07/20.
//  Copyright © 2020 Abbie. All rights reserved.
//

#import "AppDelegate.h"
#import "secondview.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    BOOL shouldPerformAdditionalDelegateHandling = YES;
    
    
    // Check API availiability
    // UIApplicationShortcutItem is available in iOS 9 or later.
    if([[UIApplicationShortcutItem class] respondsToSelector:@selector(new)]){
        NSLog(@"HERE");
        //  [self configDynamicShortcutItems];
        
        // If a shortcut was launched, display its information and take the appropriate action
        UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKeyedSubscript:UIApplicationLaunchOptionsShortcutItemKey];
        
        if(shortcutItem)
        {
            NSLog(@"shortcut launch");
            // When the app launch at first time, this block can not called.
            
            [self handleShortCutItem:shortcutItem];
            
            // This will block "performActionForShortcutItem:completionHandler" from being called.
            shouldPerformAdditionalDelegateHandling = NO;
            
            
        }else{
            NSLog(@"normal launch");
            // normal app launch process without quick action
            
            // [self launchWithoutQuickAction];
            
        }
        
    }else{
        
        // Less than iOS9 or later
        
        //  [self launchWithoutQuickAction];
        
    }
    
    
    return shouldPerformAdditionalDelegateHandling;
}


- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    NSLog(@"performActionForShortcutItem");
    
    BOOL handledShortCutItem = [self handleShortCutItem:shortcutItem];
    
    completionHandler(handledShortCutItem);
}


/**
 *  @brief handle shortcut item depend on its type
 *
 *  @param shortcutItem shortcutItem  selected shortcut item with quick action.
 *
 *  @return return BOOL description
 */
- (BOOL)handleShortCutItem : (UIApplicationShortcutItem *)shortcutItem{
    
    BOOL handled = NO;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    if ([shortcutItem.type isEqualToString:@"PlayMusic"]) {
        handled = YES;
        NSLog(@"Play");
        
//        secondview *vc = [storyboard instantiateViewControllerWithIdentifier:@"second"];
//        
//        self.window.rootViewController = vc;
//        
//        [self.window makeKeyAndVisible];
        
    }
    
    else if ([shortcutItem.type isEqualToString:@"StopMusic"]) {
        handled = YES;
        NSLog(@"Stop");
        //        ThirdViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"thirdVC"];
        //
        //        self.window.rootViewController = vc;
        
        [self.window makeKeyAndVisible];
    }
    
    
    return handled;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
