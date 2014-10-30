//
//  TwoCardMatchMode.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/26/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "TwoCardMatchMode.h"
#import "PlayingCard.h"

@implementation TwoCardMatchMode

static const int MISMATCH_PENALTY=2;
static const int MATCH_BONUS=10;
static const int COST_TO_CHOOSE=1;

-(void) chooseCard:(NSMutableArray *)cards AtIndex:(NSUInteger)index WithScore:(NSInteger)score{
    Card *card = (index < [cards count]) ? [cards objectAtIndex:index] : nil;
    
    if(card){
        if(!card.isMatched){
            if (card.isChosen) {
                card.chosen=NO;
            } else {
                //match against other chosen cards
                for (Card *otherCard in cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        int matchScore=[card match:@[otherCard]];
                        
                        if (matchScore) {
                            score+=matchScore*MATCH_BONUS;
                            otherCard.matched=YES;
                            card.matched=YES;
                        } else {
                            score-=MISMATCH_PENALTY;
                            otherCard.chosen=NO;
                        }
                        break;//can only choose 2 cards for now
                    }
                }
                
                score-=COST_TO_CHOOSE;
                card.chosen=YES;
                self.score=score;
            }
        }
        
    }
}

-(NSInteger)returnScore{
    return self.score;
}

@end
