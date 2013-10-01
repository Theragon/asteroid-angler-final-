//
//  MenuScene.m
//  iOS App Dev
//
//  Created by Loli on 26.09.2013
//  Copyright(c) Loli(r) 2013. All rights reserved.
//

#import "MenuScene.h"
#import "cocos2d.h"
#import "GameScene.h"

@implementation MenuScene

- (id)init: (int) score win:(BOOL)win
{
    self = [super init];
    if (self != nil)
    {
        NSString *startString = [NSString stringWithFormat: @"Your score : %d", score];
         CGSize size = [[CCDirector sharedDirector] winSize];
        [CCMenuItemFont setFontSize:28];
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Play" fontName:@"Arial" fontSize:48];
        CCMenuItemLabel *button = [CCMenuItemLabel itemWithLabel:label block:^(id sender)
        {
            GameScene *gameScene = [[GameScene alloc] init];
            [[CCDirector sharedDirector] pushScene:gameScene];
        }];
        button.position = ccp(200, 200);
        if(score > 0){
            _finalScore = [CCMenuItemFont itemWithString:startString];
            if(win)
            {
                _message = [CCMenuItemFont itemWithString:@"You WON man!"];
            }else{
                _message = [CCMenuItemFont itemWithString:@"You died man!"];
            }
        }else{
            _finalScore = [CCMenuItemFont itemWithString:@"   "];
            _message = [CCMenuItemFont itemWithString:@"   "];
        }
        
        
        
        CCMenu *menu = [CCMenu menuWithItems:button, _finalScore, _message, nil];
        [menu alignItemsVerticallyWithPadding:10];
        menu.position = CGPointMake(size.width / 2, size.height / 2);

        [self addChild:menu];

    }
    
    return self;
}



- (void)gameOver:(int)score win:(BOOL)win
{
   // _finalScore. = [NSString stringWithFormat: @"Score : %d", score];
    MenuScene *restart = [[MenuScene alloc] init:score win:win];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:restart]];
    
   }

@end
