//
//  FBXNode.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "FBXNode.h"
#import "FBXNode_Internal.h"
#import <fbxsdk.h>

@implementation FBXNode
{
    FbxNode* _cNode;
}

- (instancetype)initWithCNode:(FbxNode* )cNode
{
    self = [super init];
    if (self) {
        _cNode = cNode;
    }
    return self;
}

- (Position)getTranslation
{
    if (_cNode == NULL) {
        return PositionZero;
    }
        
    FbxDouble3 translation = _cNode->LclTranslation.Get();
    return PositionMake(translation[0], translation[1], translation[2]);
}

- (void)setTranslation:(Position)value
{
    if (_cNode == NULL) {
        return;
    }
    
    FbxDouble3 translation = FbxDouble3(value.x, value.y, value.z);
    _cNode->LclTranslation.Set(translation);
}

- (Position)getRotation
{
    if (_cNode == NULL) {
        return PositionZero;
    }

    FbxDouble3 rotation = _cNode->LclRotation.Get();
    return PositionMake(rotation[0], rotation[1], rotation[2]);
}

- (void)setRotation:(Position)value
{
    if (_cNode == NULL) {
        return;
    }
    
    FbxDouble3 rotation = FbxDouble3(value.x, value.y, value.z);
    _cNode->LclRotation.Set(rotation);
}

- (Position)getScale
{
    if (_cNode == NULL) {
        return PositionZero;
    }
    
    FbxDouble3 scale = _cNode->LclScaling.Get();
    return PositionMake(scale[0], scale[1], scale[2]);
}

- (void)setScale:(Position)value
{
    if (_cNode == NULL) {
        return;
    }
    
    FbxDouble3 scale = FbxDouble3(value.x, value.y, value.z);
    _cNode->LclScaling.Set(scale);
}

@end

