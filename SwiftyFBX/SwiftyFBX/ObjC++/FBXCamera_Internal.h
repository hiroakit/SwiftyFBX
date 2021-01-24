//
//  FBXCamera_Internal.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import <Foundation/Foundation.h>
#import <fbxsdk.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXCamera()
- (instancetype)initWithCCamera:(FbxCamera* )cCamera;
@end

NS_ASSUME_NONNULL_END
