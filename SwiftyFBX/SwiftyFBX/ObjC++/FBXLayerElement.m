//
//  FBXLayerElement.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/10.
//

#import "FBXLayerElement.h"

@implementation FBXLayerElement

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"";
        _mappingMode = FBXLayerElementMappingModeNone;
        _referenceMode = FBXLayerElementReferenceModeIndex;
    }
    return self;
}

@end
