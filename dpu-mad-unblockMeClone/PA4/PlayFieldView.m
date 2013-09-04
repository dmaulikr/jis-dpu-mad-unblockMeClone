//
//  PlayFieldView.m
//  PA4
//
//  Created by Jibran Syed on 10/30/11.
//  
//

#import "PlayFieldView.h"
#import "SlideBlock.h"

#define FramesPerSecond (1/60)

@implementation PlayFieldView

@synthesize levelLabel;
@synthesize movesLabel;
@synthesize recordLabel;

@synthesize currentLevel;

@synthesize currentMoveCount;

@synthesize aBlackColor;

@synthesize level1Record;
@synthesize level2Record;
@synthesize level3Record;

@synthesize lev1Blk0;
@synthesize lev1Blk1;
@synthesize lev1Blk2;
@synthesize lev1Blk3;
@synthesize lev1Blk4;
@synthesize lev1Blk5;
@synthesize lev1Blk6;

@synthesize lev2Blk0;
@synthesize lev2Blk1;
@synthesize lev2Blk2;
@synthesize lev2Blk3;
@synthesize lev2Blk4;
@synthesize lev2Blk5;
@synthesize lev2Blk6;
@synthesize lev2Blk7;

@synthesize lev3Blk0;
@synthesize lev3Blk1;
@synthesize lev3Blk2;
@synthesize lev3Blk3;
@synthesize lev3Blk4;
@synthesize lev3Blk5;
@synthesize lev3Blk6;
@synthesize lev3Blk7;
@synthesize lev3Blk8;

