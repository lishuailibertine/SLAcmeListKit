//
//  LTListBaseClass.m
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import "LTListBaseModelClass.h"

@implementation LTListBaseRowClass
@synthesize cellReusable =_cellReusable,rowHeight =_rowHeight;
@end

@implementation LTListBaseSectionClass
@synthesize rowArray =_rowArray,sectionHeaderHeight=_sectionHeaderHeight,sectionFooterHeight =_sectionFooterHeight;
@synthesize viewHeaderClass =_viewHeaderClass,viewFooterClass =_viewFooterClass,nibHeaderName =_nibHeaderName,nibFooterName =_nibFooterName;
- (NSMutableArray *)rowArray{
    if (!_rowArray) {
        _rowArray =[NSMutableArray array];
    }
    return _rowArray;
}
@end
