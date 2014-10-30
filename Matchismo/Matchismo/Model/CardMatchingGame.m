//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/25/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "CardMatchingGame.h"
#import "TwoCardMatchMode.h"
#import "ThreeCardMatchMode.h"

@interface CardMatchingGame()
@property (nonatomic,strong) NSMutableArray *cards;//of Card
@property (nonatomic,readwrite) NSInteger score;
@end

@implementation CardMatchingGame

static const int GAME_MODE_2_CARDS=2;
static const int GAME_MODE_3_CARDS=3;

-(GameModeStrategy* )createGameStrategy:(int) gameStrategy{
    
    if(!self.gameModeStrategy){
        NSLog(@"gameStrategy %d",gameStrategy);
        if(gameStrategy == GAME_MODE_2_CARDS){
            self.gameModeStrategy = [[TwoCardMatchMode alloc ] init ];
        }else if (gameStrategy == GAME_MODE_3_CARDS){
            self.gameModeStrategy = [[ThreeCardMatchMode alloc ] init ];
        }
        
    }
    
    return self.gameModeStrategy;
}

-(NSMutableArray *) cards{
    if(!_cards){
        _cards=[[NSMutableArray alloc] init];
    }
    return _cards;
}


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck andGameMode:(int) gameMode{
    
    self = [super init];
    
    if(self){
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self=nil;
                break;
            }
            
        }
    }
    
    [self createGameStrategy:gameMode];
    
    return self;
}

-(Card *) cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? [self.cards objectAtIndex:index] : nil;
}

-(void) chooseCardAtIndex:(NSUInteger)index{
    [self.gameModeStrategy chooseCard:self.cards AtIndex:(index) WithScore:self.score];
    self.score=[self.gameModeStrategy returnScore];

    
    /*if(!card.isMatched){
        if (card.isChosen) {
            card.chosen=NO;
        } else {
            [self createGameStrategy:GAME_MODE_2_CARDS];
            [self.gameModeStrategy chooseCard:self.cards AtIndex:(index) WithScore:self.score];
            self.score=[self.gameModeStrategy returnScore];
            //match against other chosen cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore=[card match:@[otherCard]];
                    
                    if (matchScore) {
                        self.score+=matchScore*MATCH_BONUS;
                        otherCard.matched=YES;
                        card.matched=YES;
                    } else {
                        self.score-=MISMATCH_PENALTY;
                        otherCard.chosen=NO;
                    }
                    break;//can only choose 2 cards for now
                }
            }
            
            self.score-=COST_TO_CHOOSE;
            card.chosen=YES;
        }
    }*/
}
@end
