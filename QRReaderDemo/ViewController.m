//
//  ViewController.m
//  QRReaderDemo
//
//  Created by 张威 on 15/2/27.
//  Copyright (c) 2015年 ZhangWei. All rights reserved.
//

#import "ViewController.h"
#import "QRReaderViewController.h"

@interface ViewController () <QRReaderViewControllerDelegate>

@property (nonatomic, strong) UIButton *showQRReaderButton;
@property (nonatomic, strong) UILabel *qrReaderResultLabel;

@end

@implementation ViewController

- (void)initViewAndSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.showQRReaderButton =
    [[UIButton alloc] initWithFrame:CGRectMake(0, 100, screenWidth, 44)];
    [self.showQRReaderButton setTitle:@"Show QR Reader" forState:UIControlStateNormal];
    [self.showQRReaderButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.showQRReaderButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showQRReaderButton];
    [self.showQRReaderButton addTarget:self action:@selector(showQRReader:)
                      forControlEvents:UIControlEventTouchDown];
    
    self.qrReaderResultLabel =
    [[UILabel alloc] initWithFrame:CGRectMake(0, 200, screenWidth, 44)];
    self.qrReaderResultLabel.textAlignment = NSTextAlignmentCenter;
    self.qrReaderResultLabel.font = [UIFont systemFontOfSize:14.0];
    self.qrReaderResultLabel.textColor = [UIColor grayColor];
    self.qrReaderResultLabel.numberOfLines = 0;
    [self.view addSubview:self.qrReaderResultLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViewAndSubViews];
}

// 读二维码
- (void)showQRReader:(id)sender {
    // 扫描二维码
    // 1. init ViewController
    QRReaderViewController *VC = [[QRReaderViewController alloc] init];
    
    // 2. configure ViewController
    VC.delegate = self;
    
    // 3. show ViewController
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - QRReaderViewControllerDelegate

- (void)didFinishedReadingQR:(NSString *)string {
    NSLog(@"result string: %@", string);
    //self.qrReaderResultLabel.text = string;
    NSURL * url = [NSURL URLWithString: string];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@", @"无法解析的二维码"] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];
        [alertView show];
    }

}

@end
