//
//  SlideBlock.h
//  PA4
//
//  Created by Jibran Syed on 10/30/11.
//  
//

#import <Foundation/Foundation.h>

// Indicates the direction in which the block is suppose to slide
enum SlideDir 
{
	slideHori,
	slideVert
};

@interface SlideBlock : NSObject
{
	
}

// Location of the top left corner
@property (assign) CGFloat x;
@property (assign) CGFloat y;

// Dimensions of block
@property (assign) CGFloat width;
@property (assign) CGFloat height;

// Color values given in RGB
@property (assign) CGFloat r;	// Red
@property (assign) CGFloat g;	// Green
@property (assign) CGFloat b;	// Blue
@property (assign) CGFloat a;	// Alpha

// The direction which the block slides
@property (assign) enum SlideDir dir;

// Indicates if this block is the red block
// to slide out of the playfield
@property (assign) BOOL redBlock;

// Indicates if this block is moving
@property (assign) BOOL movingBlock;

// Indicates current and previous positions of a block (used in collisions)
@property (assign) CGFloat currentPositionX;
@property (assign) CGFloat currentPositionY;
@property (assign) CGFloat previousPositionX;
@property (assign) CGFloat previousPositionY;


// Custom consturctor for regular blocks
- (SlideBlock *) initWithX: (CGFloat) xVal 
						 Y: (CGFloat) yVal 
					 width: (CGFloat) wVal 
					height: (CGFloat) hVal 
					   red: (CGFloat) rVal 
					 green: (CGFloat) gVal 
					  blue: (CGFloat) bVal 
					 alpha: (CGFloat) aVal;

// Custom constructor for red blocks
- (SlideBlock *) initAsRedBlockAtX: (CGFloat) xVal andY: (CGFloat) yVal;

@end
