//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/18/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.m"
#import "PlayingCard.m"

@interface PlayingCardDeck : Deck

@end

@implementation PlayingCardDeck

-(instancetype)init{
    self=[super init];
    if(self){
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank=1;rank<=[PlayingCard maxRank];rank++) {
                PlayingCard *card=[[PlayingCard alloc] init];
                card.rank=rank;
                card.suit=suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
