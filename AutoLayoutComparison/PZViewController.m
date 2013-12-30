//
//  PZViewController.m
//  AutoLayoutComparison
//
//  Created by Test on 12/27/13.
//

#import "PZViewController.h"
#import "PZDefaultLayoutView.h"
#import "PZAutoLayoutView.h"
#import "PZDataModel.h"

@interface PZViewController ()
@property (nonatomic, strong) PZDataModel *dataModel;
@end

@implementation PZViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  UIScrollView *scrollView = [[UIScrollView alloc] init];
  scrollView.backgroundColor = [UIColor clearColor];
  [self.view addSubview:scrollView];
  _dataModel = [[PZDataModel alloc] init];

  CGFloat contentViewScrollPosition = 0;
  for (PZDataModelItem *dataItem in _dataModel.dataModelItems) {
    PZDefaultLayoutView *defaultView = [[PZDefaultLayoutView alloc] initWithFrame:CGRectMake(0, contentViewScrollPosition, 320, 66)];
    defaultView.topLayoutGuide = 20;
    defaultView.bottomLayoutGuide = 10;
    defaultView.leftTitle = dataItem.left;
    defaultView.title = dataItem.middle;
    defaultView.rightTitle = dataItem.right;
    [scrollView addSubview:defaultView];
    
    contentViewScrollPosition += CGRectGetHeight(defaultView.frame) + 5;
    
    PZAutoLayoutView *autoView = [[PZAutoLayoutView alloc] initWithFrame:CGRectMake(0, contentViewScrollPosition, 320, 66)];
    autoView.topLayoutGuide = 20;
    autoView.bottomLayoutGuide = 10;
    autoView.leftTitle= dataItem.left;
    autoView.title = dataItem.middle;
    autoView.rightTitle = dataItem.right;
    [scrollView addSubview:autoView];
    
    contentViewScrollPosition += CGRectGetHeight(autoView.frame) + 10;
  }
  
  for (PZDataModelItem *dataItem in _dataModel.dataModelItems) {
    PZDefaultLayoutView *defaultView = [[PZDefaultLayoutView alloc] initWithFrame:CGRectMake(0, contentViewScrollPosition, 220, 88)];
    defaultView.topLayoutGuide = 20;
    defaultView.bottomLayoutGuide = 10;
    defaultView.leftTitle = dataItem.left;
    defaultView.title = dataItem.middle;
    defaultView.rightTitle = dataItem.right;
    [scrollView addSubview:defaultView];
    
    contentViewScrollPosition += CGRectGetHeight(defaultView.frame) + 5;
    
    PZAutoLayoutView *autoView = [[PZAutoLayoutView alloc] initWithFrame:CGRectMake(0, contentViewScrollPosition, 220, 88)];
    autoView.topLayoutGuide = 20;
    autoView.bottomLayoutGuide = 10;
    autoView.leftTitle= dataItem.left;
    autoView.title = dataItem.middle;
    autoView.rightTitle = dataItem.right;
    [scrollView addSubview:autoView];
    
    contentViewScrollPosition += CGRectGetHeight(autoView.frame) + 10;
  }
  scrollView.contentSize = (CGSize){CGRectGetWidth(self.view.bounds), contentViewScrollPosition};
  
  UIButton *forceToLayoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [forceToLayoutButton setTitle:@"ForceTo Layout" forState:UIControlStateNormal];
  [self.view addSubview:forceToLayoutButton];
  
  UIButton *forceToConstraintsButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [forceToConstraintsButton setTitle:@"ForceTo Constraint" forState:UIControlStateNormal];

  [self.view addSubview:forceToConstraintsButton];
  
  [forceToLayoutButton sizeToFit];
  forceToLayoutButton.frame = CGRectMake(0,
                                         CGRectGetHeight(self.view.bounds) - CGRectGetHeight(forceToLayoutButton.bounds),
                                         CGRectGetWidth(forceToLayoutButton.bounds),
                                         CGRectGetHeight(forceToLayoutButton.bounds));
  [forceToConstraintsButton sizeToFit];
  forceToConstraintsButton.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(forceToConstraintsButton.bounds),
                                              CGRectGetHeight(self.view.bounds) - CGRectGetHeight(forceToConstraintsButton.bounds),
                                              CGRectGetWidth(forceToConstraintsButton.bounds),
                                              CGRectGetHeight(forceToConstraintsButton.bounds));
  
  scrollView.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - MAX(CGRectGetHeight(forceToLayoutButton.bounds), CGRectGetHeight(forceToConstraintsButton.bounds)) - 20);
  [forceToLayoutButton addTarget:self action:@selector(_handleForceToLayout:) forControlEvents:UIControlEventTouchUpInside];
  [forceToConstraintsButton addTarget:self action:@selector(_handleForceConstraint:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)_handleForceToLayout:(id)sender
{
  [[self.view subviews] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger index, BOOL *stop) {
    [view setNeedsLayout];
  }];
}

- (void)_handleForceConstraint:(id)sender
{
  [[self.view subviews] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger index, BOOL *stop) {
    [view setNeedsUpdateConstraints];
  }];
}
@end
