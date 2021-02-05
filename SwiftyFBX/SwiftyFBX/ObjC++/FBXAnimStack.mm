//
//  FBXAnimStack.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/31.
//

#import "FBXAnimStack.h"
#import "FBXAnimStack_Internal.h"
#import <fbxsdk.h>

@implementation FBXAnimStack
{
    FbxAnimStack *_cAnimStack;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cAnimStack = NULL;
    }
    return self;
}

- (instancetype)initWithCAnimStack:(FbxAnimStack *)cAnimStack
{
    self = [self init];
    if (cAnimStack != NULL) {
        _cAnimStack = cAnimStack;
    }
    
    return self;
}

- (NSString *)getName
{
    if (_cAnimStack == NULL) {
        return @"";
    }
    
    const char* pName = _cAnimStack->GetName();
    if (pName == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pName
                              encoding:NSUTF8StringEncoding];
}

- (long long)getFrameCount
{
    if (_cAnimStack == NULL) {
        return 0;
    }
    
    FbxTimeSpan span = _cAnimStack->GetLocalTimeSpan();
    FbxTime time = span.GetDuration();
    
    return (long long)time.GetFrameCount();
}
@end
