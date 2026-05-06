//
//  UIButton+Factory.h
//  MovieQuizSE
//
//  Created by Roman Yaschenkov on 06.05.2026.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (UIButtonFactory)

+ (UIButton *)createWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action
                       events:(UIControlEvents)controlEvents;

+ (UIButton *)createWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                    titleFont:(UIFont *)font
              backgroundColor:(UIColor *)backgrondColor
                 cornerRadius:(CGFloat)radius
                       target:(id)target
                       action:(SEL)action
                       events:(UIControlEvents)controlEvents;

@end

NS_ASSUME_NONNULL_END
