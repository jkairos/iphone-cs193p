//
//  Card.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/18/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//
#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards{
    int score=0;
    
    for (Card *cards in otherCards) {
        if([cards.contents isEqualToString:self.contents]){
            score=1;
        }
    }
    
    return score;
}

@end