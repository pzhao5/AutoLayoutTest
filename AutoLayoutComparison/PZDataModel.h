//
//  PZDataModel.h
//  AutoLayoutComparison
//
//  Created by Test on 12/27/13.
//

#import <Foundation/Foundation.h>

@interface PZDataModelItem : NSObject
@property (nonatomic, copy) NSString *left;
@property (nonatomic, copy) NSString *middle;
@property (nonatomic, copy) NSString *right;
@end

@interface PZDataModel : NSObject
@property (nonatomic, readonly, strong) NSArray *dataModelItems;
@end

