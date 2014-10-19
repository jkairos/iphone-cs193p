//
//  Card.h
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/19/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end