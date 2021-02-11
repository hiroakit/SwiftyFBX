//
//  FBXPoint.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/02/11.
//

#import <Foundation/Foundation.h>
#import "FBXStruct.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXPoint : NSObject
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat z;

+ (instancetype)pointWithX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z;
@end

NS_ASSUME_NONNULL_END
