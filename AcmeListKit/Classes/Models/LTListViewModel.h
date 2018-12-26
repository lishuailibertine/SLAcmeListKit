//
//  LTListViewModel.h
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTListViewModelProtocol.h"
//组件库使用的模型
NS_ASSUME_NONNULL_BEGIN
@interface LTTableRowModel: NSObject<LTTableRowModelProtocol>
@end
@interface LTTableSectionModel: NSObject<LTTableSectionModeProtocol>
@end
@interface LTListViewModel : NSObject<LTListViewModelProtocol>
@end

NS_ASSUME_NONNULL_END
