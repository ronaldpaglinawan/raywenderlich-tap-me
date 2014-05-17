//
//  JLSViewController.h
//  Tap Me
//
//  Created by Rhenz Salvador on 5/18/14.
//  Copyright (c) 2014 JLCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLSViewController : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIButton *tapButtonAgain;
@property (nonatomic) NSInteger count;
@property (nonatomic) NSInteger seconds;
@property (nonatomic) NSTimer *timer;

- (IBAction)tapButton:(UIButton *)sender;
@end
