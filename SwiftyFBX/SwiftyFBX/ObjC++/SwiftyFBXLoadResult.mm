//
//  SwiftyFBXLoadResult.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/08.
//

#import "SwiftyFBXLoadResult.h"
#import "SwiftyFBXFileFormatVersion.h"
#import "FBXScene.h"

@implementation SwiftyFBXLoadResult
- (instancetype)initWithResult:(BOOL)result formatVersion:(SwiftyFBXFileFormatVersion *)formatVersion scene:(FBXScene *)scene
{
    self = [super init];
    if (self) {
        _isSuccessful = result;
        _formatVersion = formatVersion;
        _scene = scene;
    }
    return self;
}
@end
