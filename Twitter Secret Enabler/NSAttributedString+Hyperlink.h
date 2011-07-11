//
//  NSAttributedString+Hyperlink.h
//  Twitter Secret Enabler
//
//  Created by Enrico Ghirardi on 10/07/11.
//  Copyright 2011 !cHoco Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (NSAttributedString_Hyperlink)

+(id)hyperlinkFromString:(NSString*)inString withURL:(NSURL*)aURL;

@end
