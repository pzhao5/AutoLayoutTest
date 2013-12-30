//
//  PZLayoutViewProtocol.h
//  AutoLayoutComparison
//
//  Created by Test on 12/27/13.
//

#import <Foundation/Foundation.h>

@protocol PZLayoutViewProtocol <NSObject>

@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *rightTitle;

@property (nonatomic, assign) CGFloat topLayoutGuide;
@property (nonatomic, assign) CGFloat bottomLayoutGuide;
@end
