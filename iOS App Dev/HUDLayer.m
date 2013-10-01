//
//  HUDLayer.m
//  iOS App Dev
//
//  Created by Loli on 9/30/13.
//  Copyright (c) 2013 Sveinn Fannar Kristjansson. All rights reserved.
//

#import "HUDLayer.h"

@implementation HUDLayer

- (id)init {
    
    self = [super init];
        if (self){
        
        _lives = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:32];
        _score = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:32];
            


        _score.position = ccp(350, 300);
        _lives.position = ccp(100, 300);
        [self addChild:_score];
        [self addChild:_lives];
    }
    return self;
}

- (void)updateScore: (int) score
{
    _score.string = [NSString stringWithFormat: @"Score : %d", score];
}

- (void)updateLives: (int) lives
{
    _lives.string = [NSString stringWithFormat:@"Lives : %d",lives];
}

- (void)gameOver
{
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Play again" fontName:@"Arial" fontSize:48];
    CCMenuItemLabel *button = [CCMenuItemLabel itemWithLabel:label block:^(id sender)
                               {
                                   
                               }];
    
    button.position = ccp(200, 200);
    
    CCMenu *menu = [CCMenu menuWithItems:button, nil];
    menu.position = CGPointZero;
    [self addChild: menu];
}

@end