//
//  LTTestListViewController.m
//  AcmeListKit_Example
//
//  Created by Touker on 2018/12/25.
//  Copyright © 2018年 lishuailibertine. All rights reserved.
//

#import "LTTestListViewController.h"
#import "LTListBaseViewClass.h"
#import "LTListBaseModelClass.h"
#import "LTListAssemble.h"
@interface LTListTestRowClass : LTListBaseRowClass
/**one*/
@property (nonatomic, copy) NSString *oneTest;
/**two*/
@property (nonatomic, copy) NSString *twoTest;
/**three*/
@property (nonatomic, copy) NSString *threeTest;
@end

@implementation LTListTestRowClass
- (NSString *)cellReusable{
    return @"LTListTestCellClass";
}
- (NSNumber *)rowHeight{
    return [NSNumber numberWithFloat:50.f];
}
@end
@interface LTListTestCellClass : LTListBaseCellClass
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;
@end
@implementation LTListTestCellClass
- (void)fillDataWithModel:(id<LTListRowProtocol>)model{
    LTListTestRowClass *rowClass =(LTListTestRowClass *)model;
    [self.oneLabel setText:rowClass.oneTest];
    [self.twoLabel setText:rowClass.twoTest];
    [self.threeLabel setText:rowClass.threeTest];
}
@end

@interface LTTestListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) LTListAssemble *listAssemble;
@end

@implementation LTTestListViewController
- (LTListAssemble *)listAssemble{
    if (!_listAssemble) {
        _listAssemble =[LTListAssemble createListAssemble:self.tableView];
    }
    return _listAssemble;
}
+ (instancetype)createTestListViewController{
    LTTestListViewController * listViewController =[LTTestListViewController createFromStoryboardWithStoryboardID:@"LTTestListViewController" storyboardName:@"LTTestListViewController" bundleName:nil];
    return listViewController;
}
+ (instancetype)createFromStoryboardWithStoryboardID:(NSString *)aStoryboardID storyboardName:(NSString *)aStoryboardName  bundleName:(NSString *)aBundleName {
    NSBundle *bundle = [self getBundleWithBundleName:aBundleName];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:aStoryboardName bundle:bundle];
    return [storyboard instantiateViewControllerWithIdentifier:aStoryboardID];
}

+ (NSBundle *)getBundleWithBundleName:(NSString *)aBundleName {
    NSBundle *bundle = [NSBundle mainBundle];
    if (aBundleName.length) {
        bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:aBundleName withExtension:@"bundle"]];
    }
    return bundle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    LTListBaseSectionClass *sectionClass =[[LTListBaseSectionClass alloc] init];
    [sectionClass.rowArray addObject:[self createTestCellModel]];
    [self.listAssemble updateListWithModels:@[sectionClass]];
    // Do any additional setup after loading the view.
}
- (LTListTestRowClass *)createTestCellModel{
    LTListTestRowClass *cellModel =[[LTListTestRowClass alloc] init];
    cellModel.oneTest =@"one";
    cellModel.twoTest =@"two";
    cellModel.threeTest =@"three";
    return cellModel;
}
@end
