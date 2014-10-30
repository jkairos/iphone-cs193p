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
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong,nonatomic) Deck *deck;
@property (strong,nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (nonatomic) int gameMode;
@end

@implementation ViewController
static const int GAME_MODE_2_CARDS=2;
static const int GAME_MODE_3_CARDS=3;

-(CardMatchingGame *)game{
    if (!_game) {
        _game=[self createGameModel];
    }
    
    return _game;
}

-(CardMatchingGame *) createGameModel{
    return [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck] andGameMode:self.gameMode];
}


-(Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)gameModeSelection:(UISegmentedControl *)sender {
    switch (self.segmentControl.selectedSegmentIndex) {
        case 1:
            self.gameMode=GAME_MODE_2_CARDS;
            break;
        case 2:
            self.gameMode=GAME_MODE_3_CARDS;
            break;
        default:
            self.gameMode=GAME_MODE_2_CARDS;
            break;
    }
    self.game=[self createGameModel];
    [self.segmentControl setEnabled:NO];
    for (UIButton* card in self.cardButtons) {
        [card setEnabled:YES];
    }
    
    
}

- (IBAction)redeal:(UIButton *)sender {
    self.game=[self createGameModel];
    self.gameMode=0;
    self.scoreLabel.text=@"Score: 0";
    [self.segmentControl setEnabled:YES];
    [self.segmentControl setSelectedSegmentIndex:0];
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex=(int)[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        card.chosen=NO;
        card.matched=NO;
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self setImageForCard:card] forState:UIControlStateNormal];
        //cardButton.enabled=!card.isMatched;
        [cardButton setEnabled:NO];
    }
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex=(int)[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex=(int)[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self setImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled=!card.isMatched;
        self.scoreLabel.text=[NSString stringWithFormat:@"Score: %d",(int)self.game.score];
    }
}

-(NSString *) titleForCard:(Card *) card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *) setImageForCard:(Card *) card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" :@"cardback"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIButton* card in self.cardButtons) {
        [card setEnabled:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
