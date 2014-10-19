//
//  PlayingCard.h
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/19/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
+(NSArray *) validSuits;
+(NSUInteger)maxRank;

@end
