/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComChrisryuSimpletweetModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation ComChrisryuSimpletweetModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"522a4ad0-d0eb-4c84-b433-8937541b318f";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.chrisryu.simpletweet";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs
-(void)showTweetWindow:(id) args
{
    ENSURE_UI_THREAD(showTweetWindow, args);
    ENSURE_ARG_COUNT(args, 1);
    id value = [args objectAtIndex:0];
    ENSURE_STRING(value);
    
    TiApp * tiApp = [TiApp app];
    
    TWTweetComposeViewController *tweetViewController = [[TWTweetComposeViewController alloc] init];
    
    [tweetViewController setInitialText:value];
    
    [tweetViewController setCompletionHandler:^(TWTweetComposeViewControllerResult result) {

        // TODO check result
        switch (result) {
            case TWTweetComposeViewControllerResultCancelled:
                break;
            case TWTweetComposeViewControllerResultDone:
                break;
            default:
                break;
        }
        [tiApp hideModalController:tweetViewController animated:YES];
    }];
    [tiApp showModalController:tweetViewController animated:YES];
}



@end
