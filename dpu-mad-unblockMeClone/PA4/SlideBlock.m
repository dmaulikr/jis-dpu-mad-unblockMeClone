//
//  SlideBlock.m
//  PA4
//
//  Created by Jibran Syed on 10/30/11.
//  
//

#import "SlideBlock.h"

@implementation SlideBlock

// CGFloat
@synthesize x;
@synthesize y;

// CGFloat
@synthesize width;
@synthesize height;

// CGFloat
@synthesize r;
@synthesize g;
@synthesize b;
@synthesize a;

// CGPoint
@synthesize currentPositionX;
@synthesize currentPositionY;
@synthesize previousPositionX;
@synthesize previousPositionY;

// enum SlideDir
@synthesize dir;

// BOOL
@synthesize redBlock;
@synthesize movingBlock;

- (SlideBlock *) initWithX:(CGFloat)xVal 
						 Y:(CGFloat)yVal 
					 width:(CGFloat)wVal 
					height:(CGFloat)hVal 
					   red:(CGFloat)rVal 
					 green:(CGFloat)gVal 
					  blue:(CGFloat)bVal 
					 alpha:(CGFloat)aVal
{
	// Call super method first
	self = [super init];
	
	if (self) 
	{
		// Setup given values
		self.x = xVal;
		self.y = yVal;
		self.width = wVal;
		self.height = hVal;
		self.r = rVal;
		self.g = gVal;
		self.b = bVal;
		self.a = aVal;
		
		// Set the direction of the block
		// based on which side is 50 px long
		// (assumes that either the width or
		//  height are 50 px long)
		if (hVal == 48) 
			self.dir = slideHori;	// If the height is 50 px, slide horizontally
		else 
			self.dir = slideVert;   // If the width is 50 px, slide vertically
		
		// We are not initilizing a red block
		self.redBlock = NO;
		
		// Blocks don't move by default
		self.movingBlock = NO;
	}
	
	return self;
}

- (SlideBlock *) initAsRedBlockAtX: (CGFloat) xVal andY: (CGFloat) yVal
{
	// Call super mehtod
	self = [super init];
	
	if (self) 
	{
		// Setup given values
		// and default values for red blocks
		self.x = xVal;
		self.y = yVal;
		self.width = 98;
		self.height = 48;
		self.r = 1;
		self.g = 0;
		self.b = 0;
		self.a = 1;
		
		// Red blocks always slide horzontally
		self.dir = slideHori;
		
		// This is a red block
		self.redBlock = YES;
		
		// Blocks don't move by default
		self.movingBlock = NO;
	}
	
	return self;
}

@end