- (id) initWithCoder: (NSCoder *) aDecoder
{
	// Initialize stuff here
	if (self = [super initWithCoder: aDecoder]) 
	{
		// The real initilization code
		
		// Game starts at level 1
		currentLevel = 1;
		
		// Best move records are some arbitrary big number when game boots
		level1Record = 1000;
		level2Record = 1000;
		level3Record = 1000;
		
		// Move count starts at 0
		currentMoveCount = 0;
		
		// Blocks are not moving you you just started
		blockWasMoving = NO;
		
		// Set motion direction for moving blocks
		motionDir = 1;
		
		// Setup a black color to use for outline drawing
		aBlackColor = [[UIColor blackColor] retain];
		
		// Setup level 1 blocks
		lev1Blk0 = [[SlideBlock alloc] initAsRedBlockAtX: X_FIELD_OFFSET + 51 
													andY: Y_FIELD_OFFSET + 101];
		
		lev1Blk1 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 1 
											   Y: Y_FIELD_OFFSET + 151 
										   width: 98
										  height: 48 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev1Blk2 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 51
											   Y: Y_FIELD_OFFSET + 201
										   width: 48
										  height: 98 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev1Blk3 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 101
											   Y: Y_FIELD_OFFSET + 151
										   width: 48
										  height: 98 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev1Blk4 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 101
											   Y: Y_FIELD_OFFSET + 251
										   width: 98
										  height: 48 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev1Blk5 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 151
											   Y: Y_FIELD_OFFSET + 51
										   width: 48
										  height: 148 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev1Blk6 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 201
											   Y: Y_FIELD_OFFSET + 51
										   width: 48 
										  height: 148 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		// Setup level 2 blocks
		
		lev2Blk0 = [[SlideBlock alloc] initAsRedBlockAtX: X_FIELD_OFFSET + 151
													andY: Y_FIELD_OFFSET + 101];
		
		lev2Blk1 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 1
											   Y: Y_FIELD_OFFSET + 1 
										   width: 148
										  height: 48 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev2Blk2 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 101
											   Y: Y_FIELD_OFFSET + 51
										   width: 48
										  height: 98 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev2Blk3 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 1
											   Y: Y_FIELD_OFFSET + 151
										   width: 148
										  height: 48
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev2Blk4 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 101
											   Y: Y_FIELD_OFFSET + 201
										   width: 48
										  height: 98 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev2Blk5 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 151
											   Y: Y_FIELD_OFFSET + 151
										   width: 48
										  height: 148 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev2Blk6 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 251
											   Y: Y_FIELD_OFFSET + 1
										   width: 48
										  height: 148 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev2Blk7 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 201
											   Y: Y_FIELD_OFFSET + 251
										   width: 98
										  height: 48 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		// Setup level 3 blocks
		
		lev3Blk0 = [[SlideBlock alloc] initAsRedBlockAtX: X_FIELD_OFFSET + 1
													andY: Y_FIELD_OFFSET + 101];
		
		lev3Blk1 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 51
											   Y: Y_FIELD_OFFSET + 201 
										   width: 48
										  height: 98 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev3Blk2 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 101
											   Y: Y_FIELD_OFFSET + 51
										   width: 48
										  height: 98 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev3Blk3 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 151
											   Y: Y_FIELD_OFFSET + 1
										   width: 48
										  height: 148 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev3Blk4 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 101
											   Y: Y_FIELD_OFFSET + 201
										   width: 98
										  height: 48
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev3Blk5 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 101
											   Y: Y_FIELD_OFFSET + 251
										   width: 98
										  height: 48 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev3Blk6 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 251
											   Y: Y_FIELD_OFFSET + 51
										   width: 48
										  height: 98 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev3Blk7 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 251
											   Y: Y_FIELD_OFFSET + 151
										   width: 48
										  height: 98 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
		lev3Blk8 = [[SlideBlock alloc] initWithX: X_FIELD_OFFSET + 201
											   Y: Y_FIELD_OFFSET + 251
										   width: 98
										  height: 48 
											 red: 1 
										   green: 1 
											blue: 0 
										   alpha: 1];
		
	}
	
	// Loads the block moving sound so that the app can use it (BlockMove.caf)
	CFURLRef url = CFBundleCopyResourceURL(CFBundleGetMainBundle(), (CFStringRef) @"BlockMove", CFSTR("caf"), NULL);
	AudioServicesCreateSystemSoundID(url, &sndBlockMoved);
	
	// Loads the level complete jungle so that the app can use it (LevelComplete.caf)
	url = CFBundleCopyResourceURL(CFBundleGetMainBundle(), (CFStringRef) @"LevelComplete", CFSTR("caf"), NULL);
	AudioServicesCreateSystemSoundID(url, &sndLevelComplete);
	
	// Loads the block hitting sound so that the app can use it (Wood Whack.wav)
	url = CFBundleCopyResourceURL(CFBundleGetMainBundle(), (CFStringRef) @"Wood Whack", CFSTR("wav"), NULL);
	AudioServicesCreateSystemSoundID(url, &sndBlockHit);
	
	// Starts the game loop by repeating it on a timer (NSTimer object)
	[NSTimer scheduledTimerWithTimeInterval: FramesPerSecond 
									 target: self 
								   selector: @selector(gameLoop) 
								   userInfo: nil 
									repeats: YES ];
	
	return self;
}

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
- (void)drawRect:(CGRect)rect
{
	// Set up the context to draw everything
    CGContextRef myContext = UIGraphicsGetCurrentContext();
	
	// Draw playfield inside main view (dark brown area)
	CGContextSetRGBFillColor(myContext, 0.495, 0.357, 0.233, 1.0);
	CGContextFillRect(myContext, CGRectMake(X_FIELD_OFFSET, Y_FIELD_OFFSET, FIELD_WIDTH, FIELD_HEIGHT));
	CGContextFillRect(myContext, CGRectMake(X_FIELD_OFFSET + 300, Y_FIELD_OFFSET + 100, 10, 50));
	
	// Draw all blocks of various levels
	if (currentLevel == 1)
	{
		// Set the fill color, coordinates, and dimensions of B0 level 1
		CGContextSetRGBFillColor(myContext, lev1Blk0.r, lev1Blk0.g, lev1Blk0.b, lev1Blk0.a);
		CGContextFillRect(myContext, CGRectMake(lev1Blk0.x, lev1Blk0.y, lev1Blk0.width, lev1Blk0.height));
	
		// Set the fill color, coordinates, and dimensions of all other blocks
		CGContextSetRGBFillColor(myContext, lev1Blk1.r, lev1Blk1.g, lev1Blk1.b, lev1Blk1.a);
		CGContextFillRect(myContext, CGRectMake(lev1Blk1.x, lev1Blk1.y, lev1Blk1.width, lev1Blk1.height));
		
		CGContextFillRect(myContext, CGRectMake(lev1Blk2.x, lev1Blk2.y, lev1Blk2.width, lev1Blk2.height));
		
		CGContextFillRect(myContext, CGRectMake(lev1Blk3.x, lev1Blk3.y, lev1Blk3.width, lev1Blk3.height));
		
		CGContextFillRect(myContext, CGRectMake(lev1Blk4.x, lev1Blk4.y, lev1Blk4.width, lev1Blk4.height));
		
		CGContextFillRect(myContext, CGRectMake(lev1Blk5.x, lev1Blk5.y, lev1Blk5.width, lev1Blk5.height));
		
		CGContextFillRect(myContext, CGRectMake(lev1Blk6.x, lev1Blk6.y, lev1Blk6.width, lev1Blk6.height));
		
		// Draw black outlines for everything
		CGContextSetStrokeColorWithColor(myContext, aBlackColor.CGColor);
		CGContextStrokeRect(myContext, CGRectMake(lev1Blk0.x, lev1Blk0.y, lev1Blk0.width, lev1Blk0.height));
		CGContextStrokeRect(myContext, CGRectMake(lev1Blk1.x, lev1Blk1.y, lev1Blk1.width, lev1Blk1.height));
		CGContextStrokeRect(myContext, CGRectMake(lev1Blk2.x, lev1Blk2.y, lev1Blk2.width, lev1Blk2.height));
		CGContextStrokeRect(myContext, CGRectMake(lev1Blk3.x, lev1Blk3.y, lev1Blk3.width, lev1Blk3.height));
		CGContextStrokeRect(myContext, CGRectMake(lev1Blk4.x, lev1Blk4.y, lev1Blk4.width, lev1Blk4.height));
		CGContextStrokeRect(myContext, CGRectMake(lev1Blk5.x, lev1Blk5.y, lev1Blk5.width, lev1Blk5.height));
		CGContextStrokeRect(myContext, CGRectMake(lev1Blk6.x, lev1Blk6.y, lev1Blk6.width, lev1Blk6.height));
	}
	else if (currentLevel == 2)
	{
		// Set the fill color, coordinates, and dimensions of B0 level 2
		CGContextSetRGBFillColor(myContext, lev2Blk0.r, lev2Blk0.g, lev2Blk0.b, lev2Blk0.a);
		CGContextFillRect(myContext, CGRectMake(lev2Blk0.x, lev2Blk0.y, lev2Blk0.width, lev2Blk0.height));
		
		// Set the fill color, coordinates, and dimensions of all other blocks
		CGContextSetRGBFillColor(myContext, lev2Blk1.r, lev2Blk1.g, lev2Blk1.b, lev2Blk1.a);
		CGContextFillRect(myContext, CGRectMake(lev2Blk1.x, lev2Blk1.y, lev2Blk1.width, lev2Blk1.height));
		
		CGContextFillRect(myContext, CGRectMake(lev2Blk2.x, lev2Blk2.y, lev2Blk2.width, lev2Blk2.height));
		
		CGContextFillRect(myContext, CGRectMake(lev2Blk3.x, lev2Blk3.y, lev2Blk3.width, lev2Blk3.height));
		
		CGContextFillRect(myContext, CGRectMake(lev2Blk4.x, lev2Blk4.y, lev2Blk4.width, lev2Blk4.height));
		
		CGContextFillRect(myContext, CGRectMake(lev2Blk5.x, lev2Blk5.y, lev2Blk5.width, lev2Blk5.height));
		
		CGContextFillRect(myContext, CGRectMake(lev2Blk6.x, lev2Blk6.y, lev2Blk6.width, lev2Blk6.height));
		
		CGContextFillRect(myContext, CGRectMake(lev2Blk7.x, lev2Blk7.y, lev2Blk7.width, lev2Blk7.height));
		
		// Draw black outlines for everything
		CGContextSetStrokeColorWithColor(myContext, aBlackColor.CGColor);
		CGContextStrokeRect(myContext, CGRectMake(lev2Blk0.x, lev2Blk0.y, lev2Blk0.width, lev2Blk0.height));
		CGContextStrokeRect(myContext, CGRectMake(lev2Blk1.x, lev2Blk1.y, lev2Blk1.width, lev2Blk1.height));
		CGContextStrokeRect(myContext, CGRectMake(lev2Blk2.x, lev2Blk2.y, lev2Blk2.width, lev2Blk2.height));
		CGContextStrokeRect(myContext, CGRectMake(lev2Blk3.x, lev2Blk3.y, lev2Blk3.width, lev2Blk3.height));
		CGContextStrokeRect(myContext, CGRectMake(lev2Blk4.x, lev2Blk4.y, lev2Blk4.width, lev2Blk4.height));
		CGContextStrokeRect(myContext, CGRectMake(lev2Blk5.x, lev2Blk5.y, lev2Blk5.width, lev2Blk5.height));
		CGContextStrokeRect(myContext, CGRectMake(lev2Blk6.x, lev2Blk6.y, lev2Blk6.width, lev2Blk6.height));
		CGContextStrokeRect(myContext, CGRectMake(lev2Blk7.x, lev2Blk7.y, lev2Blk7.width, lev2Blk7.height));
		
	}
	else
	{
		// Set the fill color, coordinates, and dimensions of B0 level 3
		CGContextSetRGBFillColor(myContext, lev3Blk0.r, lev3Blk0.g, lev3Blk0.b, lev3Blk0.a);
		CGContextFillRect(myContext, CGRectMake(lev3Blk0.x, lev3Blk0.y, lev3Blk0.width, lev3Blk0.height));
		
		// Set the fill color, coordinates, and dimensions of all other blocks
		CGContextSetRGBFillColor(myContext, lev3Blk1.r, lev3Blk1.g, lev3Blk1.b, lev3Blk1.a);
		CGContextFillRect(myContext, CGRectMake(lev3Blk1.x, lev3Blk1.y, lev3Blk1.width, lev3Blk1.height));
		
		CGContextFillRect(myContext, CGRectMake(lev3Blk2.x, lev3Blk2.y, lev3Blk2.width, lev3Blk2.height));
		
		CGContextFillRect(myContext, CGRectMake(lev3Blk3.x, lev3Blk3.y, lev3Blk3.width, lev3Blk3.height));
		
		CGContextFillRect(myContext, CGRectMake(lev3Blk4.x, lev3Blk4.y, lev3Blk4.width, lev3Blk4.height));
		
		CGContextFillRect(myContext, CGRectMake(lev3Blk5.x, lev3Blk5.y, lev3Blk5.width, lev3Blk5.height));
		
		CGContextFillRect(myContext, CGRectMake(lev3Blk6.x, lev3Blk6.y, lev3Blk6.width, lev3Blk6.height));
		
		CGContextFillRect(myContext, CGRectMake(lev3Blk7.x, lev3Blk7.y, lev3Blk7.width, lev3Blk7.height));
		
		CGContextFillRect(myContext, CGRectMake(lev3Blk8.x, lev3Blk8.y, lev3Blk8.width, lev3Blk8.height));
		
		// Draw black outlines for everything
		CGContextSetStrokeColorWithColor(myContext, aBlackColor.CGColor);
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk0.x, lev3Blk0.y, lev3Blk0.width, lev3Blk0.height));
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk1.x, lev3Blk1.y, lev3Blk1.width, lev3Blk1.height));
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk2.x, lev3Blk2.y, lev3Blk2.width, lev3Blk2.height));
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk3.x, lev3Blk3.y, lev3Blk3.width, lev3Blk3.height));
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk4.x, lev3Blk4.y, lev3Blk4.width, lev3Blk4.height));
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk5.x, lev3Blk5.y, lev3Blk5.width, lev3Blk5.height));
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk6.x, lev3Blk6.y, lev3Blk6.width, lev3Blk6.height));
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk7.x, lev3Blk7.y, lev3Blk7.width, lev3Blk7.height));
		CGContextStrokeRect(myContext, CGRectMake(lev3Blk8.x, lev3Blk8.y, lev3Blk8.width, lev3Blk8.height));
		
	}
}

