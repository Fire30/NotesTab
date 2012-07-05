
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

- (void)handleKeyboardShow:(id)fp8
{
    %orig;
    
    NSDictionary *info = [fp8 userInfo];
    NSValue *keyBounds = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    
    CGRect bndKey;
    [keyBounds getValue:&bndKey];
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, -40, bndKey.size.width + 300 , 40)];
 
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"  Tab  " style:UIBarButtonItemStyleBordered target:self action:@selector(buttonClicked)];
	NSArray *items = [[NSArray alloc] initWithObjects:barButtonItem, nil];
    toolbar.tintColor = [UIColor grayColor];
	[toolbar setItems:items];
	[items release];
    
	UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
	UIView* keyboard;
		//Get a reference of the current view 
    
		keyboard = [tempWindow.subviews objectAtIndex:0];
        [keyboard addSubview:toolbar];
   

	}

UITextView *itextView;

%new
- (void) buttonClicked
{
    NSMutableString *itext = [itextView.text mutableCopy];
    NSRange selectedRange = itextView.selectedRange;
    [itext replaceCharactersInRange:selectedRange withString:@"    "];
    itextView.text = itext;
}

/*
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range  replacementText:(NSString *)text
{
    itextView = textView;
    
    return %orig;
    
  
}
 */

- (UITextView *)textView
{
    itextView = %orig;
    
    return %orig;
}
%end