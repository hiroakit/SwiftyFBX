//
//  FBXLight.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import "FBXLight.h"
#import "FBXLight_Internal.h"
#import "fbxsdk.h"

@implementation FBXLight
{    
    FbxLight* _cLight;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cLight = NULL;
    }
    
    return self;
}

- (instancetype)initWithCLight:(FbxLight* )cLight
{
    self = [self init];
    if (cLight != NULL) {
        _cLight = cLight;
    }
    
    return self;
}

- (NSString *)name
{
    if (_cLight == NULL) {
        return @"";
    }

    NSString *name = [NSString stringWithCString:_cLight->GetName() encoding:NSUTF8StringEncoding];
    if (name == nil) {
        return @"";
    }

    return name;
}
@end
