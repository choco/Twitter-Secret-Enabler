//
//  Twitter_Secret_EnablerAppDelegate.m
//  Twitter Secret Enabler
//
//  Created by Enrico Ghirardi on 10/07/11.
//  Copyright 2011 !cHoco Code. All rights reserved.
//

#import "Twitter_Secret_EnablerAppDelegate.h"

@implementation Twitter_Secret_EnablerAppDelegate

@synthesize window, emailText, moreInfoLabel, patchButton;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    INAppStoreWindow *aWindow = (INAppStoreWindow*)self.window;
    aWindow.titleBarHeight = 36;
    aWindow.trafficLightAlignment = 1;
    [self.window center];
    
    NSTextField *titleLabel;
    NSTextField *titleLabelShadow;
    NSString *titleText = @"Twitter Secret Enabler";
    
    titleLabelShadow = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 10, 240, 17)];
    [titleLabelShadow setStringValue:titleText];
    [titleLabelShadow setAlignment:NSRightTextAlignment];
    [titleLabelShadow setTextColor:[NSColor colorWithCalibratedWhite:0.9 alpha:1]];
    [titleLabelShadow setFont:[NSFont fontWithName:@"Lucida Grande" size:14]];
    [titleLabelShadow setBezeled:NO];
    [titleLabelShadow setDrawsBackground:NO];
    [titleLabelShadow setEditable:NO];
    [titleLabelShadow setSelectable:NO];
    [aWindow.titleBarView addSubview:titleLabelShadow];
    [titleLabelShadow release];

    titleLabel = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 11, 240, 17)];
    [titleLabel setStringValue:titleText];
    [titleLabel setAlignment:NSRightTextAlignment];
    [titleLabel setFont:[NSFont fontWithName:@"Lucida Grande" size:14]];
    [titleLabel setTextColor:[NSColor colorWithCalibratedWhite:0.15 alpha:1]];
    [titleLabel setBezeled:NO];
    [titleLabel setDrawsBackground:NO];
    [titleLabel setEditable:NO];
    [titleLabel setSelectable:NO];
    [aWindow.titleBarView addSubview:titleLabel];
    [titleLabel release];

    [moreInfoLabel setAllowsEditingTextAttributes:YES];
    [moreInfoLabel setSelectable:YES];
    NSURL* url = [NSURL URLWithString:@"http://twitter.com/icHoco"];
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc] init];
    [string appendAttributedString:[NSAttributedString hyperlinkFromString:@"@cHoco" withURL:url]];
    [moreInfoLabel setAttributedStringValue:string];
    [string release];
}

- (NSString *)sha1:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(cStr, (unsigned int)strlen(cStr), result);
    NSString *s = [NSString  stringWithFormat:
                   @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                   result[0], result[1], result[2], result[3], result[4],
                   result[5], result[6], result[7],
                   result[8], result[9], result[10], result[11], result[12],
                   result[13], result[14], result[15],
                   result[16], result[17], result[18], result[19]
                   ];
    return [s lowercaseString];
}

- (IBAction)startPatching:(id)sender {
    if ([[emailText stringValue] length]>0) {
        if ([self twitterIsRunning]==NO) {
            [self patchTwitterPlist];
        }
        else
            ;//TODO Tell user to close twitter app for security
    }
    else
        ;//TODO Tell user to write something in the email field :D
}

- (BOOL)twitterIsRunning
{
    //TODO Detect twitter
    return NO;
}

- (void)patchTwitterPlist
{
    NSString *licenseCode = [self calculateLicense:[emailText stringValue]];
    NSString *licenseString = [NSString stringWithFormat:@"macheist%@", licenseCode];
    NSLog(@"%@", licenseString);
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults addSuiteNamed:@"com.twitter.twitter-mac"];
    NSMutableDictionary *twitterPlist = [[defaults dictionaryRepresentation] mutableCopy];
    [twitterPlist removeObjectsForKeys:[NSArray arrayWithObjects:@"reg.email3", @"reg.license3", nil]];
    [twitterPlist setObject:[emailText stringValue] forKey:@"reg.email3"];
    [twitterPlist setObject:licenseString forKey:@"reg.license3"];
    
    [defaults registerDefaults:twitterPlist];
    [patchButton setTitle:@"Done!"];
    [patchButton setEnabled:NO];
}

- (NSString *)calculateLicense:(NSString *)email
{
    NSString *preSHA1str = [[[[NSString stringWithFormat:@"%@macheist", email] lowercaseString] componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
    NSString *afterSHA1str = [[[self sha1:preSHA1str] componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
    NSString *licenseCode;
    if ([afterSHA1str length]==8) {
        licenseCode = afterSHA1str;
    }
    else {
        licenseCode = [afterSHA1str substringToIndex:8];
    }
    return licenseCode;
}

@end