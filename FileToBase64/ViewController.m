//
//  ViewController.m
//  FileToBase64
//
//  Created by mac on 2021/1/14.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.textView.editable = NO;
}


- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}


- (IBAction)onButtonClicked:(id)sender {
	NSString *path = self.pathTextField.stringValue;
	if ( path.length == 0 ) {
		[self alert:@"路径不能为空"];
		return;
	}
	BOOL isDirectory = YES;
	if ( ![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory] ) {
		[self alert:@"文件不存在"];
		return;
	}
	if ( isDirectory ) {
		[self alert:@"你选择的不是文件"];
		return;
	}
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		NSData *data = [NSData dataWithContentsOfFile:path];
		dispatch_async(dispatch_get_main_queue(), ^{
			NSString *base64 = [data base64EncodedStringWithOptions:0];
			self.textView.string = base64;
		});
	});
}

- (void)alert:(NSString *)msg {
	NSAlert *alert = [NSAlert alertWithMessageText:msg defaultButton:@"确认" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
	[alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow completionHandler:nil];
}


@end
