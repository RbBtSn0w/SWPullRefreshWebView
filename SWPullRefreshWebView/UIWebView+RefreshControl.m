//
//  UIWebView+RefreshControl.m
//  SWPullRefreshWebView
//
//  Created by Snow on 12/1/13.
//  Copyright (c) 2013 RbBtSn0w. All rights reserved.
//

#import "UIWebView+RefreshControl.h"
#import <objc/runtime.h>

NSString * const kSWStyleKey = @"kSWStyleKey";

@implementation UIWebView (RefreshControl)

-(void) setRefreshControl:(UIRefreshControl*)refreshControl{
    
    refreshControl.frame = CGRectMake(0, -70, 320, 60);
    
    UIScrollView *currentScrollView;
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            currentScrollView = (UIScrollView*)subView;
            currentScrollView.delegate = self;
            [currentScrollView addSubview:refreshControl];
            
        }
    }
    
    objc_setAssociatedObject(self, (__bridge const void *)(kSWStyleKey), refreshControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIRefreshControl*) refreshControl{
    return  objc_getAssociatedObject(self, (__bridge const void *)(kSWStyleKey));
}


#pragma mark    - UIScrollView Delegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

}
@end
