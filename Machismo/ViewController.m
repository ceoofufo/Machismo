//
//  ViewController.m
//  Machismo
//
//  Created by ceoofufo on 15/6/14.
//  Copyright (c) 2015年 ceoofufo. All rights reserved.
//

#import "ViewController.h"
//#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck* deck;
@property (nonatomic, strong) CardMatchingGame* game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController

-(CardMatchingGame*) game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
}

//-(Deck*)deck
//{
//    if (!_deck) _deck = [self createDeck];
//    return _deck;
//}

-(Deck*) createDeck
{
//    return [[PlayingCardDeck alloc]init];
    return nil;
}

//- (void)setFlipCount:(int)flipCount
//{
//    _flipCount = flipCount;
//    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
//    NSLog(@"flipCount = %d",self.flipCount);
//}

- (IBAction)touchCardButton:(UIButton *)sender
{
//    if ([sender.currentTitle length]) {
//        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//        self.flipCount++;
//    } else {
//        Card* card = [self.deck drawRandomCard];
//        if (card) {
//            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
//            [sender setTitle:card.contents forState:UIControlStateNormal];
//            self.flipCount++;
//        }
//
//    }
    

    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];

}

-(void)updateUI
{
    for(UIButton* cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
}

-(NSString*)titleForCard:(Card*) card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage*)backgroundImageForCard:(Card*) card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
