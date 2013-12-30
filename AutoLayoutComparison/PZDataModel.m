//
//  PZDataModel.m
//  AutoLayoutComparison
//
//  Created by Test on 12/27/13.
//

#import "PZDataModel.h"

@implementation PZDataModelItem

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@, %@, %@", self.left, self.middle, self.right];
}

@end

@implementation PZDataModel

static char* const left[] =   {"LeftLeft",     "LeftLeftLeftLeft"};
static char* const middle[] = {"MiddleMiddle", "MiddleMiddleMiddleMiddle"};
static char* const right[] =  {"RightRight",   "RightRightRightRight"};

- (NSArray *)dataModelItems
{
  return  [self valueForKey:@"DataModelItems"];
}

- (NSUInteger)countOfDataModelItems
{
  return sizeof(left) / sizeof(char *);
}

- (id)objectInDataModelItemsAtIndex:(NSUInteger)index
{
  PZDataModelItem *dataModelItem = [[PZDataModelItem alloc] init];
  dataModelItem.left = [NSString stringWithUTF8String:left[index]];
  dataModelItem.middle = [NSString stringWithUTF8String:middle[index]];
  dataModelItem.right = [NSString stringWithUTF8String:right[index]];
  return dataModelItem;
}

@end
