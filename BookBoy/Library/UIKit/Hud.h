//
//  Hud.h
//  BookStore
//
//  Created by 龙格 on 2019/7/13.
//  Copyright © 2019 Paul Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Hud : NSObject

+ (void)showHit:(NSString *)mesg;
+ (void)showHit:(NSString *)mesg hideAfter:(NSInteger)interval;
+ (void)showCompleteHit:(NSString *)mesg;
+ (void)showErrorHit:(NSString *)mesg;
+ (void)showLoading;
+ (void)showLoadingMesg:(NSString *)mesg;
+ (void)hideAllHud;

@end

NS_ASSUME_NONNULL_END