- (SlideBlock *) findBlock
{
	// Find level 1 blocks in level 1
	if (currentLevel == 1)
	{
		if( (startingTouchPoint.x >= lev1Blk0.x) && startingTouchPoint.x < (lev1Blk0.x + lev1Blk0.width)  &&
		    (startingTouchPoint.y >= lev1Blk0.y) && startingTouchPoint.y < (lev1Blk0.y + lev1Blk0.height) )
		{
			return lev1Blk0;
		}
		
		else if( (startingTouchPoint.x >= lev1Blk1.x) && startingTouchPoint.x < (lev1Blk1.x + lev1Blk1.width)  &&
				 (startingTouchPoint.y >= lev1Blk1.y) && startingTouchPoint.y < (lev1Blk1.y + lev1Blk1.height) )
		{
			return lev1Blk1;
		}
		
		else if( (startingTouchPoint.x >= lev1Blk2.x) && startingTouchPoint.x < (lev1Blk2.x + lev1Blk2.width)  &&
				 (startingTouchPoint.y >= lev1Blk2.y) && startingTouchPoint.y < (lev1Blk2.y + lev1Blk2.height) )
		{
			return lev1Blk2;
		}
		
		else if( (startingTouchPoint.x >= lev1Blk3.x) && startingTouchPoint.x < (lev1Blk3.x + lev1Blk3.width)  &&
				 (startingTouchPoint.y >= lev1Blk3.y) && startingTouchPoint.y < (lev1Blk3.y + lev1Blk3.height) )
		{
			return lev1Blk3;
		}
		
		else if( (startingTouchPoint.x >= lev1Blk4.x) && startingTouchPoint.x < (lev1Blk4.x + lev1Blk4.width)  &&
				 (startingTouchPoint.y >= lev1Blk4.y) && startingTouchPoint.y < (lev1Blk4.y + lev1Blk4.height) )
		{
			return lev1Blk4;
		}
		
		else if( (startingTouchPoint.x >= lev1Blk5.x) && startingTouchPoint.x < (lev1Blk5.x + lev1Blk5.width)  &&
				 (startingTouchPoint.y >= lev1Blk5.y) && startingTouchPoint.y < (lev1Blk5.y + lev1Blk5.height) )
		{
			return lev1Blk5;
		}
		
		else if( (startingTouchPoint.x >= lev1Blk6.x) && startingTouchPoint.x < (lev1Blk6.x + lev1Blk6.width)  &&
				 (startingTouchPoint.y >= lev1Blk6.y) && startingTouchPoint.y < (lev1Blk6.y + lev1Blk6.height) )
		{
			return lev1Blk6;
		}
	}
	
	// Find level 2 blocks in level 2
	else if (currentLevel == 2)
	{
		if( (startingTouchPoint.x >= lev2Blk0.x) && startingTouchPoint.x <= (lev2Blk0.x + lev2Blk0.width)  &&
		    (startingTouchPoint.y >= lev2Blk0.y) && startingTouchPoint.y <= (lev2Blk0.y + lev2Blk0.height) )
		{
			return lev2Blk0;
		}
		
		if( (startingTouchPoint.x >= lev2Blk1.x) && startingTouchPoint.x <= (lev2Blk1.x + lev2Blk1.width)  &&
		    (startingTouchPoint.y >= lev2Blk1.y) && startingTouchPoint.y <= (lev2Blk1.y + lev2Blk1.height) )
		{
			return lev2Blk1;
		}
		
		if( (startingTouchPoint.x >= lev2Blk2.x) && startingTouchPoint.x <= (lev2Blk2.x + lev2Blk2.width)  &&
		    (startingTouchPoint.y >= lev2Blk2.y) && startingTouchPoint.y <= (lev2Blk2.y + lev2Blk2.height) )
		{
			return lev2Blk2;
		}
		
		if( (startingTouchPoint.x >= lev2Blk3.x) && startingTouchPoint.x <= (lev2Blk3.x + lev2Blk3.width)  &&
		    (startingTouchPoint.y >= lev2Blk3.y) && startingTouchPoint.y <= (lev2Blk3.y + lev2Blk3.height) )
		{
			return lev2Blk3;
		}
		
		if( (startingTouchPoint.x >= lev2Blk4.x) && startingTouchPoint.x <= (lev2Blk4.x + lev2Blk4.width)  &&
		    (startingTouchPoint.y >= lev2Blk4.y) && startingTouchPoint.y <= (lev2Blk4.y + lev2Blk4.height) )
		{
			return lev2Blk4;
		}
		
		if( (startingTouchPoint.x >= lev2Blk5.x) && startingTouchPoint.x <= (lev2Blk5.x + lev2Blk5.width)  &&
		    (startingTouchPoint.y >= lev2Blk5.y) && startingTouchPoint.y <= (lev2Blk5.y + lev2Blk5.height) )
		{
			return lev2Blk5;
		}
		
		if( (startingTouchPoint.x >= lev2Blk6.x) && startingTouchPoint.x <= (lev2Blk6.x + lev2Blk6.width)  &&
		    (startingTouchPoint.y >= lev2Blk6.y) && startingTouchPoint.y <= (lev2Blk6.y + lev2Blk6.height) )
		{
			return lev2Blk6;
		}
		
		if( (startingTouchPoint.x >= lev2Blk7.x) && startingTouchPoint.x <= (lev2Blk7.x + lev2Blk7.width)  &&
		    (startingTouchPoint.y >= lev2Blk7.y) && startingTouchPoint.y <= (lev2Blk7.y + lev2Blk7.height) )
		{
			return lev2Blk7;
		}
		
	}
	
	// Find level 3 blocks in level 3
	else
	{
		if( (startingTouchPoint.x >= lev3Blk0.x) && startingTouchPoint.x <= (lev3Blk0.x + lev3Blk0.width)  &&
		    (startingTouchPoint.y >= lev3Blk0.y) && startingTouchPoint.y <= (lev3Blk0.y + lev3Blk0.height) )
		{
			return lev3Blk0;
		}
		
		if( (startingTouchPoint.x >= lev3Blk1.x) && startingTouchPoint.x <= (lev3Blk1.x + lev3Blk1.width)  &&
		    (startingTouchPoint.y >= lev3Blk1.y) && startingTouchPoint.y <= (lev3Blk1.y + lev3Blk1.height) )
		{
			return lev3Blk1;
		}
		
		if( (startingTouchPoint.x >= lev3Blk2.x) && startingTouchPoint.x <= (lev3Blk2.x + lev3Blk2.width)  &&
		    (startingTouchPoint.y >= lev3Blk2.y) && startingTouchPoint.y <= (lev3Blk2.y + lev3Blk2.height) )
		{
			return lev3Blk2;
		}
		
		if( (startingTouchPoint.x >= lev3Blk3.x) && startingTouchPoint.x <= (lev3Blk3.x + lev3Blk3.width)  &&
		    (startingTouchPoint.y >= lev3Blk3.y) && startingTouchPoint.y <= (lev3Blk3.y + lev3Blk3.height) )
		{
			return lev3Blk3;
		}
		
		if( (startingTouchPoint.x >= lev3Blk4.x) && startingTouchPoint.x <= (lev3Blk4.x + lev3Blk4.width)  &&
		    (startingTouchPoint.y >= lev3Blk4.y) && startingTouchPoint.y <= (lev3Blk4.y + lev3Blk4.height) )
		{
			return lev3Blk4;
		}
		
		if( (startingTouchPoint.x >= lev3Blk5.x) && startingTouchPoint.x <= (lev3Blk5.x + lev3Blk5.width)  &&
		    (startingTouchPoint.y >= lev3Blk5.y) && startingTouchPoint.y <= (lev3Blk5.y + lev3Blk5.height) )
		{
			return lev3Blk5;
		}
		
		if( (startingTouchPoint.x >= lev3Blk6.x) && startingTouchPoint.x <= (lev3Blk6.x + lev3Blk6.width)  &&
		    (startingTouchPoint.y >= lev3Blk6.y) && startingTouchPoint.y <= (lev3Blk6.y + lev3Blk6.height) )
		{
			return lev3Blk6;
		}
		
		if( (startingTouchPoint.x >= lev3Blk7.x) && startingTouchPoint.x <= (lev3Blk7.x + lev3Blk7.width)  &&
		    (startingTouchPoint.y >= lev3Blk7.y) && startingTouchPoint.y <= (lev3Blk7.y + lev3Blk7.height) )
		{
			return lev3Blk7;
		}
		
		if( (startingTouchPoint.x >= lev3Blk8.x) && startingTouchPoint.x <= (lev3Blk8.x + lev3Blk8.width)  &&
		    (startingTouchPoint.y >= lev3Blk8.y) && startingTouchPoint.y <= (lev3Blk8.y + lev3Blk8.height) )
		{
			return lev3Blk8;
		}
		
	}
	
	// Return 0 if no block was touched
	return 0;
}

