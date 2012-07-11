// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos
/*
 #error iOSOpenDev post-project creation from template requirements (remove these lines after completed) -- \
 Link to libsubstrate.dylib: \
 (1) go to TARGETS > Build Phases > Link Binary With Libraries and add /opt/iOSOpenDev/lib/libsubstrate.dylib \
 (2) remove these lines from *.xm files (not *.mm files as they're automatically generated from *.xm files)
 
 */

#import <CoreGraphics/CGGeometry.h>
#include "UIKit/UIKit.h"
#include "Corefoundation/CoreFoundation.h"


%hook NoteContentLayer

UITextView *itextView;

- (void)handleKeyboardShow:(id)fp8
{
    %orig;
    
    NSDictionary *info = [fp8 userInfo];
    NSValue *keyBounds = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    
    CGRect bndKey;
    [keyBounds getValue:&bndKey];
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, -40, 9001 , 40)];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"  Tab  " style:UIBarButtonItemStyleBordered target:self action:@selector(buttonClicked)];
	NSArray *items = [[NSArray alloc] initWithObjects:barButtonItem, nil];
    toolbar.tintColor = [UIColor grayColor];
	[toolbar setItems:items];
	[items release];
    
	UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
	UIView* keyboard;
    
    keyboard = [tempWindow.subviews objectAtIndex:0];
    [keyboard addSubview:toolbar];
    
    
}


- (UITextView *)textView
{
    itextView = %orig;
    
    return %orig;
}

NSMutableString *itext;
NSRange selectedRange;

%new

- (void) buttonClicked
{
    
    itext = [itextView.text mutableCopy];
    selectedRange = itextView.selectedRange;
    itextView.selectedRange = selectedRange;

    
    [itext insertString:@"\t" atIndex:selectedRange.location];
    itextView.selectedRange = selectedRange;
    itextView.text = itext;
    
    
    selectedRange.location = selectedRange.location + 1;// it is the next character. Since we just inputted a tab it will go to the end of the tab. 
    itextView.selectedRange = selectedRange;
    [NSTimer scheduledTimerWithTimeInterval:.07 target:self selector:@selector(scrolling) userInfo:nil repeats:NO];

}
%new

- (void) scrolling
{
   [itextView scrollRangeToVisible:itextView.selectedRange]; 
}

%end