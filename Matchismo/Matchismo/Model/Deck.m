//
//  Deck.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/18/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.m"
@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;

@end

@interface Deck()
@property(strong,nonatomic) NSMutableArray *cards;//of Card
@end

@implementation Deck

-(NSMutableArray *)cards{
    if(!_cards){
        _cards=[[NSMutableArray alloc] init];
    }
    
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index=arc4random() % [self.cards count];
        randomCard=self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
    
}


@end