- (void) clampPlayField: (SlideBlock *) testBlk
{
	// Contraints blocks in view that slide horizontally
	if (testBlk.dir == slideHori)
	{
		// Constrint from the right side only
		// if it isn't a red block
		if (testBlk.redBlock == NO)
		{
			if ((testBlk.x + testBlk.width) > (X_FIELD_OFFSET + FIELD_WIDTH)) 
				testBlk.x = (X_FIELD_OFFSET + FIELD_WIDTH) - testBlk.width;
		}
		
		// Either way constraint from the left side
		if (testBlk.x < X_FIELD_OFFSET + 0)
			testBlk.x = X_FIELD_OFFSET + 0;
	}
	// Constraint blocks in view that slide vertically
	else
	{
		// Constraint from the bottom side
		if ((testBlk.y + testBlk.height) > (Y_FIELD_OFFSET + FIELD_HEIGHT)) 
			testBlk.y = (Y_FIELD_OFFSET + FIELD_HEIGHT) - testBlk.height;
		
		// Constraint from the top side
		if (testBlk.y < Y_FIELD_OFFSET + 0)
			testBlk.y = Y_FIELD_OFFSET + 0;
	}
}

- (void) updateRecord
{
	// Set new record for level 1
	if (currentLevel == 1) 
	{
		if (currentMoveCount < level1Record)
			level1Record = currentMoveCount;
	} 
	
	// Set new record for level 2
	else if (currentLevel == 2) 
	{
		if (currentMoveCount < level2Record)
			level2Record = currentMoveCount;
	}
	
	// Set new record for level 3
	else
	{
		if (currentMoveCount < level3Record)
			level3Record = currentMoveCount;
	}
}

