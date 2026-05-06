//
//  UILabel+Factory.m
//  MovieQuizSE
//
//  Created by Roman Yaschenkov on 06.05.2026.
//

#import "UILabel+Factory.h"
#import "UIFont+YSDisplay.h"
#import "UIColor+YPColor.h"

@implementation UILabel (UILabelFactory)

+ (UILabel *)createWith:(NSString *)text {
    return [UILabel createWith:text
                 textAlignment:NSTextAlignmentLeft
                     textColor:[UIColor ypWhite]
                          font:[UIFont ysMedium20]];
}

+ (UILabel *)createWith:(NSString *)text
          textAlignment:(NSTextAlignment)alignment {
    return [UILabel createWith:text
                 textAlignment:alignment
                     textColor:[UIColor ypWhite]
                          font:[UIFont ysMedium20]];
}

+ (UILabel *)createWith:(NSString *)text
            textPostfix:(NSString *)textExtra
          textAlignment:(NSTextAlignment)alignment {
    return [UILabel createWith:[NSLocalizedString(text, "") stringByAppendingString:textExtra]
                 textAlignment:alignment
                     textColor:[UIColor ypWhite]
                          font:[UIFont ysMedium20]];
}

+ (UILabel *)createWith:(NSString *)text
          textAlignment:(NSTextAlignment)alignment
              textColor:(UIColor *)color
                   font:(UIFont *)font {
    UILabel *label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = NSLocalizedString(text, "");
    label.textAlignment = alignment;
    label.textColor = color;
    label.font = font;
    
    return label;
}

@end
