//
//  FBXLight_Internal.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import <Foundation/Foundation.h>
#import "fbxsdk.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXLight ()
- (instancetype)initWithCLight:(FbxLight* )cLight;
@end

NS_ASSUME_NONNULL_END
