//
//  SwiftyFBXLoadResult.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/08.
//

#import "SwiftyFBXLoadResult.h"
#import "SwiftyFBXFormat.h"
#import "FBXScene.h"

@implementation SwiftyFBXLoadResult
- (instancetype)initWithResult:(BOOL)result
                        format:(SwiftyFBXFormat *)format
                         scene:(FBXScene *)scene
{
    self = [super init];
    if (self) {
        _isSuccessful = result;
        _format = format;
        _scene = scene;
        _headerInfo = nil;
    }
    return self;
}
@end
