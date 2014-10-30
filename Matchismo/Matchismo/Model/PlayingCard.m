//
//  PlayingCard.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/18/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//
#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit=_suit;

-(int)match:(NSArray *)otherCards{
    int score = 0;
    
    NSMutableArray *sameRank=[[NSMutableArray alloc] init];
    NSMutableArray *sameSuit=[[NSMutableArray alloc] init];
    
    for (PlayingCard *otherCard in otherCards) {
         if (otherCard.rank== self.rank) {
            [sameRank addObject:[NSNumber numberWithBool:YES]];
            [sameSuit addObject:[NSNumber numberWithBool:NO]];
        }else if([otherCard.suit isEqualToString:self.suit]){
            [sameSuit addObject:[NSNumber numberWithBool:YES]];
            [sameRank addObject:[NSNumber numberWithBool:NO]];
        }else{
            [sameSuit addObject:[NSNumber numberWithBool:NO]];
            [sameRank addObject:[NSNumber numberWithBool:NO]];
        }
    }
    
    BOOL isAllSameRank=NO;
    BOOL isAllSameSuit=NO;
    
    for (NSNumber *sameRankObj in sameRank) {
        if ([sameRankObj isEqualToNumber:[NSNumber numberWithBool:YES]]){
            isAllSameRank=YES;
        }else{
            isAllSameRank=NO;
            break;
        }
    }
    
    for (NSNumber *sameSuitObj in sameSuit) {
        if ([sameSuitObj isEqualToNumber:[NSNumber numberWithBool:YES]]){
            isAllSameSuit=YES;
        }else{
            isAllSameSuit=NO;
            break;
        }
    }
    
    if(isAllSameRank){
        score=4;
    }else if(isAllSameSuit){
        score=1;
    }
    
    
    /*if ([otherCards count] == 1) {
        PlayingCard *otherCard=[otherCards firstObject];
        
        if(otherCard.rank == self.rank){
            score=4;
        }else if ([otherCard.suit isEqualToString:self.suit]){
            score=1;
        }
    }*/
    
    return score;
}

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
    return _suit ? _suit : @"FF";
}

-(NSString *)contents{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@end
