//
//  FBXColor.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/31.
//

#import "FBXColor.h"

@implementation FBXColor
{
    CGFloat _red;
    CGFloat _green;
    CGFloat _blue;
    CGFloat _alpha;
}

+ (instancetype)empty
{
    return [[FBXColor alloc] initWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _red = 0.0f;
        _green = 0.0f;
        _blue = 0.0f;
        _alpha = 0.0f;
    }
    return self;
}

- (instancetype)initWithRed:(CGFloat)red
                      green:(CGFloat)green
                       blue:(CGFloat)blue
                      alpha:(CGFloat)alpha
{
    self = [self init];
    _red = red;
    _green = green;
    _blue = blue;
    _alpha = alpha;
    
    return  self;
}

- (CGFloat)getRed
{
    return _red;
}

- (CGFloat)getGreen
{
    return _green;
}

- (CGFloat)getBlue
{
    return _blue;
}

- (CGFloat)getAlpha
{
    return _alpha;
}

@end
