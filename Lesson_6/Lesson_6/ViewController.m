//
//  ViewController.m
//  Lesson_6
//
//  Created by Andrey Proskurin on 25.08.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pushMeButton;
@property (weak, nonatomic) IBOutlet UIView *loaderView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loaderWidthConstraint;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.pushMeButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.pushMeButton setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [self.pushMeButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.pushMeButton setTitle:@"Приготовление..." forState:UIControlStateDisabled];
    
    self.loaderWidthConstraint.constant = 0.0f;
    
//    [self.pushMeButton setTitle:@"Normal State" forState:UIControlStateNormal];
//    [self.pushMeButton setTitle:@"Highlighted State" forState:UIControlStateHighlighted];
//    [self.pushMeButton setTitle:@"Selected State" forState:UIControlStateSelected];
}

- (NSTimer *)timer {
    if (!_timer) // (_timer == nil) - эквивалентная запись.
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timeIsOver) userInfo:nil repeats:YES];
    }
    return _timer;
}


- (void)timeIsOver
{
    self.loaderWidthConstraint.constant += 20;
    
    if (self.loaderWidthConstraint.constant > 300) {
        [self.timer invalidate]; // остановка таймера.
        self.timer = nil;
        
        self.loaderView.backgroundColor = [UIColor clearColor];
        self.loaderWidthConstraint.constant = 0.0f;
    }
}

- (IBAction)ButtonWasTapped:(UIButton *)sender
{
    
    self.loaderView.backgroundColor = [UIColor redColor];
    [self timer];
    self.pushMeButton.enabled = NO;
    
//    [sender setTitle:@"Tapped" forState:UIControlStateNormal];
//    
//    if (sender.state == UIControlStateHighlighted)
//    {
//        sender.backgroundColor = [UIColor redColor];
//    }
//    else
//    {
//        sender.backgroundColor = [UIColor clearColor];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
