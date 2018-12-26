//
//  LTListViewModelProtocol.h
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTListBaseModelProtocol.h"
#import "LTListBaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@protocol LTTableRowModelProtocol<NSObject>
@property (nonatomic, strong) NSString *(^configCellReusable)(UITableView *tableView,NSIndexPath *indexPath);
@property (nonatomic, strong) void(^configCellData)(UITableView *tableView,id<LTListBaseCellProtocol>cell,id<LTListRowProtocol>rowData);
@property (nonatomic, strong) void(^didSelectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id<LTListRowProtocol>rowData);
@property (nonatomic, strong) float(^configRowHeight)(UITableView *tableView,NSIndexPath *indexPath);
@property (nonatomic, strong) id<LTListRowProtocol>rowData;
@end

@protocol LTTableSectionModeProtocol<NSObject>
@property (nonatomic, strong) float(^configHeaderHeight)(UITableView *tableView,NSInteger section);
@property (nonatomic, strong) float(^configFooterHeight)(UITableView *tableView,NSInteger section);
@property (nonatomic, strong) id<LTListBaseViewProtocol>(^configHeaderView)(UITableView *tableView,NSInteger section);
@property (nonatomic, strong) id<LTListBaseViewProtocol>(^configFooterView)(UITableView *tableView,NSInteger section);
@property (nonatomic, strong) void(^configHeaderData)(UITableView *tableView,NSInteger section,id<LTListBaseViewProtocol>view, id<LTListSectionProtocol>sectionData);
@property (nonatomic, strong) void(^configFooterData)(UITableView *tableView,NSInteger section,id<LTListBaseViewProtocol>view, id<LTListSectionProtocol>footerData);
@property (nonatomic, strong) id<LTListSectionProtocol>headerData;
@property (nonatomic, strong) id<LTListSectionProtocol>footerData;
@property (nonatomic, strong) NSMutableArray <id<LTTableRowModelProtocol>>*rowDataArray;
@end

@protocol LTListViewModelProtocol <NSObject>
@property (nonatomic, strong) NSMutableArray <id<LTTableSectionModeProtocol>>*dataArray;
@end

NS_ASSUME_NONNULL_END