- (void) goToNextLevel
{
	// Set highscore if needed
	[self updateRecord];
	
	// Blocks should not be moving when going to next level
	blockWasMoving = NO;
	if (blockFound)
		blockFound.movingBlock = NO;
	
	// Play level complete jingle
	AudioServicesPlaySystemSound(sndLevelComplete);
	
	// Reset move count
	currentMoveCount = 0;
	
	[self resetCurrentLevel];
	
	// Change currentLevel here
	switch (currentLevel) {
		case 1:
			currentLevel = 2;
			break;
			
		case 2:
			currentLevel = 3;
			break;
			
		case 3:
			currentLevel = 1;
			break;
	}
	
}

- (SlideBlock *) checkCollisions
{
	// Run collision system in level 1
	if (currentLevel == 1)
	{
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		CGRect intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
												   CGRectMake(lev1Blk0.x, lev1Blk0.y, lev1Blk0.width, lev1Blk0.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev1Blk0;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
												   CGRectMake(lev1Blk1.x, lev1Blk1.y, lev1Blk1.width, lev1Blk1.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev1Blk1;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev1Blk2.x, lev1Blk2.y, lev1Blk2.width, lev1Blk2.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev1Blk2;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev1Blk3.x, lev1Blk3.y, lev1Blk3.width, lev1Blk3.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev1Blk3;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev1Blk4.x, lev1Blk4.y, lev1Blk4.width, lev1Blk4.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev1Blk4;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev1Blk5.x, lev1Blk5.y, lev1Blk5.width, lev1Blk5.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev1Blk5;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev1Blk6.x, lev1Blk6.y, lev1Blk6.width, lev1Blk6.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev1Blk6;
		}
	}
	
	// Run collision system in level 2
	else if (currentLevel == 2)
	{
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		CGRect intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
												   CGRectMake(lev2Blk0.x, lev2Blk0.y, lev2Blk0.width, lev2Blk0.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev2Blk0;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev2Blk1.x, lev2Blk1.y, lev2Blk1.width, lev2Blk1.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev2Blk1;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev2Blk2.x, lev2Blk2.y, lev2Blk2.width, lev2Blk2.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev2Blk2;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev2Blk3.x, lev2Blk3.y, lev2Blk3.width, lev2Blk3.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev2Blk3;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev2Blk4.x, lev2Blk4.y, lev2Blk4.width, lev2Blk4.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev2Blk4;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev2Blk5.x, lev2Blk5.y, lev2Blk5.width, lev2Blk5.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev2Blk5;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev2Blk6.x, lev2Blk6.y, lev2Blk6.width, lev2Blk6.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev2Blk6;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev2Blk7.x, lev2Blk7.y, lev2Blk7.width, lev2Blk7.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev2Blk7;
		}
	}
	
	// Run collision system in level 3
	else
	{
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		CGRect intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
												   CGRectMake(lev3Blk0.x, lev3Blk0.y, lev3Blk0.width, lev3Blk0.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk0;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev3Blk1.x, lev3Blk1.y, lev3Blk1.width, lev3Blk1.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk1;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev3Blk2.x, lev3Blk2.y, lev3Blk2.width, lev3Blk2.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk2;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev3Blk3.x, lev3Blk3.y, lev3Blk3.width, lev3Blk3.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk3;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev3Blk4.x, lev3Blk4.y, lev3Blk4.width, lev3Blk4.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk4;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev3Blk5.x, lev3Blk5.y, lev3Blk5.width, lev3Blk5.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk5;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev3Blk6.x, lev3Blk6.y, lev3Blk6.width, lev3Blk6.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk6;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev3Blk7.x, lev3Blk7.y, lev3Blk7.width, lev3Blk7.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk7;
		}
		
		// Do collision detection between the block that is currently moving and an arbitrary block that isn't moving
		intersectRect = CGRectIntersection (CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height),
											CGRectMake(lev3Blk8.x, lev3Blk8.y, lev3Blk8.width, lev3Blk8.height));
		// Do collision resolution only if two blocks intersest 
		// and if blockFound and intersectRect are not refering to the same block
		if (!CGRectIsNull(intersectRect) && 
			!CGRectEqualToRect(CGRectMake(blockFound.x, blockFound.y, blockFound.width, blockFound.height), intersectRect))
		{
			return lev3Blk8;
		}
	}
	
	// By the time you're here, no collisions happened
	return 0;
}

