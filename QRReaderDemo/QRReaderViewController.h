//
//  QRReaderViewController.h
//  YunWan
//
//  Created by 张威 on 15/1/26.
//  Copyright (c) 2015年 ZhangWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QRReaderViewControllerDelegate;

@interface QRReaderViewController : UIViewController

@property (nonatomic, assign) id<QRReaderViewControllerDelegate> delegate;

@end

@protocol QRReaderViewControllerDelegate <NSObject>

- (void)didFinishedReadingQR:(NSString *)string;

@end
