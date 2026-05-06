//
//  UIButton+Factory.m
//  MovieQuizSE
//
//  Created by Roman Yaschenkov on 06.05.2026.
//

#import "UIButton+Factory.h"
#import "UIFont+YSDisplay.h"
#import "UIColor+YPColor.h"

@implementation UIButton (UIButtonFactory)

+ (UIButton *)createWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action
                       events:(UIControlEvents)controlEvents {
    return [UIButton createWithTitle:title
                          titleColor:[UIColor ypBlack]
                           titleFont:[UIFont ysMedium20]
                     backgroundColor:[UIColor ypWhite]
                        cornerRadius:15.0
                              target:target
                              action:action
                              events:controlEvents];
}

+ (UIButton *)createWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                    titleFont:(UIFont *)font
              backgroundColor:(UIColor *)backgrondColor
                 cornerRadius:(CGFloat)radius
                       target:(id)target
                       action:(SEL)action
                       events:(UIControlEvents)controlEvents {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.layer.cornerRadius = radius;
    button.titleLabel.font = font;
    [button setBackgroundColor:backgrondColor];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(title, "") forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
