
#import <UIKit/UIKit.h>

@interface ENMBadgedBarButtonItem : UIBarButtonItem

@property (nonatomic, strong) UILabel *badgeLabel;
@property (nonatomic, copy) NSString *badgeValue;
@property (nonatomic, copy) UIColor *badgeBackgroundColor;
@property (nonatomic, copy) UIColor *badgeTextColor;
@property (nonatomic, copy) UIFont *badgeFont;
@property (nonatomic, assign) BOOL shouldHideBadgeAtZero;
@property (nonatomic, assign) BOOL shouldAnimateBadge;

- (instancetype)initWithCustomView:(UIView *)customView;

@end
