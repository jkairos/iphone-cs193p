//
//  GameModeStrategy.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/26/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "GameModeStrategy.h"
@interface GameModeStrategy()
@property (nonatomic,readwrite) NSInteger score;
@end

@implementation GameModeStrategy
-(NSInteger) returnScore{
    return 0;
}

-(void)chooseCard:(NSMutableArray *)cards AtIndex:(NSUInteger)index WithScore:(NSInteger)score{}

@end
