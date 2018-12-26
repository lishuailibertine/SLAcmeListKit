//
//  LTListViewModel.m
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import "LTListViewModel.h"
@implementation LTTableRowModel
@synthesize configCellReusable =_configCellReusable,configCellData =_configCellData,didSelectRowAtIndexPath =_didSelectRowAtIndexPath, configRowHeight =_configRowHeight,rowData =_rowData;
@end
@implementation LTTableSectionModel
@synthesize configHeaderHeight =_configHeaderHeight,configFooterHeight =_configFooterHeight,configHeaderView =_configHeaderView,configFooterView =_configFooterView,configHeaderData =_configHeaderData,configFooterData =_configFooterData,headerData =_headerData,footerData =_footerData,rowDataArray =_rowDataArray;
- (NSMutableArray *)rowDataArray{
    if (!_rowDataArray) {
        _rowDataArray =[NSMutableArray array];
    }
    return _rowDataArray;
}
@end
@implementation LTListViewModel
@synthesize dataArray =_dataArray;
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray =[NSMutableArray array];
    }
    return _dataArray;
}
@end
