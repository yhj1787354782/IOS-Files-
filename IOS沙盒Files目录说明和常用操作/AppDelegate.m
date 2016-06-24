//
//  AppDelegate.m
//  IOS沙盒Files目录说明和常用操作
//
//  Created by 阳光 on 16/6/23.
//  Copyright © 2016年 com_qibei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    // 读取Documents目录代码
    NSArray *pathsDocuments=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *pathDocuments=[pathsDocuments objectAtIndex:0];
//    NSLog(@"pathDocuments~~~~~~%@    pathsDocuments----%@",pathDocuments,pathsDocuments);
  /*
   pathDocuments~~~~~~/Users/yhj/Library/Developer/CoreSimulator/Devices/65FC33FE-6234-427B-A4F2-4F22ACE36842/data/Containers/Data/Application/12EA0817-D2C0-40E5-B3CC-1EB642FCDF9F/Documents    pathsDocuments----(
   "/Users/yhj/Library/Developer/CoreSimulator/Devices/65FC33FE-6234-427B-A4F2-4F22ACE36842/data/Containers/Data/Application/12EA0817-D2C0-40E5-B3CC-1EB642FCDF9F/Documents"
   )
   */


   // 读取Cache目录代码
    NSArray *pathsCache=NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *pathCache=[pathsCache objectAtIndex:0];
//    NSLog(@"pathCache~~~~~~%@    pathsCache----%@",pathsCache,pathCache);
    /*
     pathCache~~~~~~(
     "/Users/yhj/Library/Developer/CoreSimulator/Devices/65FC33FE-6234-427B-A4F2-4F22ACE36842/data/Containers/Data/Application/823489C8-00DA-403B-95AB-76C8FBE8AAAA/Library/Caches"
     )    pathsCache----/Users/yhj/Library/Developer/CoreSimulator/Devices/65FC33FE-6234-427B-A4F2-4F22ACE36842/data/Containers/Data/Application/823489C8-00DA-403B-95AB-76C8FBE8AAAA/Library/Caches
     */


    // 读取Library目录
    NSArray *pathsLibrary=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString *pathLibrary=[pathsLibrary objectAtIndex:0];
//    NSLog(@"pathsLibrary~~~~~~%@    pathLibrary----%@",pathsLibrary,pathLibrary);
    /*
     pathsLibrary~~~~~~(
     "/Users/yhj/Library/Developer/CoreSimulator/Devices/65FC33FE-6234-427B-A4F2-4F22ACE36842/data/Containers/Data/Application/05969A2D-E6BD-4F4B-A57E-4414D987D240/Library"
     )    pathLibrary----/Users/yhj/Library/Developer/CoreSimulator/Devices/65FC33FE-6234-427B-A4F2-4F22ACE36842/data/Containers/Data/Application/05969A2D-E6BD-4F4B-A57E-4414D987D240/Library

     */

     // 读取temp文件夹
    NSString *tempDir=NSTemporaryDirectory();
//    NSLog(@"tempDir~~~%@",tempDir);
   /*
    tempDir~~~/Users/yhj/Library/Developer/CoreSimulator/Devices/65FC33FE-6234-427B-A4F2-4F22ACE36842/data/Containers/Data/Application/CEF70855-6285-46D9-B7BF-B4C9AAB1816B/tmp/

    */

    // 项目自带的.bundle资源库放在.bundle中这些资源只读不能写
    NSString *defaultDBPath=[[NSBundle mainBundle] resourcePath];
    NSLog(@"defaultDBPath~~%@",defaultDBPath);
  /*
   defaultDBPath~~/Users/yhj/Library/Developer/CoreSimulator/Devices/65FC33FE-6234-427B-A4F2-4F22ACE36842/data/Containers/Bundle/Application/D94DD7F5-0CE9-4EEF-8E47-37C4737EF2CF/IOS沙盒Files目录说明和常用操作.app
   */



    // 可以保证app的documents文件内容不备份到icloud上
    [self addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:pathDocuments]];
    return YES;
}

// 用NSURLIsExcludedFromBackupKey 或 kCFURLIsExcludedFromBackupKey 文件属性来防止文件被备份。这些API是通过通过旧的，弃用的方式的直接设置额外属性。所有运行在iOS5.1的都应该使用这些API包防止文件被备份。在iOS5 .1上防止文件被备份
-(BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([[NSFileManager defaultManager] fileExistsAtPath:[URL path]]);
    NSError *error=nil;
    BOOL success=[URL setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (!success) {
        NSLog(@"Error excluding %@ from backup %@",[URL lastPathComponent],error);
    }
    return success;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
