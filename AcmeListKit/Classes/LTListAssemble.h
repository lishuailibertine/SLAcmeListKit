//
//  LTListAssemble.h
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTListBaseModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN
//tableView组装
@interface LTListAssemble : NSObject
//创建
+ (instancetype)createListAssemble:(UITableView *)tableView;
//更新数据源
- (void)updateListWithModels:(NSArray <id<LTListSectionProtocol>>*)dataArray;
@end

NS_ASSUME_NONNULL_END
