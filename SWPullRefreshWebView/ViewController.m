//
//  ViewController.m
//  SWPullRefreshWebView
//
//  Created by Snow on 12/1/13.
//  Copyright (c) 2013 RbBtSn0w. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+RefreshControl.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *pullWebView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = self.view.frame;
    self.pullWebView = [[UIWebView alloc] initWithFrame:frame];
    self.pullWebView.delegate = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(helloWorld:) forControlEvents:UIControlEventValueChanged];
    [self.pullWebView setRefreshControl:refreshControl];
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.pullWebView loadRequest:request];
    [self.view addSubview:self.pullWebView];
    [self.pullWebView reload];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark    - UIWebViewDelegate

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //[self.pullWebView.refreshControl endRefreshing];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //[self.pullWebView.refreshControl endRefreshing];
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    
}


#pragma mark    - Help Methods

- (void)helloWorld:(id)sender{
    //** Model: Test
    NSLog(@"Loading data...");
    [self performSelector:@selector(helloEnd:) withObject:sender afterDelay:2.0];
     //*/
    [self.pullWebView reload];
}

- (void)helloEnd:(id)sender{
    ///** Model: Test
    NSLog(@"Finish.");
    [self.pullWebView.refreshControl endRefreshing];
    //*/
    
    
}



@end
