//
//  YPQuizViewController.m
//  MovieQuizSE
//
//  Created by Roman Yaschenkov on 28.04.2026.
//

#import "YPQuizViewController.h"
#import "UIFont+YSDisplay.h"
#import "UIColor+YPColor.h"

@interface YPQuizViewController ()

@end

@implementation YPQuizViewController {
    UILabel *questionHeaderLabel;
    UILabel *questionCounterLabel;
    UILabel *questionRatingLabel;
    UIButton *acceptButton;
    UIButton *rejectButton;
    UIImageView *posterImageView;
}

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor ypBlack];
    
    questionHeaderLabel = [UILabel new];
    questionHeaderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    questionHeaderLabel.font = [UIFont ysMedium20];
    questionHeaderLabel.text = NSLocalizedString(@"QuestionHeaderTitle", "");
    questionHeaderLabel.textColor = [UIColor ypWhite];
    questionHeaderLabel.textAlignment = NSTextAlignmentLeft;
    
    questionCounterLabel = [UILabel new];
    questionCounterLabel.translatesAutoresizingMaskIntoConstraints = NO;
    questionCounterLabel.font = [UIFont ysMedium20];
    questionCounterLabel.text = @"1/10";
    questionCounterLabel.textColor = [UIColor ypWhite];
    questionCounterLabel.textAlignment = NSTextAlignmentRight;
    
    questionRatingLabel = [UILabel new];
    questionRatingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    questionRatingLabel.font = [UIFont ysMedium20];
    questionRatingLabel.text = [NSLocalizedString(@"QuestionRatingTitle", "") stringByAppendingString:@" 8?"];
    questionRatingLabel.textColor = [UIColor ypWhite];
    questionRatingLabel.textAlignment = NSTextAlignmentCenter;
    
    acceptButton = [UIButton buttonWithType:UIButtonTypeSystem];
    acceptButton.translatesAutoresizingMaskIntoConstraints = NO;
    acceptButton.layer.cornerRadius = 15;
    acceptButton.titleLabel.font = [UIFont ysMedium20];
    [acceptButton setBackgroundColor:[UIColor ypWhite]];
    [acceptButton setTitleColor:[UIColor ypBlack] forState:UIControlStateNormal];
    [acceptButton setTitle:NSLocalizedString(@"AnswerNo", "") forState:UIControlStateNormal];
    [acceptButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    rejectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rejectButton.translatesAutoresizingMaskIntoConstraints = NO;
    rejectButton.layer.cornerRadius = 15;
    rejectButton.titleLabel.font = [UIFont ysMedium20];
    [rejectButton setBackgroundColor:[UIColor ypWhite]];
    [rejectButton setTitleColor:[UIColor ypBlack] forState:UIControlStateNormal];
    [rejectButton setTitle:NSLocalizedString(@"AnswerYes", "") forState:UIControlStateNormal];
    [rejectButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    posterImageView = [UIImageView new];
    posterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    posterImageView.layer.cornerRadius = 20;
    posterImageView.backgroundColor = [UIColor blueColor];
       
    UIStackView *parentStackView = [UIStackView new];
    parentStackView.translatesAutoresizingMaskIntoConstraints = NO;
    parentStackView.axis = UILayoutConstraintAxisVertical;
    parentStackView.spacing = 5;
    parentStackView.distribution = UIStackViewDistributionFill;
    parentStackView.alignment = UIStackViewAlignmentFill;
    
    UIStackView *headerStackView = [UIStackView new];
    headerStackView.translatesAutoresizingMaskIntoConstraints = NO;
    headerStackView.axis = UILayoutConstraintAxisHorizontal;
    headerStackView.distribution = UIStackViewDistributionFill;
    headerStackView.alignment = UIStackViewAlignmentFill;
    
    UIStackView *footerStackView = [UIStackView new];
    footerStackView.translatesAutoresizingMaskIntoConstraints = NO;
    footerStackView.axis = UILayoutConstraintAxisHorizontal;
    footerStackView.spacing = 10;
    footerStackView.distribution = UIStackViewDistributionFillEqually;
    
    [headerStackView addArrangedSubview:questionHeaderLabel];
    [headerStackView addArrangedSubview:questionCounterLabel];
    [headerStackView setLayoutMarginsRelativeArrangement:YES];
    [headerStackView setLayoutMargins:UIEdgeInsetsMake(5, 0, 0, 0)];
            
    [footerStackView addArrangedSubview:acceptButton];
    [footerStackView addArrangedSubview:rejectButton];
    [footerStackView setLayoutMarginsRelativeArrangement:YES];
    [footerStackView setLayoutMargins:UIEdgeInsetsMake(0, 0, 10, 0)];
            
    [parentStackView addArrangedSubview:headerStackView];
    [parentStackView addArrangedSubview:posterImageView];
    [parentStackView addArrangedSubview:questionRatingLabel];
    [parentStackView addArrangedSubview:footerStackView];
    [self.view addSubview:parentStackView];
                
    UILayoutGuide *guide = self.view.layoutMarginsGuide;
    [posterImageView.heightAnchor constraintEqualToAnchor:posterImageView.widthAnchor multiplier:3.0/2.0].active = YES;
    [footerStackView.heightAnchor constraintEqualToConstant:60].active = YES;
    [parentStackView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [parentStackView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [parentStackView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [parentStackView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)buttonPressed:(UIButton *)button {
    BOOL isCorrect = arc4random_uniform(2) == 1;
    BOOL show = button.titleLabel.text == NSLocalizedString(@"AnswerYes", "") ? YES : NO;
    posterImageView.layer.masksToBounds = YES;
    posterImageView.layer.borderColor = isCorrect ? [UIColor ypGreen].CGColor : [UIColor ypRed].CGColor;
    posterImageView.layer.borderWidth = show ? 8 : 0;
}

@end
