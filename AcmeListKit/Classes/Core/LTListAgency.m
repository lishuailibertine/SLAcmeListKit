//
//  LTListAgency.m
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import "LTListAgency.h"
@implementation LTListAgency
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.tableDataModel.dataArray) {
        return self.tableDataModel.dataArray.count;
    }return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    id<LTTableSectionModeProtocol>sectionModel =[self.tableDataModel.dataArray objectAtIndex:section];
    return sectionModel.configHeaderHeight?sectionModel.configHeaderHeight(tableView,section):0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    id<LTTableSectionModeProtocol>sectionModel =[self.tableDataModel.dataArray objectAtIndex:section];
    return sectionModel.configFooterHeight?sectionModel.configFooterHeight(tableView,section):0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    id<LTTableSectionModeProtocol>sectionModel =[self.tableDataModel.dataArray objectAtIndex:section];
    id<LTListBaseViewProtocol>sectionView =nil;
    sectionView = sectionModel.configHeaderView?(id<LTListBaseViewProtocol>)sectionModel.configHeaderView(tableView,section):(id<LTListBaseViewProtocol>)[[UIView alloc] init];
    if (sectionModel.configHeaderData) {
        sectionModel.configHeaderData(tableView,section, sectionView, sectionModel.headerData);
    }
    return (UIView *)sectionView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;{
    id<LTTableSectionModeProtocol>footerModel =[self.tableDataModel.dataArray objectAtIndex:section];
    id<LTListBaseViewProtocol>footerView =nil;
    footerView = footerModel.configFooterView?(id<LTListBaseViewProtocol>)footerModel.configFooterView(tableView,section):(id<LTListBaseViewProtocol>)[[UIView alloc] init];
    if (footerModel.configFooterData) {
        footerModel.configFooterData(tableView,section, footerView, footerModel.footerData);
    }
    return (UIView *)footerView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id<LTTableSectionModeProtocol>sectionModel =[self.tableDataModel.dataArray objectAtIndex:section];
    return sectionModel.rowDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id<LTListBaseCellProtocol>cell;
    id<LTTableSectionModeProtocol>sectionModel =[self.tableDataModel.dataArray objectAtIndex:indexPath.section];
    id<LTTableRowModelProtocol>rowModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];
    cell =[tableView dequeueReusableCellWithIdentifier:rowModel.configCellReusable(tableView,indexPath)];
    if (rowModel.configCellData) {
        rowModel.configCellData(tableView,cell, rowModel.rowData);
    }
    return (UITableViewCell *)cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id<LTTableSectionModeProtocol>sectionModel =[self.tableDataModel.dataArray objectAtIndex:indexPath.section];
    id<LTTableRowModelProtocol>rowModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];
    if (rowModel.didSelectRowAtIndexPath) {
        rowModel.didSelectRowAtIndexPath(tableView, indexPath,rowModel.rowData);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id<LTTableSectionModeProtocol>sectionModel =[self.tableDataModel.dataArray objectAtIndex:indexPath.section];
    id<LTTableRowModelProtocol>rowModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];
    return rowModel.configRowHeight?rowModel.configRowHeight(tableView,indexPath):0;
}
@end
