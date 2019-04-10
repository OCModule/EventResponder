//
//  UIView+ERHitTest.m
//  EventResponder
//
//  Created by Steve on 2019/4/10.
//

#import "UIView+ERHitTest.h"

@implementation UIView (ERHitTest)

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 如果 hitView 有事件响应 按钮（UIButton 继承自UIControl ）就允许点击
    if(![self isKindOfClass:[UIControl class]] && (self.gestureRecognizers.count < 1)){
        return nil;
    }
    return self;
}

@end
