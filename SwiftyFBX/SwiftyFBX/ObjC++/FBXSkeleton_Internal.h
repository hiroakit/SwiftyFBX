//
//  FBXSkeleton_Internal.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/23.
//

#import <Foundation/Foundation.h>
#import <fbxsdk.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXSkeleton ()
- (instancetype)initWithCSkeleton:(FbxSkeleton* )cSkeleton;
@end

NS_ASSUME_NONNULL_END
