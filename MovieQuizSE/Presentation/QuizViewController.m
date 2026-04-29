//
//  QuizViewController.m
//  MovieQuizSE
//
//  Created by Roman Yaschenkov on 28.04.2026.
//

#import "QuizViewController.h"
#import "UIFont+YSDisplay.h"
#import "UIColor+YPColor.h"

@interface QuizViewController ()

@end

@implementation QuizViewController { 
    UILabel *label;
}

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor ypWhite];
    
    label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.font = [UIFont ysBold23];
    label.text = NSLocalizedString(@"Question", "");
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    const CGSize size = self.view.bounds.size;
    
    [label sizeToFit];
    label.frame = CGRectInset(label.frame, -10, -10);
    label.center = CGPointMake(size.width * 0.5, size.height * 0.5);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
