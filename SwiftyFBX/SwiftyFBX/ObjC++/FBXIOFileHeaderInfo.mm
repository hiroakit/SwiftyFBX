//
//  FBXIOFileHeaderInfo.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/02/17.
//

#import "FBXIOFileHeaderInfo.h"
#import <fbxsdk.h>

@implementation FBXIOFileHeaderInfo
{
    FbxIOFileHeaderInfo* _cHeaderInfo;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cHeaderInfo = NULL;
    }
    return self;
}

- (instancetype)initWithCIOFileHeaderInfo:(FbxIOFileHeaderInfo*)cHeaderInfo
{
    self = [super init];
    if (self) {
        _cHeaderInfo = cHeaderInfo;
    }
    return self;
}

- (NSString *)getCreator
{
    if (_cHeaderInfo == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:_cHeaderInfo->mCreator.Buffer() encoding:NSUTF8StringEncoding];
}
@end
