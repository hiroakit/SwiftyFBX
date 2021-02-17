//
//  FBXIOFileHeaderInfo_Internal.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/02/17.
//

#import <Foundation/Foundation.h>
#import <fbxsdk.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXIOFileHeaderInfo ()
- (instancetype)initWithCIOFileHeaderInfo:(FbxIOFileHeaderInfo*)cHeaderInfo;
@end

NS_ASSUME_NONNULL_END
