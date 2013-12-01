//
//  UIWebView+RefreshControl.h
//  SWPullRefreshWebView
//
//  Created by Snow on 12/1/13.
//  Copyright (c) 2013 RbBtSn0w. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (RefreshControl)<UIScrollViewDelegate>

@property (nonatomic,retain) UIRefreshControl *refreshControl NS_AVAILABLE_IOS(6_0);


@end