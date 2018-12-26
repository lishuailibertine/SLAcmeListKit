//
//  LTListBaseViewClass.m
//  AcmeListKit
//
//  Created by Touker on 2018/12/25.
//

#import "LTListBaseViewClass.h"

@implementation LTListBaseViewClass
+ (instancetype)createViewWithClass:(Class)class nibName:(NSString *)nibName{
    return (LTListBaseViewClass *)[LTListBaseViewClass getNibViewWithClass:class nibName:nibName];
}
+ (UIView *)getNibViewWithClass:(Class)withClass nibName:(NSString *)nibName;{
    if (withClass==NULL||nibName==nil) {
        return nil;
    }
    UIView * contentView;
    NSBundle * xibBundle =[NSBundle bundleForClass:[self class]];
    for (id nibView in [xibBundle loadNibNamed:nibName owner:self options:nil]) {
        if ([nibView isKindOfClass:[withClass class]]) {
            contentView =nibView;
            break;
        }
    }
    return contentView;
}
+ (UIView *)getBackView:(UIView *)view className:(Class)className;{
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:className]) {
            return subview;
        }
    }
    return nil;
}
- (void)fillData:(id)data{};
@end

@implementation LTListBaseCellClass
- (void)fillDataWithModel:(id<LTListRowProtocol>)model{
    
}
@end
