//
//  ViewController.m
//  PlaygroundApp
//
//  Created by Kevin Schanz on 3/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  // Call the superclass ViewController's viewDidLoad function.
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  // Display "Banana" by default when the first first loads.
  self.label.text = @"Banana";
}

- (IBAction)pressMe:(id)sender {
  self.label.text = @"Hello";
}

@end
