//
//  FBXAnimStack.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/31.
//

#import <Foundation/Foundation.h>
#import <fbxsdk.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXAnimStack ()
- (instancetype)initWithCAnimStack:(FbxAnimStack* )cAnimStack;
@end

NS_ASSUME_NONNULL_END

