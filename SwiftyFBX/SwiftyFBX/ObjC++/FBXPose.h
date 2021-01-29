//
//  FBXPose.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXPose : NSObject
@property (nonatomic, readonly, getter=getName) NSString *name;
@property (nonatomic, readonly, getter=isBindPose) BOOL bindPose;
- (NSString *)getName;
- (BOOL)isBindPose;
@end

NS_ASSUME_NONNULL_END
