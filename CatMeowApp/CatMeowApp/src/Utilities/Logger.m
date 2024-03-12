//
//  Logger.m
//  CatMeowApp
//
//  Created by Kevin Schanz on 3/7/24.
//

#import "Logger.h"

@implementation Logger

static NSString* logFileNamePrefix = @"iospos_flavor_20240308";

+ (NSString * _Nonnull) getLogFileNamePrefix {
  return logFileNamePrefix;
}

#pragma mark Logging API Functions

/// Outputs a log message with format:
/// 24-01-10 12:00:00 [DEBUG] [TAG] > Message contents
+ (void) debug:(NSString * _Nonnull)tag message:(NSString * _Nonnull)message {
  // Reference: NSLog(@"[DEBUG] [%@] > %@", tag, message);
  NSString *content = [NSString stringWithFormat:@"[DEBUG] [%@] > %@", tag, message];
  // TODO: Figure out how to use the Getter function.
  [Logger logToFile:content fileNamePrefix:logFileNamePrefix];
}

/// Outputs a log message with format:
/// 24-02-20 12:00:00 [INFO] [TAG] > Message contents
+ (void) info:(NSString * _Nonnull)tag message:(NSString * _Nonnull)message {
  NSString *content = [NSString stringWithFormat:@"[INFO] [%@] > %@", tag, message];
  [Logger logToFile:content fileNamePrefix:logFileNamePrefix];
}

/// Outputs a log message with format:
/// 24-03-30 12:00:00 [WARN] [TAG] > Message contents
+ (void) warn:(NSString * _Nonnull)tag message:(NSString * _Nonnull)message {
  NSString *content = [NSString stringWithFormat:@"[WARN] [%@] > %@", tag, message];
  [Logger logToFile:content fileNamePrefix:logFileNamePrefix];
}

+ (id)alloc {
  [NSException raise:@"Cannot be instantiated!"
              format:@"Static class 'Logger' cannot be instantiated!"];
  return nil;
}

#pragma mark Output to File

+ (void) logToFile:(NSString * _Nonnull)content
    fileNamePrefix:(NSString * _Nonnull)fileNamePrefix {
  // TODO: This is creating a new file each time (rather than re-using an existing
  // file with today's date), so only the "last" log message is being persisted.
  NSArray *paths = NSSearchPathForDirectoriesInDomains
      (NSDocumentDirectory, NSUserDomainMask, YES);
  // TODO: Is the 'Documents' directory the best location for log files?
  NSString *documentsDir = [paths objectAtIndex:0];

  // TODO: Add a datestamp to the file name, and create a new
  // log file for each day.
  NSString *fileNameWithPath = [NSString stringWithFormat:@"%@/%@_logs.txt", documentsDir, fileNamePrefix];
  
  // TODO: Log this message once-per-minute, or another reduced frequency.
  if (YES)
  {
    // Periodically dump the location of the log file to the console, so developers
    // using Simulators can easily find it.
    NSLog(@"POS App Log File location copy command: cp %@ ~/destination/", fileNameWithPath);
  }
  
  // Datestamp prefix for every log message.
  NSDate *currentDate = [NSDate date];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"YY-MM-dd HH:mm:ss"];
  NSString *dateString = [dateFormatter stringFromDate:currentDate];
  
  NSFileManager *fileManager = [NSFileManager defaultManager];
  if ([fileManager fileExistsAtPath:fileNameWithPath])
  {
    // Append new log contents to the end of the existing file.
    NSFileHandle *logFileHandle = [NSFileHandle fileHandleForWritingAtPath:fileNameWithPath];
    [logFileHandle seekToEndOfFile];
    NSString *contentToAppend = [NSString stringWithFormat:@"\n%@ %@", dateString, content];
    [logFileHandle writeData:[contentToAppend dataUsingEncoding:NSUTF8StringEncoding]];
  }
  else
  {
    NSString *contentToCreate = [NSString stringWithFormat:@"%@ %@", dateString, content];
    // Create a new file and log contents to it.
    [contentToCreate writeToFile:fileNameWithPath
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:nil];
  }
}

@end

