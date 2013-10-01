//
//  MenuScene.h
//  iOS App Dev
//
//  Created by Loli on 26.09.2013
//  Copyright(c) Loli(r) 2013. All rights reserved.
//

#import "CCScene.h"
#import "cocos2d.h"

@interface MenuScene : CCScene
{
    CCMenuItem * _finalScore;
    CCMenuItem * _message;
}
- (id)init: (int) score win:(BOOL)win;
-(void) gameOver:(int)score win:(BOOL)win;

@end

