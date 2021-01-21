//
//  FBXTexture.h
//  SwiftyFBX
//
//  Created by hiroakit on 2021/01/17.
//

#import <Foundation/Foundation.h>
#import "fbxsdk.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXTexture ()
- (instancetype)initWithCTexture:(FbxTexture* )cTexture;
@end

NS_ASSUME_NONNULL_END
