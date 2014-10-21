//
//  ViewController.m
//  Matchismo
//
//  Created by José Ferreira de Souza Filho on 10/18/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "Card.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong,nonatomic) Deck *deck;
@end

@implementation ViewController

-(Deck *)deck{
    if(!_deck){
        _deck = [[PlayingCardDeck alloc] init];
    }
    
    return _deck;
}

-(void) setFlipCount:(int)flipCount{
    _flipCount=flipCount;
    self.flipsLabel.text=[NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"FlipCount changed to %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    UIImage *cardImage=nil;
    Card *card = [self.deck drawRandomCard];
    
    if(!card){//if the deck of cards is empty
        //set the deck property to nil to allocate a new deck if a set of cards.
        NSLog(@"DECK IS EMPTY.");
        self.deck=nil;
        card = [self.deck drawRandomCard];
    }
    
    if([sender.currentTitle length]){
        cardImage=[UIImage imageNamed:@"cardback"];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        cardImage=[UIImage imageNamed:@"cardfront"];
        [sender setTitle:card.contents forState:UIControlStateNormal];
    }
    
    [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
    self.flipCount++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
