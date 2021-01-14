//
//  ViewController.h
//  FileToBase64
//
//  Created by mac on 2021/1/14.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *pathTextField;
@property (weak) IBOutlet NSScrollView *scrollview;
@property (unsafe_unretained) IBOutlet NSTextView *textView;

@end

