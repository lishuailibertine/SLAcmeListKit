//
//  LTListAssemble.m
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import "LTListAssemble.h"
#import "LTListViewModel.h"
#import "LTListAgency.h"
#import "LTListBaseViewClass.h"
@interface LTListAssemble()
@property (nonatomic, strong) LTListAgency *listAgency;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation LTListAssemble
-(LTListAgency *)listAgency{
    if (!_listAgency) {
        _listAgency =[[LTListAgency alloc] init];
    }
    return _listAgency;
}
- (instancetype)init{
    if(self =[super init]){
        self.listAgency.tableDataModel =[[LTListViewModel alloc] init];
    }
    return self;
}
//配置代理
+ (instancetype)createListAssemble:(UITableView *)tableView{
    LTListAssemble * listAssemble =[[LTListAssemble alloc] init];
     NSLog(@"test");
    tableView.delegate =listAssemble.listAgency;
    tableView.dataSource =listAssemble.listAgency;
    listAssemble.tableView =tableView;
    return listAssemble;
}
- (void)updateListWithModels:(NSArray <id<LTListSectionProtocol>>*)dataArray{
    
    __weak typeof(self)weakSelf = self;
    [self.listAgency.tableDataModel.dataArray removeAllObjects];
    [dataArray enumerateObjectsUsingBlock:^(id<LTListSectionProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf)self = weakSelf;
        LTTableSectionModel *sectionModel =[[LTTableSectionModel alloc] init];
        [sectionModel setConfigHeaderHeight:^float(UITableView * _Nonnull tableView, NSInteger section) {
            float height = obj.sectionHeaderHeight?obj.sectionHeaderHeight.floatValue:0.f;
            return height;
        }];
        [sectionModel setConfigFooterHeight:^float(UITableView * _Nonnull tableView, NSInteger section) {
            float height = obj.sectionFooterHeight?obj.sectionFooterHeight.floatValue:0.f;
            return height;
        }];
        [sectionModel setConfigHeaderView:^id<LTListBaseViewProtocol> _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
            return [self configHeaderView:tableView section:section obj:obj];
        }];
        [sectionModel setConfigFooterView:^id<LTListBaseViewProtocol> _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
            return [self configFooterView:tableView section:section obj:obj];
        }];
        [sectionModel setConfigHeaderData:^(UITableView * _Nonnull tableView, NSInteger section, id<LTListBaseViewProtocol> _Nonnull view, id<LTListSectionProtocol>  _Nonnull sectionData) {
            [self configHeaderData:tableView section:section headerView:view sectionData:sectionData];
        }];
        [sectionModel setConfigFooterData:^(UITableView * _Nonnull tableView, NSInteger section, id<LTListBaseViewProtocol> _Nonnull view, id<LTListSectionProtocol>  _Nonnull footerData) {
            [self configFooterData:tableView section:section footerView:view sectionData:footerData];
        }];
        sectionModel.headerData =obj;
        sectionModel.footerData =obj;
        [obj.rowArray enumerateObjectsUsingBlock:^(id<LTListRowProtocol>  _Nonnull rowObj, NSUInteger idx, BOOL * _Nonnull stop) {
            LTTableRowModel *rowModel =[[LTTableRowModel alloc] init];
            [rowModel setConfigCellReusable:^NSString * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                return rowObj.cellReusable;
            }];
            [rowModel setConfigCellData:^(UITableView * _Nonnull tableView, id<LTListBaseCellProtocol>  _Nonnull cell, id<LTListRowProtocol>  _Nonnull rowData) {
                [cell fillDataWithModel:rowData];
            }];
            [rowModel setDidSelectRowAtIndexPath:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath, id<LTListRowProtocol>  _Nonnull rowData) {
                [self didSelectRow:tableView IndexPath:indexPath rowData:rowData];
            }];
            [rowModel setConfigRowHeight:^float(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                return rowObj.rowHeight.floatValue;
            }];
            rowModel.rowData =rowObj;
            [sectionModel.rowDataArray addObject:rowModel];
        }];
        [self.listAgency.tableDataModel.dataArray addObject:sectionModel];
    }];
    [self.tableView reloadData];
}
#pragma 特殊情况可被子类重写
- (id<LTListBaseViewProtocol>)configHeaderView:(UITableView *)tableView section:(NSInteger)section obj:(id<LTListSectionProtocol>)obj{
    id<LTListBaseViewProtocol> headerView = [LTListBaseViewClass createViewWithClass:NSClassFromString(obj.viewHeaderClass) nibName:obj.nibHeaderName];
    return headerView;
}
- (id<LTListBaseViewProtocol>)configFooterView:(UITableView *)tableView section:(NSInteger)section obj:(id<LTListSectionProtocol>)obj{
    id<LTListBaseViewProtocol> footerView = [LTListBaseViewClass createViewWithClass:NSClassFromString(obj.viewFooterClass) nibName:obj.nibFooterName];
    return footerView;
}
- (void)configHeaderData:(UITableView *)tableView section:(NSInteger)section headerView:(id<LTListBaseViewProtocol>)headerView sectionData:(id<LTListSectionProtocol>)sectionData{
    [headerView fillData:sectionData];
}
- (void)configFooterData:(UITableView *)tableView section:(NSInteger)section footerView:(id<LTListBaseViewProtocol>)footerView sectionData:(id<LTListSectionProtocol>)sectionData{
    [footerView fillData:sectionData];
}
- (void)didSelectRow:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath rowData:(id<LTListRowProtocol> )rowData{
    
}
@end
