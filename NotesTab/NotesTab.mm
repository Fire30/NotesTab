#line 1 "/Users/tj/Documents/iOS Development/NotesTab/NotesTab/NotesTab.xm"











#import <CoreGraphics/CGGeometry.h>
#include "UIKit/UIKit.h"
#include "Corefoundation/CoreFoundation.h"


#include <substrate.h>
@class NoteContentLayer; 
static void (*_logos_orig$_ungrouped$NoteContentLayer$handleKeyboardShow$)(NoteContentLayer*, SEL, id); static void _logos_method$_ungrouped$NoteContentLayer$handleKeyboardShow$(NoteContentLayer*, SEL, id); static UITextView * (*_logos_orig$_ungrouped$NoteContentLayer$textView)(NoteContentLayer*, SEL); static UITextView * _logos_method$_ungrouped$NoteContentLayer$textView(NoteContentLayer*, SEL); static void _logos_method$_ungrouped$NoteContentLayer$buttonClicked(NoteContentLayer*, SEL); 

#line 17 "/Users/tj/Documents/iOS Development/NotesTab/NotesTab/NotesTab.xm"


UITextView *itextView;


static void _logos_method$_ungrouped$NoteContentLayer$handleKeyboardShow$(NoteContentLayer* self, SEL _cmd, id fp8) {
    _logos_orig$_ungrouped$NoteContentLayer$handleKeyboardShow$(self, _cmd, fp8);
    
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



static UITextView * _logos_method$_ungrouped$NoteContentLayer$textView(NoteContentLayer* self, SEL _cmd) {
    itextView = _logos_orig$_ungrouped$NoteContentLayer$textView(self, _cmd);
    
    return _logos_orig$_ungrouped$NoteContentLayer$textView(self, _cmd);
}




static void _logos_method$_ungrouped$NoteContentLayer$buttonClicked(NoteContentLayer* self, SEL _cmd) {
    NSMutableString *itext = [itextView.text mutableCopy];
    NSRange selectedRange = itextView.selectedRange;
    [itext replaceCharactersInRange:selectedRange withString:@"\t"];
    itextView.text = itext;
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NoteContentLayer = objc_getClass("NoteContentLayer"); MSHookMessageEx(_logos_class$_ungrouped$NoteContentLayer, @selector(handleKeyboardShow:), (IMP)&_logos_method$_ungrouped$NoteContentLayer$handleKeyboardShow$, (IMP*)&_logos_orig$_ungrouped$NoteContentLayer$handleKeyboardShow$);MSHookMessageEx(_logos_class$_ungrouped$NoteContentLayer, @selector(textView), (IMP)&_logos_method$_ungrouped$NoteContentLayer$textView, (IMP*)&_logos_orig$_ungrouped$NoteContentLayer$textView);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$NoteContentLayer, @selector(buttonClicked), (IMP)&_logos_method$_ungrouped$NoteContentLayer$buttonClicked, _typeEncoding); }}  }
#line 69 "/Users/tj/Documents/iOS Development/NotesTab/NotesTab/NotesTab.xm"
