//
//  Tank.m
//  iOS App Dev
//
//  Created by Loli on 26.09.2013
//  Copyright(c) Loli(r) 2013. All rights reserved.
//

#import "Angler.h"


@implementation Angler

- (id)initWithSpace:(ChipmunkSpace *)space position:(CGPoint)position;
{
    self = [super initWithFile:@"angler.png"];
    if (self)
    {
        _space = space;
        
        if (_space != nil)
        {
            CGSize size = self.textureRect.size;
            cpFloat mass = size.width * size.height;
            cpFloat moment = cpMomentForBox(mass, size.width, size.height);
            
            ChipmunkBody *body = [ChipmunkBody bodyWithMass:mass andMoment:moment];
            body.pos = position;
            ChipmunkShape *shape = [ChipmunkPolyShape boxWithBody:body width:size.width/3 height:size.height/2];
            
            // Add to space
            [_space addBody:body];
            [_space addShape:shape];
            
            // Add to pysics sprite
            self.chipmunkBody = body;
        }
    }
    return self;
}

-(void)thrust
{
    if(YES)
    {
        cpVect impulseVector = cpvmult(cpv(1.0,0.0), self.chipmunkBody.mass * 150);
        [self.chipmunkBody applyImpulse:impulseVector offset:cpvzero];
    }
}

-(void)crash:(BOOL)alive
{
        cpVect impulseVector = cpvmult(cpv(-2.0,0.5), self.chipmunkBody.mass * 150);
        [self.chipmunkBody applyImpulse:impulseVector offset:cpvzero];
        double delayInSeconds = 0.7;
    dispatch_time_t _popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(_popTime, dispatch_get_main_queue(), ^(void){
            [self thrust];
            [self thrust];
        });
}

- (void)jumpWithPower:(CGFloat)power vector:(cpVect)vector
{
    cpVect impulseVector = cpvmult(vector, self.chipmunkBody.mass * power);
    [self.chipmunkBody applyImpulse:impulseVector offset:cpvzero];
}



- (void)jump
{
    cpVect impulseVector = cpvmult(cpv(0.0,1.0), self.chipmunkBody.mass * 20);
    [self.chipmunkBody applyImpulse:impulseVector offset:cpvzero];
}



@end
