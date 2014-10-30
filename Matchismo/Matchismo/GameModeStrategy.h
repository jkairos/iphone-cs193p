//
//  GameModeStrategy.h
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/26/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface GameModeStrategy:NSObject
- (void) chooseCard:(NSMutableArray*) cards AtIndex:(NSUInteger) index;
- (NSInteger) returnScore;
@end
