//
//  ViewController.h
//  CatMeowApp
//
//  Created by Kevin Schanz on 3/5/24.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController {
  // A system sound object, identified with a sound file
  // you want to play.
  SystemSoundID soundID;
}

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)cat:(id)sender;

@end