- (void) resolveCollisions
{
	// Play the block hit sound
	AudioServicesPlaySystemSound(sndBlockHit);
	
	// Measures the interpenetration of two blocks
	int delta = 0;
	
	// Resolve blocks moving in positive direction
	if (motionDir == 1)
	{
		// Resolve blocks moving horizontally in postive direction
		if (blockFound.dir == slideHori)
		{
			// Calculate delta
			delta = (blockFound.x + blockFound.width) - otherBlock.x;
			
			// Move block left by delta
			blockFound.x -= delta + 1;
			
		}
		
		// Resolve blocks moving vertically in postive direction
		else
		{
			// Calculate delta
			delta = (blockFound.y + blockFound.height) - otherBlock.y;
			
			// Move block up by delta
			blockFound.y -= delta + 1;
			
		}
	}
	
	// Resolve blocks moving in negative direction
	else if (motionDir == -1)
	{
		// Resolve blocks moving horizontally in negative direction
		if (blockFound.dir == slideHori)
		{
			// Calculate delta
			delta = (otherBlock.x + otherBlock.width) - blockFound.x;
			
			// Move block right by delta
			blockFound.x += delta + 1;
			
		}
		
		// Resolve blocks moving vertically in negative direction
		else
		{
			// Calculate delta
			delta = (otherBlock.y + otherBlock.height) - blockFound.y;
			
			// Move block down by delta
			blockFound.y += delta + 1;
			
		}
	}
}

