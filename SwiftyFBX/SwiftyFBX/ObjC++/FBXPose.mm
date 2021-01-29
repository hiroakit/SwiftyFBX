//
//  FBXPose.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/29.
//

#import "FBXPose.h"
#import "FBXPose_Internal.h"
#import <fbxsdk.h>

@implementation FBXPose
{
    FbxPose* _cPose;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cPose = NULL;
    }
    return self;
}

- (instancetype)initWithCPose:(FbxPose*)cPose
{
    self = [self init];
    if (cPose != NULL) {        
        _cPose = cPose;
    }
    
    return self;
}

- (NSString *)getName
{
    const char *pName = _cPose->GetName();
    if (pName == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pName
                              encoding:NSUTF8StringEncoding];
}

- (BOOL)isBindPose
{
    if (_cPose == NULL) {
        return NO;
    }

    return (BOOL)_cPose->IsBindPose();
}
@end
