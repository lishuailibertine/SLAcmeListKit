//
//  LTListBaseProtocol.h
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//业务层遵循的接口
NS_ASSUME_NONNULL_BEGIN
//行
@protocol LTListRowProtocol <NSObject>
//cell重用标示
@property (nonatomic, copy) NSString *cellReusable;
//cell的高度
@property (nonatomic, strong) NSNumber *rowHeight;
@end
//区
@protocol LTListSectionProtocol <NSObject>
//区头viewClass
@property (nonatomic, copy) NSString *viewHeaderClass;
//区头nib name
@property (nonatomic, copy) NSString *nibHeaderName;
//区尾viewClass
@property (nonatomic, copy) NSString *viewFooterClass;
//区尾nib name
@property (nonatomic, copy) NSString *nibFooterName;
//区头部的高度
@property (nonatomic, strong) NSNumber *sectionHeaderHeight;
//区尾部的高度
@property (nonatomic, strong) NSNumber *sectionFooterHeight;
//区对应的rowsdata
@property (nonatomic, strong) NSMutableArray <id<LTListRowProtocol>>*rowArray;
@end
NS_ASSUME_NONNULL_END
