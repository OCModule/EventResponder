//
//  UIResponder+Router.h
//  EventResponder
//
//  Created by Steve on 2019/4/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
