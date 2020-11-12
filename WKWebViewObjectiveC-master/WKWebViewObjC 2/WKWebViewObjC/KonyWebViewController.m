//
//  KonyWebViewController.m
//  WKWebViewObjC
//
//  Created by Abbie on 07/07/20.
//  Copyright © 2020 Abbie. All rights reserved.
//

#import "KonyWebViewController.h"
#import <WebKit/WebKit.h>

@interface KonyWebViewController ()<WKNavigationDelegate,WKUIDelegate>{
WKWebView *_konyWebLoader;
}

@end

@implementation KonyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	dispatch_async(dispatch_get_main_queue(), ^{
	_konyWebLoader = [[WKWebView alloc] initWithFrame:CGRectMake(0,[UIApplication sharedApplication].statusBarFrame.size.height + 50, self.view.frame.size.width, self.view.frame.size.height -([UIApplication sharedApplication].statusBarFrame.size.height+70))]; 
	[_konyWebLoader setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
    NSURL *url = [NSURL URLWithString: self.productURL];
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
    NSLog(@"Product URL%@", _productURL);
    NSLog(@"TItle%@", _titleName);
    [_konyWebLoader loadRequest:urlReq];
    [self.view addSubview:_konyWebLoader];
	 // do work here
    }); 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0,  [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, 50)];
    [[UINavigationBar appearance] setTitleTextAttributes:
    [NSDictionary dictionaryWithObjectsAndKeys:
     [UIColor whiteColor], NSForegroundColorAttributeName,
     [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil]];
	[myNav setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
   //[UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed: 0.40 green: 0.16 blue: 0.51 alpha: 1.00];
	
    [self.view addSubview:myNav];

    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(backButtonClicked)];

    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:_titleName];
    
    navigItem.leftBarButtonItem = cancelItem;
    myNav.items = [NSArray arrayWithObjects: navigItem,nil];

    [UIBarButtonItem appearance].tintColor = [UIColor whiteColor];
}

- (void)backButtonClicked {
	NSLog(@"Executing backButtonClicked...");
    [self.navigationController popViewControllerAnimated:YES];
}
	
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
