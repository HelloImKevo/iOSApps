//
//  Logger.h
//  CatMeowApp
//
//  Created by Kevin Schanz on 3/7/24.
//

#import <Foundation/Foundation.h>

#ifndef Logger_h
#define Logger_h

@interface Logger : NSObject

#pragma mark Methods

+ (NSString* _Nonnull) getLogFileNamePrefix;

/// Create a DEBUG-level log message.
+ (void) debug:(NSString* _Nonnull)tag message:(NSString* _Nonnull)message;

/// Create an INFO-level log message.
+ (void) info:(NSString* _Nonnull)tag message:(NSString* _Nonnull)message;

/// Create a WARN-level log message.
+ (void) warn:(NSString* _Nonnull)tag message:(NSString* _Nonnull)message;

// TODO: Move this to a FileHelper utils class.
+ (void) logToFile:(NSString* _Nonnull)content fileNamePrefix:(NSString* _Nonnull)fileNamePrefix;

#endif /* Logger_h */

@end
