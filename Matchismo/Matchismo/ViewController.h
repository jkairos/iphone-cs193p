//
//  ViewController.h
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/18/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//
//Abstract class. Must implement methods as described below

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Card.h"

@interface ViewController : UIViewController

//protected
//for subclasses
-(Deck *) createDeck;//ABSTRACT
@end

