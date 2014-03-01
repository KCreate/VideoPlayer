#import "AppDelegate.h"

@implementation AppDelegate
@synthesize webview;
@synthesize load;
@synthesize textfield;
@synthesize popupbutton;
@synthesize window;

//Initialized UserDefaults Values
//      videoIDs            - NSArray
//      notFirstRun         - bool

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"applicationDidFinishLaunching");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"notFirstRun"]) {
        NSLog(@"First run!");
        [defaults setBool:YES forKey:@"notFirstRun"];
        
        //Initialize the array
        videoIDs = [[NSMutableArray alloc] initWithObjects:@"Videos", @"E2VCwBzGdPM", nil];
        [defaults setObject:videoIDs forKey:@"videoIDs"];
        [popupbutton removeAllItems];
        [popupbutton addItemsWithTitles:videoIDs];
    } else {
        NSLog(@"Not first run!");
        [defaults setBool:YES forKey:@"notFirstRun"];
        //Initialize the array
        videoIDs = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"videoIDs"]];
        [defaults setObject:videoIDs forKey:@"videoIDs"];
        [popupbutton removeAllItems];
        [popupbutton addItemsWithTitles:videoIDs];
    }
    
    [window setLevel:NSFloatingWindowLevel];
}

-(IBAction)loadURL:(id)sender {
    NSLog(@"Load button got pressed");
    [self loadURL_v];
}

- (IBAction)update:(id)sender {
    NSLog(@"NSPopUpButton update");
    //Get's called when the popupbutton get's changed
    [textfield setStringValue:[popupbutton titleOfSelectedItem]];
    [self loadURL_v];
}

-(void)loadURL_v {
    NSLog(@"URL loads");
    NSString *VIDEO_ID = textfield.stringValue;
    NSString *VIDEO_BaseURL = @"http://www.youtube.com/embed/";
    NSString *VIDEO_URL = [NSString stringWithFormat:@"%@%@", VIDEO_BaseURL, VIDEO_ID];
    
    NSURL *VIDEO_URLtl = [NSURL URLWithString:VIDEO_URL];
    [[webview mainFrame] loadRequest:[NSURLRequest requestWithURL:VIDEO_URLtl]];
    
    //Add the textfieldvalue to the popupbutton
    [popupbutton addItemWithTitle:[textfield stringValue]];
    
    //Save videoIDs
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    videoIDs = [[NSMutableArray alloc] initWithArray:[popupbutton itemTitles]];
    [defaults setObject:videoIDs forKey:@"videoIDs"];
}

@end