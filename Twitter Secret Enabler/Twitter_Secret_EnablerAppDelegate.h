//
//  Twitter_Secret_EnablerAppDelegate.h
//  Twitter Secret Enabler
//
//  Created by Enrico Ghirardi on 10/07/11.
//  Copyright 2011 !cHoco Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CommonCrypto/CommonDigest.h>
#import "INAppStoreWindow.h"

@interface Twitter_Secret_EnablerAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow  *window;
    NSTextField *emailText;
    NSTextField *moreInfoLabel;
    NSButton *patchButton;
}

@property (retain) IBOutlet NSButton *patchButton;
@property (retain) IBOutlet NSTextField *emailText;
@property (retain) IBOutlet NSTextField *moreInfoLabel;
@property (assign) IBOutlet NSWindow *window;

- (IBAction)startPatching:(id)sender;
- (NSString *)calculateLicense:(NSString *)email;
- (NSString *)sha1:(NSString *)str;
- (BOOL)twitterIsRunning;
- (void)patchTwitterPlist;

@end
