//
//  LTListBaseClass.h
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTListBaseModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN
//业务层的模型继承使用
@interface LTListBaseRowClass : NSObject<LTListRowProtocol>{
@public
    NSString *_cellReusable;
    NSNumber *_rowHeight;
}
@end
@interface LTListBaseSectionClass : NSObject<LTListSectionProtocol>{
@public
    NSString *_viewHeaderClass;
    NSString *_nibHeaderName;
    NSString *_viewFooterClass;
    NSString *_nibFooterName;
    NSNumber *_sectionHeaderHeight;
    NSNumber *_sectionFooterHeight;
}
@end
NS_ASSUME_NONNULL_END
