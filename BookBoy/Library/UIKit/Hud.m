//
//  Hud.m
//  BookStore
//
//  Created by 龙格 on 2019/7/13.
//  Copyright © 2019 Paul Gao. All rights reserved.
//

#import "Hud.h"
#import "MBProgressHUD.h"

@interface Hud ()
@property (nonatomic, strong) MBProgressHUD *hud;
@end

static Hud *_manager = nil;
@implementation Hud

+ (Hud *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[Hud alloc] init];
    });
    return _manager;
}

+ (void)showHit:(NSString *)mesg {
    [[Hud sharedInstance] showMessage:mesg hideAfter:1.5];
}
+ (void)showHit:(NSString *)mesg hideAfter:(NSInteger)interval {
    [[Hud sharedInstance] showMessage:mesg hideAfter:interval];
}
+ (void)showCompleteHit:(NSString *)mesg {
    //暂时
    [Hud showHit:mesg];
}
+ (void)showErrorHit:(NSString *)mesg {
    [Hud showHit:mesg];
}
+ (void)showLoading {
    [[Hud sharedInstance] showWaiting:@"" hideAfter:1.5];
}
+ (void)showLoadingMesg:(NSString *)mesg {
    [[Hud sharedInstance] showWaiting:mesg hideAfter:1.5];
}
+ (void)hideAllHud {
    [[Hud sharedInstance].hud removeFromSuperview];
}


#pragma mark - Private Method

- (void)showMessage:(NSString *)mesg hideAfter:(NSTimeInterval)interval {
    if (self.hud) [self removeAllHud];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = mesg;
    [hud hideAnimated:YES afterDelay:interval];
    self.hud = hud;
}

- (void)showWaiting:(NSString *)mesg hideAfter:(NSTimeInterval)interval {
    if (self.hud) [self removeAllHud];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.detailsLabel.text = mesg;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.detailsLabel.textColor = UIColor.whiteColor;
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud hideAnimated:YES afterDelay:interval];
    self.hud  = hud;
}

- (void)removeAllHud{
    [self.hud removeFromSuperview];
}

@end
