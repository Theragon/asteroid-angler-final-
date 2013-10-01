//
//  Game.h
//  iOS App Dev
//
//  Created by Loli on 26.09.2013
//  Copyright(c) Loli(r) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "InputLayer.h"
#import "HUDLayer.h"

@class Angler;
@class Enemy;
@class Crystal;
@class HUDLayer;
@class MenuScene;
@interface GameScene : CCScene <InputLayerDelegate>
{
    CGSize _winSize;
    NSDictionary *_configuration;
//    CCLayerGradient *_skyLayer;
    CCSprite *_spaceLayer;
//    CCSprite *_spaceLayer;         //double check
//    CCSprite *deepSpace;           //double check
    CGFloat _windSpeed;
    Angler *_angler;
    Enemy *_enemy;
    Crystal *_crystal;
    HUDLayer *_hud;
    MenuScene *_menu;
    int _lives;
    int _points;
    bool _alive;
    NSMutableArray *_crystals;
    NSMutableArray *_rocks;
    ChipmunkSpace *_space;
    ccTime _accumulator;
    CCParallaxNode *_parallaxNode;
    CCParticleSystemQuad *_splashParticles;
    CCNode *_gameNode;
    BOOL _followTank;
    BOOL flying;
    CGFloat _landscapeWidth;
}

@end
