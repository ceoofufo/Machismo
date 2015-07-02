//
//  PlayingCardViewController.m
//  Machismo
//
//  Created by ceoofufo on 15/6/25.
//  Copyright (c) 2015年 ceoofufo. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Deck*)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
