/*
 NSAttributedString+Hyperlink.m
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

#import "NSAttributedString+Hyperlink.h"

@implementation NSAttributedString (NSAttributedString_Hyperlink)

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
