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
    UILabel *questionHeaderLabel;
    UILabel *questionCounterLabel;
    UILabel *questionRatingLabel;
    UIButton *acceptButton;
    UIButton *rejectButton;
    UIImageView *posterImageView;
}

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor ypWhite];
    
    questionHeaderLabel = [UILabel new];
    questionHeaderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    questionHeaderLabel.font = [UIFont ysMedium20];
    questionHeaderLabel.text = NSLocalizedString(@"QuestionHeaderTitle", "");
    questionHeaderLabel.textAlignment = NSTextAlignmentLeft;
    questionHeaderLabel.backgroundColor = [UIColor ypRed];
    
    questionCounterLabel = [UILabel new];
    questionCounterLabel.translatesAutoresizingMaskIntoConstraints = NO;
    questionCounterLabel.font = [UIFont ysMedium20];
    questionCounterLabel.text = @"1/10";
    questionCounterLabel.textAlignment = NSTextAlignmentRight;
    
    questionRatingLabel = [UILabel new];
    questionRatingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    questionRatingLabel.font = [UIFont ysBold23];
    questionRatingLabel.text =  NSLocalizedString(@"QuestionRatingTitle", "");
    questionRatingLabel.textAlignment = NSTextAlignmentCenter;
    
    acceptButton = [UIButton buttonWithType:UIButtonTypeSystem];
    acceptButton.translatesAutoresizingMaskIntoConstraints = NO;
    acceptButton.titleLabel.font = [UIFont ysMedium20];
    [acceptButton setTitle:NSLocalizedString(@"AnswerNo", "") forState:UIControlStateNormal];
    [acceptButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    rejectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rejectButton.titleLabel.font = [UIFont ysMedium20];
    rejectButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rejectButton setTitle:NSLocalizedString(@"AnswerYes", "") forState:UIControlStateNormal];
    [rejectButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    posterImageView = [UIImageView new];
    posterImageView.backgroundColor = [UIColor blueColor];
    posterImageView.translatesAutoresizingMaskIntoConstraints = NO;
       
    UIStackView *parentStackView = [UIStackView new];
    parentStackView.translatesAutoresizingMaskIntoConstraints = NO;
    parentStackView.axis = UILayoutConstraintAxisVertical;
    parentStackView.spacing = 20;
    parentStackView.distribution = UIStackViewDistributionFill;
    parentStackView.alignment = UIStackViewAlignmentFill;
    
    UIStackView *headerStackView = [UIStackView new];
    headerStackView.translatesAutoresizingMaskIntoConstraints = NO;
    headerStackView.axis = UILayoutConstraintAxisHorizontal;
    headerStackView.distribution = UIStackViewDistributionFill;
    headerStackView.alignment = UIStackViewAlignmentFill;
    headerStackView.backgroundColor = [UIColor ypGreen];
    
    UIStackView *footerStackView = [UIStackView new];
    footerStackView.translatesAutoresizingMaskIntoConstraints = NO;
    footerStackView.axis = UILayoutConstraintAxisHorizontal;
    footerStackView.distribution = UIStackViewDistributionFillProportionally;
    
    [headerStackView addArrangedSubview:questionHeaderLabel];
    [headerStackView addArrangedSubview:questionCounterLabel];
    
    [footerStackView addArrangedSubview:acceptButton];
    [footerStackView addArrangedSubview:rejectButton];
    
    UILayoutGuide *margin = self.view.layoutMarginsGuide;
                
    [parentStackView addArrangedSubview:headerStackView];
    [parentStackView addArrangedSubview:posterImageView];
    [parentStackView addArrangedSubview:questionRatingLabel];
    [parentStackView addArrangedSubview:footerStackView];
    [self.view addSubview:parentStackView];
        
    [posterImageView.heightAnchor constraintEqualToAnchor:posterImageView.widthAnchor multiplier:3.0/2.0].active = YES;
    [parentStackView.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor].active = YES;
    [parentStackView.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor].active = YES;
    [parentStackView.topAnchor constraintEqualToAnchor:margin.topAnchor].active = YES;
    [parentStackView.bottomAnchor constraintEqualToAnchor:margin.bottomAnchor].active = YES;
    //    [footerStackView.heightAnchor constraintEqualToConstant:60].active = YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)buttonPressed:(UIButton *)button {
    NSLog(@"Button fired!");
}

@end
