//
//  Card.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/18/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end

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