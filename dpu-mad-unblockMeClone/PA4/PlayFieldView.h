//
//  PlayFieldView.h
//  PA4
//
//  Created by Jibran Syed on 10/30/11.
//  
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>

#define X_FIELD_OFFSET 10
#define Y_FIELD_OFFSET 80
#define FIELD_WIDTH 300
#define FIELD_HEIGHT 300

@class SlideBlock;

@interface PlayFieldView : UIView
{
	// Points to the current block being touched
	SlideBlock *blockFound;
	
	// Points to the block that the moving block is colliding with
	SlideBlock *otherBlock;
	
	// Direction of sliding (either 1 or -1)
	int motionDir;
	
	// Location of the finger when touching screen
	CGPoint startingTouchPoint;
	CGPoint draggingTouchPoint;
	CGPoint endingTouchPoint;
	
	// Links to sound effects
	SystemSoundID sndBlockMoved;
	SystemSoundID sndLevelComplete;
	SystemSoundID sndBlockHit;
	
	// Checks whether a block was moving or not
	BOOL blockWasMoving;
}

// Outlets for the game data (level, moves, highscore/record)
@property (nonatomic, retain) IBOutlet UILabel *levelLabel;
@property (nonatomic, retain) IBOutlet UILabel *movesLabel;
@property (nonatomic, retain) IBOutlet UILabel *recordLabel;

// All blocks in the game
@property (nonatomic, retain) SlideBlock *lev1Blk0;
@property (nonatomic, retain) SlideBlock *lev1Blk1;
@property (nonatomic, retain) SlideBlock *lev1Blk2;
@property (nonatomic, retain) SlideBlock *lev1Blk3;
@property (nonatomic, retain) SlideBlock *lev1Blk4;
@property (nonatomic, retain) SlideBlock *lev1Blk5;
@property (nonatomic, retain) SlideBlock *lev1Blk6;

@property (nonatomic, retain) SlideBlock *lev2Blk0;
@property (nonatomic, retain) SlideBlock *lev2Blk1;
@property (nonatomic, retain) SlideBlock *lev2Blk2;
@property (nonatomic, retain) SlideBlock *lev2Blk3;
@property (nonatomic, retain) SlideBlock *lev2Blk4;
@property (nonatomic, retain) SlideBlock *lev2Blk5;
@property (nonatomic, retain) SlideBlock *lev2Blk6;
@property (nonatomic, retain) SlideBlock *lev2Blk7;

@property (nonatomic, retain) SlideBlock *lev3Blk0;
@property (nonatomic, retain) SlideBlock *lev3Blk1;
@property (nonatomic, retain) SlideBlock *lev3Blk2;
@property (nonatomic, retain) SlideBlock *lev3Blk3;
@property (nonatomic, retain) SlideBlock *lev3Blk4;
@property (nonatomic, retain) SlideBlock *lev3Blk5;
@property (nonatomic, retain) SlideBlock *lev3Blk6;
@property (nonatomic, retain) SlideBlock *lev3Blk7;
@property (nonatomic, retain) SlideBlock *lev3Blk8;

// Black UIColor object
@property (nonatomic, retain) UIColor *aBlackColor;

// Current level of the game
@property (assign) int currentLevel;

// Count for the amount of moved made in a level
@property (assign) int currentMoveCount;

// Highscores for all levels (only applies every time the app boots)
@property (assign) int level1Record;
@property (assign) int level2Record;
@property (assign) int level3Record;

// Returns the block being touched currently
- (SlideBlock *) findBlock;

// The main loop of the game
- (void) gameLoop;

// Keeps blocks within PlayFieldView
- (void) clampPlayField: (SlideBlock *) testBlk;

// Updates the highscore
- (void) updateRecord;

// Advances player to next level (unless if on the last level)
- (void) goToNextLevel;

// Checks for collisions and resolves collisions
- (SlideBlock *) checkCollisions;
- (void) resolveCollisions;

// Resets the positions of blocks depending on level
- (IBAction) resetCurrentLevel;

@end
