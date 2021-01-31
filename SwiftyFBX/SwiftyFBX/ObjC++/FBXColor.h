//
//  FBXColor.h
//  SwiftyFBX
//
//  Created by hiroakit on 2021/01/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXColor : NSObject
@property (nonatomic, readonly, getter=getRed) CGFloat red;
@property (nonatomic, readonly, getter=getGreen) CGFloat green;
@property (nonatomic, readonly, getter=getBlue) CGFloat blue;
@property (nonatomic, readonly, getter=getAlpha) CGFloat alpha;

- (instancetype)initWithRed:(CGFloat)red
                      green:(CGFloat)green
                       blue:(CGFloat)blue
                      alpha:(CGFloat)alpha;

+ (instancetype)empty;

- (CGFloat)getRed;
- (CGFloat)getGreen;
- (CGFloat)getBlue;
- (CGFloat)getAlpha;
@end

NS_ASSUME_NONNULL_END
