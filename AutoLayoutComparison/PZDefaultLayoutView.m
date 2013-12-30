//
//  PZDefaultLayoutView.m
//  AutoLayoutComparison
//
//  Created by Test on 12/27/13.
//

#import "PZDefaultLayoutView.h"
@interface PZDefaultLayoutView()
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIView *topLayoutView;
@property (nonatomic, strong) UIView *bottomLayoutView;
@end

@implementation PZDefaultLayoutView
@synthesize topLayoutGuide;
@synthesize bottomLayoutGuide;

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    _leftLabel = [[UILabel alloc] init];
    _leftLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont boldSystemFontOfSize:15];
    _rightLabel = [[UILabel alloc] init];
    _rightLabel.font = [UIFont systemFontOfSize:15];
    
    _leftLabel.backgroundColor = _titleLabel.backgroundColor = _rightLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:_leftLabel];
    [self addSubview:_titleLabel];
    [self addSubview:_rightLabel];
    
    _topLayoutView = [[UIView alloc] init];
    _topLayoutView.backgroundColor = [UIColor blueColor];
    _bottomLayoutView = [[UIView alloc] init];
    _bottomLayoutView.backgroundColor = [UIColor greenColor];
    
    [self insertSubview:_topLayoutView atIndex:0];
    [self insertSubview:_bottomLayoutView atIndex:1];

    self.backgroundColor = [UIColor magentaColor];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  CGRect bounds = self.bounds;
  
  [_leftLabel sizeToFit];
  CGFloat renderMidPosition = (CGRectGetHeight(bounds) - topLayoutGuide - bottomLayoutGuide - CGRectGetHeight(_leftLabel.bounds)) / 2 + topLayoutGuide;
  _leftLabel.frame = (CGRect){{8, renderMidPosition},_leftLabel.bounds.size};
  
  [_rightLabel sizeToFit];
  renderMidPosition = (CGRectGetHeight(bounds) - topLayoutGuide - bottomLayoutGuide - CGRectGetHeight(_rightLabel.bounds)) / 2 + topLayoutGuide;
  _rightLabel.frame = (CGRect){{CGRectGetWidth(bounds) - CGRectGetWidth(_rightLabel.bounds) - 8, renderMidPosition},
                              _rightLabel.bounds.size};
  
  [_titleLabel sizeToFit];
  renderMidPosition = (CGRectGetHeight(bounds) - topLayoutGuide - bottomLayoutGuide - CGRectGetHeight(_titleLabel.bounds)) / 2 + topLayoutGuide;
  _titleLabel.frame = (CGRect){{(CGRectGetWidth(bounds) - CGRectGetWidth(_titleLabel.bounds)) / 2, renderMidPosition},
                              _titleLabel.bounds.size};
  
  _topLayoutView.frame = (CGRect){{0, 0}, {CGRectGetWidth(bounds), topLayoutGuide}};
  _bottomLayoutView.frame = (CGRect){{0, CGRectGetHeight(bounds) - bottomLayoutGuide}, {CGRectGetWidth(bounds), bottomLayoutGuide}};
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
