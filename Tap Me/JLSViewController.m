//
//  JLSViewController.m
//  Tap Me
//
//  Created by Rhenz Salvador on 5/18/14.
//  Copyright (c) 2014 JLCS. All rights reserved.
//

#import "JLSViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface JLSViewController ()

@end

@implementation JLSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //rounded button
    self.tapButtonAgain.layer.cornerRadius = self.tapButtonAgain.bounds.size.width/10.0;
    self.tapButtonAgain.layer.borderWidth = .5;
    self.tapButtonAgain.layer.borderColor = self.tapButtonAgain.titleLabel.textColor.CGColor;
    
    [self setupGame];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(UIButton *)sender {
    self.count++;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score %i",self.count];
}

- (void) setupGame {
    self.seconds = 30;
    self.count = 0;
    
    self.timerLabel.text = [NSString stringWithFormat:@"Time: %i", self.seconds];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.count];
    
    //Timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(subtractTime)
                                                userInfo:nil repeats:YES];
}

- (void) subtractTime {
    
    self.seconds--;
    self.timerLabel.text = [NSString stringWithFormat:@"Time: %i",self.seconds];
    
    if (self.seconds == 0) {
        [self.timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time's UP!" message:[NSString stringWithFormat:@"You scored %i points!",self.count] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alert show];
    }
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}
@end
