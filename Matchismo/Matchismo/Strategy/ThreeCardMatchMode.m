//
//  ThreeCardMatchMode.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/29/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "ThreeCardMatchMode.h"
#import "PlayingCard.h"

@implementation ThreeCardMatchMode

static const int MISMATCH_PENALTY=1;
static const int MATCH_BONUS=50;
static const int COST_TO_CHOOSE=1;

-(void) chooseCard:(NSMutableArray *)cards AtIndex:(NSUInteger)index WithScore:(NSInteger)score{
    Card *card = (index < [cards count]) ? [cards objectAtIndex:index] : nil;
    
    if(card){
        if(!card.isMatched){
            if (card.isChosen) {
                card.chosen=NO;
            } else {
                //match against other chosen cards
                NSMutableArray* chosenCards = [[NSMutableArray alloc] init];
                int count=0;
                NSLog(@"card:%@",card.contents);
                for (Card *otherCard in cards) {
                    if(count==2){//allowed only 3 cards selection
                        break;
                    }
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        NSLog(@"othercard:%@",otherCard.contents);
                        [chosenCards addObject:otherCard];
                        count++;
                    }
                }
                if(count ==2){
                    int matchScore=[card match:chosenCards];
                    NSLog(@"matchScore %d",matchScore);
                    if (matchScore) {
                        for (Card *choseCard in chosenCards) {
                            choseCard.matched=YES;
                        }
                        score+=matchScore*MATCH_BONUS;
                        card.matched=YES;
                    } else {
                        score-=MISMATCH_PENALTY;
                        for (Card *choseCard in chosenCards) {
                            choseCard.chosen=NO;
                        }
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
