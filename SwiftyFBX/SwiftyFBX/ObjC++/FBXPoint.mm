//
//  FBXPoint.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/02/11.
//

#import "FBXPoint.h"

@implementation FBXPoint
+ (instancetype)pointWithX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z
{
    FBXPoint *point = [[FBXPoint alloc] init];
    point.x = x;
    point.y = y;
    point.z = z;
    
    return point;
}
@end
