//
//  PZAutoLayoutView.m
//  AutoLayoutComparison
//
//  Created by Test on 12/27/13.
//

#import "PZAutoLayoutView.h"

@interface PZAutoLayoutView()
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIView *topLayoutView;
@property (nonatomic, strong) UIView *bottomLayoutView;

@property (nonatomic, strong) NSArray *topLayoutViewConstraints;
@property (nonatomic, strong) NSArray *bottomLayoutViewConstraints;
@end

@implementation PZAutoLayoutView
@synthesize topLayoutGuide = _topLayoutGuide;
@synthesize bottomLayoutGuide = _bottomLayoutGuide;

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    _leftLabel = [[UILabel alloc] init];
    _leftLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _leftLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.font = [UIFont boldSystemFontOfSize:15];
    _rightLabel = [[UILabel alloc] init];
    _rightLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _rightLabel.font = [UIFont systemFontOfSize:15];
    
    _leftLabel.backgroundColor = _titleLabel.backgroundColor = _rightLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:_leftLabel];
    [self addSubview:_titleLabel];
    [self addSubview:_rightLabel];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[left]-(>=8@770)-[middle]-(>=8@770)-[right]-8-|"
                                                                 options:NSLayoutFormatAlignAllCenterY
                                                                 metrics:nil
                                                                   views:@{@"left" : _leftLabel, @"middle" : _titleLabel, @"right" : _rightLabel}]];
    [_titleLabel setContentCompressionResistancePriority:800 forAxis:UILayoutConstraintAxisHorizontal];
    [_leftLabel setContentCompressionResistancePriority:10 forAxis:UILayoutConstraintAxisHorizontal];
    [_rightLabel setContentCompressionResistancePriority:10 forAxis:UILayoutConstraintAxisHorizontal];
    
    _topLayoutView = [[UIView alloc] init];
    _topLayoutView.backgroundColor = [UIColor blueColor];
    _topLayoutView.translatesAutoresizingMaskIntoConstraints = NO;
    [self insertSubview:_topLayoutView atIndex:0];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[top]|" options:0 metrics:nil views:@{@"top" : _topLayoutView}]];

    _bottomLayoutView = [[UIView alloc] init];
    _bottomLayoutView.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomLayoutView.backgroundColor = [UIColor greenColor];
    [self insertSubview:_bottomLayoutView atIndex:1];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottom]|" options:0 metrics:nil views:@{@"bottom": _bottomLayoutView}]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[top]-(>=0)-[middle]-(>=0)-[bottom]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"top": _topLayoutView, @"middle": _titleLabel, @"bottom": _bottomLayoutView}]];

    self.backgroundColor = [UIColor orangeColor];
  }
  return self;
}

- (void)setTopLayoutGuide:(CGFloat)topLayoutGuide
{
  NSLog(@"%@", NSStringFromSelector(_cmd));
  if (_topLayoutGuide != topLayoutGuide) {
    _topLayoutGuide = topLayoutGuide;
    if (_topLayoutViewConstraints) {
      [self removeConstraints:_topLayoutViewConstraints];
    }
    _topLayoutViewConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[top(==height@750)]"
                                                                        options:0
                                                                        metrics:@{@"height" : @(topLayoutGuide)}
                                                                          views:@{@"top" : _topLayoutView}];
    [self addConstraints:_topLayoutViewConstraints];
  }
}

- (void)setBottomLayoutGuide:(CGFloat)bottomLayoutGuide
{
  NSLog(@"%@", NSStringFromSelector(_cmd));
  if (_bottomLayoutGuide != bottomLayoutGuide) {
    _bottomLayoutGuide = bottomLayoutGuide;
    if (_bottomLayoutViewConstraints) {
      [self removeConstraints:_bottomLayoutViewConstraints];
    }
    _bottomLayoutViewConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottom(==height@750)]|"
                                                                           options:0
                                                                           metrics:@{@"height" : @(bottomLayoutGuide)}
                                                                             views:@{@"bottom" : _bottomLayoutView}];
    [self addConstraints:_bottomLayoutViewConstraints];
  }
}

- (void)updateConstraints
{
  NSLog(@"%@", NSStringFromSelector(_cmd));
  [super updateConstraints];
}

- (void)drawRect:(CGRect)rect
{
  NSLog(@"%@", NSStringFromSelector(_cmd));
  [super drawRect:rect];
}

- (void)layoutSubviews
{
  NSLog(@"%@", NSStringFromSelector(_cmd));
  [super layoutSubviews];
  CGRect bounds = self.bounds;
  CGFloat yPositionOffset = (CGRectGetHeight(bounds) - _topLayoutGuide - _bottomLayoutGuide) / 2 + _topLayoutGuide;
  _titleLabel.frame = (CGRect){{CGRectGetMinX(_titleLabel.frame), yPositionOffset - CGRectGetHeight(_titleLabel.bounds) / 2}, _titleLabel.frame.size};
  _leftLabel.frame = (CGRect){{CGRectGetMinX(_leftLabel.frame), yPositionOffset - CGRectGetHeight(_leftLabel.bounds) / 2}, _leftLabel.frame.size};
  _rightLabel.frame = (CGRect){{CGRectGetMinX(_rightLabel.frame), yPositionOffset - CGRectGetHeight(_rightLabel.bounds) / 2}, _rightLabel.frame.size};
}

- (NSString *)leftTitle
{
  return _leftLabel.text;
}

- (NSString *)title
{
  return _titleLabel.text;
}

- (NSString *)rightTitle
{
  return _rightLabel.text;
}

- (void)setLeftTitle:(NSString *)leftTitle
{
  _leftLabel.text = leftTitle;
}

- (void)setTitle:(NSString *)title
{
  _titleLabel.text = title;
}

- (void)setRightTitle:(NSString *)rightTitle
{
  _rightLabel.text = rightTitle;
}

@end
