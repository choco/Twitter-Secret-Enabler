//
//  NSAttributedString+Hyperlink.m
//  Twitter Secret Enabler
//
//  Created by Enrico Ghirardi on 10/07/11.
//  Copyright 2011 !cHoco Code. All rights reserved.
//

#import "NSAttributedString+Hyperlink.h"

@implementation NSAttributedString (Hyperlink)

+(id)hyperlinkFromString:(NSString*)inString withURL:(NSURL*)aURL
{
    NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString:inString];
    NSRange range = NSMakeRange(0, [attrString length]);
    
    [attrString beginEditing];
    [attrString addAttribute:NSLinkAttributeName value:[aURL absoluteString] range:range];
    
    // make the text appear in blue
    [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:range];
    
    [attrString addAttribute:NSCursorAttributeName value:[NSCursor pointingHandCursor] range:range];
    
    [attrString addAttribute:NSFontAttributeName value:[NSFont fontWithName:@"Lucida Grande" size:13] range:range];
    
    // next make the text appear with an underline
    [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSSingleUnderlineStyle] range:range];
    
    [attrString endEditing];    
    
    return [attrString autorelease];
}
@end