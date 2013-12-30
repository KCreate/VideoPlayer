//
//  AppDelegate.h
//  VideoPlayer
//
//  Created by Leonard Schuetz on 28.12.13.
//  Copyright (c) 2013 Leonard Schuetz. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <VideoToolbox/VideoToolbox.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet WebView *webview;
    IBOutlet NSPopUpButton *popupbutton;
    
    NSMutableArray *videoIDs;
}

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain) IBOutlet WebView *webview;
@property (nonatomic, retain) IBOutlet NSButton *load;
@property (nonatomic, retain) IBOutlet NSTextField *textfield;
@property (nonatomic, retain) IBOutlet NSPopUpButton *popupbutton;

-(IBAction)loadURL:(id)sender;
-(IBAction)update:(id)sender;

@end
