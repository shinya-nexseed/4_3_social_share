//
//  ViewController.m
//  4_3_social_share
//
//  Created by Shinya Hirai on 2015/07/29.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)activityView:(id)sender {
    
    // シェアしたいデータを配列で用意
    NSString *text = @"投稿内容";
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    NSArray *actItems = @[text,url];
    
    // Activity Viewを作る
    UIActivityViewController *AVC = [[UIActivityViewController alloc] initWithActivityItems:actItems applicationActivities:nil];
    
    // 呼び出す
    [self presentViewController:AVC animated:YES completion:nil];
}

// どうしてもFacebookでシェアしてほしい
- (IBAction)socialFramework:(id)sender {
    // Facebook投稿用のVCを定義
    SLComposeViewController *fbPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    // 投稿データ用意
    NSString *postContent = @"投稿内容";
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    UIImage *image = [UIImage imageNamed:@"shinya.jpg"];
    
    // VCに投稿データをセット
    [fbPostVC setInitialText:postContent];
    [fbPostVC addURL:url];
    [fbPostVC addImage:image];
    
    // 呼び出す
    [self presentViewController:fbPostVC animated:YES completion:nil];
}
@end