- (void) gameLoop
{
	
	// Deals with moving of blocks
	
	float delta;
	
	if (blockFound && blockFound.dir == slideHori && blockFound.movingBlock == YES)
	{
		delta = draggingTouchPoint.x - startingTouchPoint.x;
		blockFound.x += delta;
		startingTouchPoint.x = draggingTouchPoint.x;
	}
	
	if (blockFound && blockFound.dir == slideVert && blockFound.movingBlock == YES)
	{
		delta = draggingTouchPoint.y - startingTouchPoint.y;
		blockFound.y += delta;
		startingTouchPoint.y = draggingTouchPoint.y;
	}
	
	if (delta > 0.0)
		motionDir = 1;
	else if (delta < 0.0)
		motionDir = -1;
	else
		motionDir = 0;
	
	// Run collision system
	if (blockFound)
	{
		// Get the block your moving block was colliding with
		otherBlock = [self checkCollisions];
		
		// Resolve collisions with the moving block and otherBlock
		if (otherBlock != 0)
			[self resolveCollisions];
	}
	
	// Restrict moving block into playfield
	[self clampPlayField: blockFound];
	
	// Update level label
	NSString *newLevelLabel = [[NSString alloc] initWithFormat: @"%d", currentLevel];
	levelLabel.text = newLevelLabel;
	[newLevelLabel release];
	
	// Update move count label
	NSString *newMovesLabel = [[NSString alloc] initWithFormat: @"%d", currentMoveCount];
	movesLabel.text = newMovesLabel;
	[newMovesLabel release];
	
	// Update level 1 highscore label in level 1
	if (currentLevel == 1) 
	{
		if (level1Record >= 1000)
		{
			NSString *newRecordLabel = [[NSString alloc] initWithFormat: @"N/A"];
			recordLabel.text = newRecordLabel;
			[newRecordLabel release];
		}
		else
		{
			NSString *newRecordLabel = [[NSString alloc] initWithFormat: @"%d", level1Record];
			recordLabel.text = newRecordLabel;
			[newRecordLabel release];
		}
	}
	
	// Update level 2 highscore label in level 2
	else if (currentLevel == 2)
	{
		if (level2Record >= 1000)
		{
			NSString *newRecordLabel = [[NSString alloc] initWithFormat: @"N/A"];
			recordLabel.text = newRecordLabel;
			[newRecordLabel release];
		}
		else
		{
			NSString *newRecordLabel = [[NSString alloc] initWithFormat: @"%d", level2Record];
			recordLabel.text = newRecordLabel;
			[newRecordLabel release];
		}
	}
	
	// Update level 3 highscore label in level 3
	else
	{
		if (level3Record >= 1000)
		{
			NSString *newRecordLabel = [[NSString alloc] initWithFormat: @"N/A"];
			recordLabel.text = newRecordLabel;
			[newRecordLabel release];
		}
		else
		{
			NSString *newRecordLabel = [[NSString alloc] initWithFormat: @"%d", level3Record];
			recordLabel.text = newRecordLabel;
			[newRecordLabel release];
		}
	}
	
	// Check if the red block is out of the level to progress in the game
	if (currentLevel == 1) 
	{
		if (lev1Blk0.x >= (X_FIELD_OFFSET + FIELD_WIDTH - 75)) 
		{
			[self goToNextLevel];
		}
	}
	else if (currentLevel == 2)
	{
		if (lev2Blk0.x >= (X_FIELD_OFFSET + FIELD_WIDTH - 75)) 
		{
			[self goToNextLevel];
		}
	}
	else
	{
		if (lev3Blk0.x >= (X_FIELD_OFFSET + FIELD_WIDTH - 75)) 
		{
			[self goToNextLevel];
		}
	}
	
	// Refresh the graphics
	[self setNeedsDisplay];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSArray *pTouches = [touches allObjects];
	UITouch *first = [pTouches objectAtIndex: 0];
	
	CGPoint pt = [first locationInView: self];
	
	startingTouchPoint.x = pt.x;
	startingTouchPoint.y = pt.y;
	
	draggingTouchPoint.x = pt.x;
	draggingTouchPoint.y = pt.y;
	
	blockFound = [self findBlock];
	
	// If a block was found, obviously it will be moving
	if (blockFound) 
	{
		blockWasMoving = YES;
		blockFound.movingBlock = YES;
		
		// Set and reset current and previous points
		blockFound.currentPositionX = startingTouchPoint.x;
		blockFound.currentPositionY = startingTouchPoint.y;
		blockFound.previousPositionX = startingTouchPoint.x;
		blockFound.previousPositionY = startingTouchPoint.y;
	}

}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSArray *pTouches = [touches allObjects];
	UITouch *first = [pTouches objectAtIndex: 0];
	
	CGPoint pt = [first locationInView: self];
	
	draggingTouchPoint.x = pt.x;
	draggingTouchPoint.y = pt.y;
	
	if (blockFound && blockFound.movingBlock == YES) 
	{
		// Calculate offset from finger to block's origin
		int dragOffsetX = pt.x - blockFound.x;
		int dragOffsetY = pt.y - blockFound.y;
		
		// Set the previous coordinate as the current
		blockFound.previousPositionX = blockFound.currentPositionX;
		blockFound.previousPositionY = blockFound.currentPositionY;
		
		// Set the current coordinate as the draggingTouchPoint minus the drag offset
		blockFound.currentPositionX = pt.x - dragOffsetX;
		blockFound.currentPositionY = pt.y - dragOffsetY;
	}
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSArray *pTouches = [touches allObjects];
	UITouch *first = [pTouches objectAtIndex: 0];
	
	CGPoint pt = [first locationInView: self];
	
	endingTouchPoint.x = pt.x;
	endingTouchPoint.y = pt.y;
	
	if ((blockFound != 0) && (blockWasMoving))
	{
		// Only play block-move-sound if the block moved from its original location
		AudioServicesPlaySystemSound(sndBlockMoved);
	
		// Increase the amount of moves made
		currentMoveCount++;
	}
	
	blockFound.movingBlock = NO;
	
	blockFound = 0;
	
	blockWasMoving = NO;
}

