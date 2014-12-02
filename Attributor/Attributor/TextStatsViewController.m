//
//  TextStatsViewController.m
//  Attributor
//
//  Created by José Ferreira de Souza Filho on 11/29/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController

-(void) setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze=textToAnalyze;
    if(self.view.window){
     [self updateUI];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
    
}

-(void) updateUI{
    
    
    self.colorfulCharactersLabel.text= [NSString stringWithFormat:@"%d colorful characters", (int)[[self charactersWithAttribute:NSForegroundColorAttributeName]  length]];
    self.outlinedCharactersLabel.text= [NSString stringWithFormat:@"%d outlined characters", (int)[[self charactersWithAttribute:NSStrokeWidthAttributeName]  length]];
}

-(NSAttributedString *)charactersWithAttribute:(NSString *)attributedName{
    NSMutableAttributedString *characters=[[NSMutableAttributedString alloc] init];
    
    long index=0;
    
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value=[self.textToAnalyze attribute:attributedName atIndex:index effectiveRange:&range];
        
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index=range.location + range.length;
        }else{
            index++;
        }
    }
    
    
    return characters;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*self.textToAnalyze=[[NSAttributedString  alloc] initWithString: @"test" attributes:@{NSForegroundColorAttributeName: [UIColor greenColor], NSStrokeWidthAttributeName:@-3}];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
