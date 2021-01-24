//
//  FBXSkeleton.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/23.
//

#import "FBXSkeleton.h"
#import "FBXSkeleton_Internal.h"
#import "fbxsdk.h"

@implementation FBXSkeleton
{
    FbxSkeleton* _cSkeleton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cSkeleton = NULL;
    }
    return self;
}

- (instancetype)initWithCSkeleton:(FbxSkeleton *)cSkeleton
{
    self = [self init];
    if(cSkeleton == NULL) {
        return self;
    }
    _cSkeleton = cSkeleton;
    
    return self;
}
@end