- (IBAction) resetCurrentLevel
{
	// Reset move count
	currentMoveCount = 0;
	
	// Reset the position of blocks in level 1
	if (currentLevel == 1) 
	{
		lev1Blk0.x = X_FIELD_OFFSET + 51;
		lev1Blk0.y = Y_FIELD_OFFSET + 101;
		
		lev1Blk1.x = X_FIELD_OFFSET + 1;
		lev1Blk1.y = Y_FIELD_OFFSET + 151;
		
		lev1Blk2.x = X_FIELD_OFFSET + 51;
		lev1Blk2.y = Y_FIELD_OFFSET + 201;
		
		lev1Blk3.x = X_FIELD_OFFSET + 101;
		lev1Blk3.y = Y_FIELD_OFFSET + 151;
		
		lev1Blk4.x = X_FIELD_OFFSET + 101;
		lev1Blk4.y = Y_FIELD_OFFSET + 251;
		
		lev1Blk5.x = X_FIELD_OFFSET + 151;
		lev1Blk5.y = Y_FIELD_OFFSET + 51;
	
		lev1Blk6.x = X_FIELD_OFFSET + 201;
		lev1Blk6.y = Y_FIELD_OFFSET + 51;
	}
	
	// Reset the position of blocks in level 2
	else if (currentLevel == 2)
	{
		lev2Blk0.x = X_FIELD_OFFSET + 151;
		lev2Blk0.y = Y_FIELD_OFFSET + 101;
		
		lev2Blk1.x = X_FIELD_OFFSET + 1;
		lev2Blk1.y = Y_FIELD_OFFSET + 1;
		
		lev2Blk2.x = X_FIELD_OFFSET + 101;
		lev2Blk2.y = Y_FIELD_OFFSET + 51;
		
		lev2Blk3.x = X_FIELD_OFFSET + 1;
		lev2Blk3.y = Y_FIELD_OFFSET + 151;
		
		lev2Blk4.x = X_FIELD_OFFSET + 101;
		lev2Blk4.y = Y_FIELD_OFFSET + 201;
	
		lev2Blk5.x = X_FIELD_OFFSET + 151;
		lev2Blk5.y = Y_FIELD_OFFSET + 151;
		
		lev2Blk6.x = X_FIELD_OFFSET + 251;
		lev2Blk6.y = Y_FIELD_OFFSET + 1;
		
		lev2Blk7.x = X_FIELD_OFFSET + 201;
		lev2Blk7.y = Y_FIELD_OFFSET + 251;
	}
	
	// Reset the position of blocks in level 3
	else
	{
		lev3Blk0.x = X_FIELD_OFFSET + 1;
		lev3Blk0.y = Y_FIELD_OFFSET + 101;
		
		lev3Blk1.x = X_FIELD_OFFSET + 51;
		lev3Blk1.y = Y_FIELD_OFFSET + 201;
		
		lev3Blk2.x = X_FIELD_OFFSET + 101;
		lev3Blk2.y = Y_FIELD_OFFSET + 51;
		
		lev3Blk3.x = X_FIELD_OFFSET + 151;
		lev3Blk3.y = Y_FIELD_OFFSET + 1;
		
		lev3Blk4.x = X_FIELD_OFFSET + 101;
		lev3Blk4.y = Y_FIELD_OFFSET + 201;
		
		lev3Blk5.x = X_FIELD_OFFSET + 101;
		lev3Blk5.y = Y_FIELD_OFFSET + 251;
		
		lev3Blk6.x = X_FIELD_OFFSET + 251;
		lev3Blk6.y = Y_FIELD_OFFSET + 51;
		
		lev3Blk7.x = X_FIELD_OFFSET + 251;
		lev3Blk7.y = Y_FIELD_OFFSET + 151;
		
		lev3Blk8.x = X_FIELD_OFFSET + 201;
		lev3Blk8.y = Y_FIELD_OFFSET + 251;
	}
}

- (void) dealloc
{
		[lev1Blk0 release];
		[lev1Blk1 release];
		[lev1Blk2 release];
		[lev1Blk3 release];
		[lev1Blk4 release];
		[lev1Blk5 release];
		[lev1Blk6 release];
	
		[lev2Blk0 release];
		[lev2Blk1 release];
		[lev2Blk2 release];
		[lev2Blk3 release];
		[lev2Blk4 release];
		[lev2Blk5 release];
		[lev2Blk6 release];
		[lev2Blk7 release];

		[lev3Blk0 release];
		[lev3Blk1 release];
		[lev3Blk2 release];
		[lev3Blk3 release];
		[lev3Blk4 release];
		[lev3Blk5 release];
		[lev3Blk6 release];
		[lev3Blk7 release];
		[lev3Blk8 release];
	
	[levelLabel release];
	[movesLabel release];
	[recordLabel release];
	
	[aBlackColor release];
	
	[super dealloc];
}

@end
