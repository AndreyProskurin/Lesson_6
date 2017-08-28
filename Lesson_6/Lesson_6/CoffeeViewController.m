//
//  CoffeeViewController.m
//  Lesson_6
//
//  Created by Andrey Proskurin on 27.08.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CoffeeViewController.h"

@interface CoffeeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (weak, nonatomic) IBOutlet UISlider *brightnessOfLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *coffee;
@property (weak, nonatomic) IBOutlet UISwitch *milk;
@property (weak, nonatomic) IBOutlet UIStepper *sugar;
@property (weak, nonatomic) IBOutlet UIButton *makingCoffeeButton;

@end

@implementation CoffeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.brightnessOfLabel.value = 1;
    self.infoLabel.alpha = self.brightnessOfLabel.value;
    self.milk.enabled = NO;
    self.sugar.enabled = NO;
    self.makingCoffeeButton.enabled = NO;
    [self.makingCoffeeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
}

- (IBAction)disableAllTheButtons:(id)sender {
    self.makingCoffeeButton.enabled = NO;
    self.coffee.enabled = NO;
    self.milk.enabled = NO;
    self.sugar.enabled = NO;
}

- (IBAction)backAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeBrightness:(UISlider *)sender
{
    self.brightnessOfLabel.minimumValue = 0;
    self.brightnessOfLabel.maximumValue = 1;
    
    self.infoLabel.alpha = sender.value;
    
//    Мой вариант  :)
    
//    self.brightnessOfLabel.minimumValue = 0;
//    self.brightnessOfLabel.maximumValue = 21;
//    NSUInteger currentAlpha = self.brightnessOfLabel.value;
//    
//    switch (currentAlpha) {
//        case 0:
//            [self.infoLabel setAlpha:0];
//            break;
//        case 1:
//            [self.infoLabel setAlpha:0.05];
//            break;
//        case 2:
//            [self.infoLabel setAlpha:0.1];
//            break;
//        case 3:
//            [self.infoLabel setAlpha:0.15];
//            break;
//        case 4:
//            [self.infoLabel setAlpha:0.15];
//            break;
//        case 5:
//            [self.infoLabel setAlpha:0.25];
//            break;
//        case 6:
//            [self.infoLabel setAlpha:0.3];
//            break;
//        case 7:
//            [self.infoLabel setAlpha:0.35];
//            break;
//        case 8:
//            [self.infoLabel setAlpha:0.4];
//            break;
//        case 9:
//            [self.infoLabel setAlpha:0.45];
//            break;
//        case 11:
//            [self.infoLabel setAlpha:0.5];
//            break;
//        case 12:
//            [self.infoLabel setAlpha:0.55];
//            break;
//        case 13:
//            [self.infoLabel setAlpha:0.6];
//            break;
//        case 14:
//            [self.infoLabel setAlpha:0.65];
//            break;
//        case 15:
//            [self.infoLabel setAlpha:0.7];
//            break;
//        case 16:
//            [self.infoLabel setAlpha:0.75];
//            break;
//        case 17:
//            [self.infoLabel setAlpha:0.8];
//            break;
//        case 18:
//            [self.infoLabel setAlpha:0.85];
//            break;
//        case 19:
//            [self.infoLabel setAlpha:0.9];
//            break;
//        case 20:
//            [self.infoLabel setAlpha:0.95];
//            break;
//        case 21:
//            [self.infoLabel setAlpha:1];
//            break;
//    }
}

- (IBAction)chooseCoffee:(UISegmentedControl *)sender
{
    self.sugar.enabled = YES;
    self.makingCoffeeButton.enabled = YES;
    
    if ([self.coffee selectedSegmentIndex] == 0)
    {
        [self.infoLabel setText:@"Americano"];
        self.milk.enabled = YES;
    }
    else if([self.coffee selectedSegmentIndex] == 2)
    {
        [self.infoLabel setText:@"Espresso"];
        self.milk.enabled = YES;
    }
    else
    {
        [self.infoLabel setText:@"Cappuccino"];
        self.milk.enabled = NO;
    }
}

- (IBAction)addMilk:(UISwitch *)sender
{
    
    if (([self.milk isOn] && [self.coffee selectedSegmentIndex] == 0) || ([self.milk isOn] && [self.coffee selectedSegmentIndex] == 2))
    {
        [self.infoLabel setText:@"Coffee with milk"];
    }
    else
    {
        [self.infoLabel setText:@"Coffee without milk"];
    }
}

- (IBAction)addSugar:(UIStepper *)sender
{
    switch ((NSUInteger)self.sugar.value) {
        case 0:
            [self.infoLabel setText:@"Without Sugar"];
            break;
        case 1:
            [self.infoLabel setText:@"1 Sugar"];
            break;
        case 2:
            [self.infoLabel setText:@"2 Sugar"];
            break;
        case 3:
            [self.infoLabel setText:@"3 Sugar"];
            break;
        case 4:
            [self.infoLabel setText:@"4 Sugar"];
            break;
        case 5:
            [self.infoLabel setText:@"5 Sugar"];
            break;
    }
}

- (IBAction)makeCoffee:(UIButton *)sender
{
    [self disableAllTheButtons:sender];
    
    [self.infoLabel setText:@"Your coffee is been making..."];
    [self.makingCoffeeButton setTitle:@"Please, wait..." forState:UIControlStateDisabled];
    [self.makingCoffeeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
    
    CGFloat time = 1.0f;
    
    switch (self.coffee.selectedSegmentIndex)
    {
        case 0:
            time = 5.0f;
            break;
        case 1:
            time = 8.0f;
            break;
        case 2:
            time = 3.0f;
            break;
        default:
            break;
            }
    
    [self performSelector:@selector(coffeeIsReady) withObject:nil afterDelay:time];
}

- (void)coffeeIsReady
{
    [self.makingCoffeeButton setEnabled:YES];
    self.infoLabel.text = [NSString stringWithFormat:@"%@ is ready!", [self.coffee titleForSegmentAtIndex:self.coffee.selectedSegmentIndex]];
    self.coffee.enabled = YES;
    self.coffee.selectedSegmentIndex = UISegmentedControlNoSegment;
}

@end
