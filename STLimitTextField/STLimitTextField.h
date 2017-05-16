//
//  STLimitTextField.h
//  STLimitTextField
//
//  Created by Suta on 2017/4/28.
//  Copyright © 2017年 Suta. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, STLimitType) {
    STLimitLength = 0,
    STLimitChar
};

@interface STLimitTextField : UITextField

@property (nonatomic, assign) IBInspectable NSUInteger limit;
@property (nonatomic, assign) STLimitType limitType;

@end
