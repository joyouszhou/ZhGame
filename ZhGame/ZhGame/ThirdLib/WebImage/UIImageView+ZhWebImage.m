//
//  UIImageView+ZhWebImage.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/31.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "UIImageView+ZhWebImage.h"

@implementation UIImageView(ZhWebImage)

-(void)setWebImage:(NSURL *)aUrl placeHolder:(UIImage *)placeHolder downloadFlag:(int)flag
{
    [self setUserInteractionEnabled:NO];
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        [self removeGestureRecognizer:gesture];
    }
    [self.layer removeAllAnimations];
    [self setImage:placeHolder];
    UIActivityIndicatorView *ai=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    ai.tag=20000;
    [self addSubview:ai];
    [ai setCenter:self.center];
    [ai startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //没有下载过这张图片的情况下
        
        //配置下载路径
        NSString *path=[NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/%lu",(unsigned long)aUrl.description.hash];
        
        NSData *data=[NSData dataWithContentsOfFile:path];
        // NSLog(@"准备下载到沙盒路径:%@",path);
        if (!data) {
            NSLog(@"准备下载到沙盒路径:%@",path);
            data=[NSData dataWithContentsOfURL:aUrl];
            
            [data writeToFile:path atomically:YES];
        }
        UIImage *image=[UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [ai stopAnimating];
            [ai removeFromSuperview];
            //UITableViewCell
            if (self.tag==flag) {
                CATransition *trans=[[CATransition alloc]init];
                [trans setType:kCATransitionFade];
                [trans setSubtype:kCATransitionFromRight];
                [trans setDuration:0.5];
                [self.layer addAnimation:trans forKey:nil];
                [self setImage:image];
                [self setUserInteractionEnabled:YES];
                UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showBigImage:)];
                
                [self addGestureRecognizer:tap];
            }
        });
    });

}
-(void)showBigImage:(id)sender
{
    NSLog(@"");
}

@end
