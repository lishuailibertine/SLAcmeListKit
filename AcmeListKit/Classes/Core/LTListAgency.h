//
//  LTListAgency.h
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTListViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@interface LTListAgency : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) id <LTListViewModelProtocol>tableDataModel;
@end
NS_ASSUME_NONNULL_END
