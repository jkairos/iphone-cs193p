//
//  PlayingCard.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/18/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.m"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
+(NSArray *) validSuits;
+(NSUInteger)maxRank;

@end

@implementation PlayingCard

@synthesize suit=_suit;

+(NSArray *) validSuits{
    return @[@"♥︎",@"♦︎",@"♠︎",@"♣︎"];
}

+(NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank{
    if(rank<=[PlayingCard maxRank]){
        _rank=rank;
    }
}

-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit=suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit : @"?";
}

-(NSString *)contents{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@end
