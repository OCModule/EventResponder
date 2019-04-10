//
//  UIView+HRNTouchArea.m
//  Pods
//
//  Created by Steve on 2019/4/4.
//

#import "UIView+HRNTouchArea.h"
#import <objc/runtime.h>

@implementation UIView (HRNTouchArea)

#pragma - mark public

- (void)setExpandedAreaEdge:(UIEdgeInsets)edge {
    NSValue *value = [NSValue valueWithUIEdgeInsets:edge];
    objc_setAssociatedObject(self, _cmd, value, OBJC_ASSOCIATION_RETAIN);
}

#pragma - mark override

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect expandedClickedRect = [self _expandedClickRect];
    return CGRectContainsPoint(expandedClickedRect, point);
}

- (CGRect)_expandedClickRect {
    UIEdgeInsets edge = [self _expandedAreaEdge];
    CGFloat newX = self.bounds.origin.x - edge.left;
    CGFloat newY = self.bounds.origin.y - edge.top;
    CGFloat newW = self.bounds.size.width + edge.right + edge.left;
    CGFloat newH = self.bounds.size.height + edge.top + edge.bottom;
    CGRect expandedClickRect = CGRectMake(newX, newY, newW, newH);
    return expandedClickRect;
}

- (UIEdgeInsets)_expandedAreaEdge {
    NSValue *value = objc_getAssociatedObject(self, @selector(setExpandedAreaEdge:));
    UIEdgeInsets insets= [value UIEdgeInsetsValue];
    return insets;
}

@end
