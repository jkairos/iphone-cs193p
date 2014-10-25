//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/25/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype)initWithCardCount:(NSUInteger) count
                       usingDeck:(Deck *) deck;
-(void) chooseCardAtIndex:(NSUInteger) index;

-(Card *) cardAtIndex:(NSUInteger) index;

@property (nonatomic,readonly) NSInteger score;
@end
