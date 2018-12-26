//
//  LTListBaseViewProtocol.h
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTListBaseModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@protocol LTListBaseViewProtocol <NSObject>
- (void)fillData:(id)data;
@end
@protocol LTListBaseCellProtocol <NSObject>
- (void)fillDataWithModel:(id<LTListRowProtocol>)model;
@end
NS_ASSUME_NONNULL_END
