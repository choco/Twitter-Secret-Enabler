/*
 Twitter_Secret_EnablerAppDelegate.h
 Twitter Secret Enabler

 Created by Enrico Ghirardi on 10/07/11.

 Copyright 2011 Enrico "cHoco" Ghirardi
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this work except in compliance with the License.
 You may obtain a copy of the License in the LICENSE file, or at:
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/


#import <Cocoa/Cocoa.h>
#import <CommonCrypto/CommonDigest.h>
#import "INAppStoreWindow.h"
#import "NSAttributedString+Hyperlink.h"

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
