//
//  HUDLayer.h
//  iOS App Dev
//
//  Created by Loli on 9/30/13.
//  Copyright (c) 2013 Sveinn Fannar Kristjansson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface HUDLayer : CCLayer {
    CCLabelBMFont * _score;
    CCLabelBMFont * _lives;
}

- (void)updateScore: (int) score;
- (void)updateLives: (int) lives;
- (void)gameOver;


@end