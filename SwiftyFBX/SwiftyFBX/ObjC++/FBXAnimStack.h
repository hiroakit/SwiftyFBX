//
//  FBXAnimStack.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXAnimStack : NSObject
@property (nonatomic, readonly, getter=getName) NSString *name;
@property (nonatomic, readonly, getter=getFrameCount) long long frameCount;
- (NSString *)getName;
- (long long)getFrameCount;
@end

NS_ASSUME_NONNULL_END
