#line 1 "/Users/tj/Documents/iOS Development/NotesTab/NotesTab/NotesTab.xm"











#import <CoreGraphics/CGGeometry.h>
#include "UIKit/UIKit.h"
#include "Corefoundation/CoreFoundation.h"


#include <substrate.h>
@class NoteContentLayer; 
static void (*_logos_orig$_ungrouped$NoteContentLayer$handleKeyboardShow$)(NoteContentLayer*, SEL, id); static void _logos_method$_ungrouped$NoteContentLayer$handleKeyboardShow$(NoteContentLayer*, SEL, id); static void _logos_method$_ungrouped$NoteContentLayer$buttonClicked(NoteContentLayer*, SEL); static BOOL (*_logos_orig$_ungrouped$NoteContentLayer$textView$shouldChangeTextInRange$replacementText$)(NoteContentLayer*, SEL, UITextView *, NSRange, NSString *); static BOOL _logos_method$_ungrouped$NoteContentLayer$textView$shouldChangeTextInRange$replacementText$(NoteContentLayer*, SEL, UITextView *, NSRange, NSString *); 

#line 17 "/Users/tj/Documents/iOS Development/NotesTab/NotesTab/NotesTab.xm"



static void _logos_method$_ungrouped$NoteContentLayer$handleKeyboardShow$(NoteContentLayer* self, SEL _cmd, id fp8) {
    _logos_orig$_ungrouped$NoteContentLayer$handleKeyboardShow$(self, _cmd, fp8);
    
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
		
    
		keyboard = [tempWindow.subviews objectAtIndex:0];
        [keyboard addSubview:toolbar];

	}

UITextView *itextView;



static void _logos_method$_ungrouped$NoteContentLayer$buttonClicked(NoteContentLayer* self, SEL _cmd) {
    NSMutableString *itext = [itextView.text mutableCopy];
    NSRange selectedRange = itextView.selectedRange;
    [itext replaceCharactersInRange:selectedRange withString:@"    "];
    itextView.text = itext;
}


static BOOL _logos_method$_ungrouped$NoteContentLayer$textView$shouldChangeTextInRange$replacementText$(NoteContentLayer* self, SEL _cmd, UITextView * textView, NSRange range, NSString * text) {
    itextView = textView;
    
    return _logos_orig$_ungrouped$NoteContentLayer$textView$shouldChangeTextInRange$replacementText$(self, _cmd, textView, range, text);
    
  
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NoteContentLayer = objc_getClass("NoteContentLayer"); MSHookMessageEx(_logos_class$_ungrouped$NoteContentLayer, @selector(handleKeyboardShow:), (IMP)&_logos_method$_ungrouped$NoteContentLayer$handleKeyboardShow$, (IMP*)&_logos_orig$_ungrouped$NoteContentLayer$handleKeyboardShow$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$NoteContentLayer, @selector(buttonClicked), (IMP)&_logos_method$_ungrouped$NoteContentLayer$buttonClicked, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$NoteContentLayer, @selector(textView:shouldChangeTextInRange:replacementText:), (IMP)&_logos_method$_ungrouped$NoteContentLayer$textView$shouldChangeTextInRange$replacementText$, (IMP*)&_logos_orig$_ungrouped$NoteContentLayer$textView$shouldChangeTextInRange$replacementText$);}  }
#line 67 "/Users/tj/Documents/iOS Development/NotesTab/NotesTab/NotesTab.xm"
