//
//  LTListBaseViewClass.h
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import "LTListBaseViewProtocol.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface LTListBaseViewClass : UIView<LTListBaseViewProtocol>
+ (instancetype)createViewWithClass:(Class)class nibName:(NSString *)nibName;
+ (UIView *)getBackView:(UIView *)view className:(Class)className;
@end

@interface LTListBaseCellClass : UITableViewCell <LTListBaseCellProtocol>

@end
NS_ASSUME_NONNULL_END
