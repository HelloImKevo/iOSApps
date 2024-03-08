//
//  ViewController.m
//  CatMeowApp
//
//  Created by Kevin Schanz on 3/5/24.
//

#import "ViewController.h"
#import "Logger.h"

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
  
  [Logger debug:@"ViewController.m" message:@"Playing 'Cav.wav' sound"];
  AudioServicesPlaySystemSound(soundID);
  
  [Logger info:@"ViewController.m" message:@"Starting timer for 1.3 seconds ..."];
  [NSTimer scheduledTimerWithTimeInterval:1.3
                                   target:self
                                 selector:@selector(hideLabel)
                                 userInfo:nil
                                  repeats:NO];
}

-(void) hideLabel {
  [Logger warn:@"ViewController.m" message:@"Hiding the 'Meow!!!' UI Label"];
  self.label.hidden = YES;
}

@end
