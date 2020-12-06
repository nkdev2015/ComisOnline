//
//  BookViewController.m
//  V-story
//
//  Created by khangfet on 5/7/14.
//  Copyright (c) 2014 5solution. All rights reserved.
//

#import "BookViewController.h"

@interface BookViewController ()

@end

@implementation BookViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message network"
                                                        message:@"This app require internet connection. Please check your network connection"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    else {
        NSLog(@"There IS internet connection");
    }
    
    
    // Do any additional setup after loading the view from its nib.
    [self loadData];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadData
{
    //Load web view data
    NSString *strWebsiteUlr = [NSString stringWithFormat:@"http://222.255.27.159:5000/?dev_code=d509d875f16a0674402e3b53ce844699"]; // URL doc truyen tranh
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:strWebsiteUlr];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [myPage setDelegate:self];
    //Load the request in the UIWebView.
    [myPage loadRequest:requestObj];
    myPage.autoresizesSubviews = YES;
    

}

-(void)viewWillAppear:(BOOL)animated
{

  [self initSize];

}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
   // myPage.scalesPageToFit = YES;//set here
    return YES;
}
-(void)initSize
{
    CGRect f = self.view.frame;
    f.origin.x = 0;
    f.origin.y = 0;
    f.size.height = self.view.frame.size.height -90;
    f.size.width = self.view.frame.size.width;
    myPage.frame = f;
	[myPage reload];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    //[self initSize];
}
-(void)moveBanner
{

    


}
@end
