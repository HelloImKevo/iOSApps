//
//  ViewController.m
//  CatMeowApp
//
//  Created by Kevin Schanz on 3/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  self.label.hidden = YES;
  
  NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Cat" ofType:@"wav"];
  NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
}

- (IBAction) cat: (id)sender {
  self.label.hidden = NO;
  
  AudioServicesPlaySystemSound(soundID);
  
  NSLog(@"Starting timer ...");
  [NSTimer scheduledTimerWithTimeInterval:1.3
                                   target:self
                                 selector:@selector(hideLabel)
                                 userInfo:nil
                                  repeats:NO];
}

-(void) hideLabel {
  self.label.hidden = YES;
}

@end
