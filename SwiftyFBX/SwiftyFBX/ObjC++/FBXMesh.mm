//
//  FBXMesh.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "FBXMesh.h"
#import "FBXMesh_Internal.h"
#import "FBXLayerElementNormal.h"
#import "FBXLayerElementNormal_Internal.h"
#import "FBXNode.h"
#import "FBXNode_Internal.h"
#import "FBXStruct.h"
#import "fbxsdk.h"

@interface FBXMesh ()
@property (nonatomic)FbxMesh* cMesh;
@end

@implementation FBXMesh

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cMesh = NULL;
    }
    return self;
}

- (instancetype)initWithCMesh:(FbxMesh* )cMesh
{
    self = [self init];
    if(cMesh == NULL) {
        return self;
    }
    
    _cMesh = cMesh;
    
    return self;
}

- (FBXNode*)getNode
{
    if (_cMesh == NULL) {
        return [[FBXNode alloc] init];
    }
    
    FbxNode* node = _cMesh->GetNode();
    if (node == NULL) {
        return [[FBXNode alloc] init];
    }

    return [[FBXNode alloc] initWithCNode:node];
}

- (NSString *)getName
{
    if (_cMesh == NULL) {
        return @"";
    }

    NSString *name = [NSString stringWithCString:_cMesh->GetName() encoding:NSUTF8StringEncoding];
    if (name == nil) {
        return @"";
    }

    return name;
}

- (Position)getTranslation
{
    if (_cMesh == NULL) {
        return PositionZero;
    }
    
    return self.node.translation;
}

- (Position)getRotation
{
    if (_cMesh == NULL) {
        return PositionZero;
    }
    
    return self.node.rotation;
}

- (Position)getScale
{
    if (_cMesh == NULL) {
        return PositionZero;
    }
    
    return self.node.scale;
}

- (int)getControlPointsCount
{
    if (_cMesh == NULL) {
        return 0;
    }
    return _cMesh->GetControlPointsCount();
}

- (FbxVector4* )getControlPoints
{
    if (_cMesh == NULL) {
        return NULL;
    }

    return _cMesh->GetControlPoints();
}

- (int)getElementNormalCount
{
    if (_cMesh == NULL) {
        return NULL;
    }
    return _cMesh->GetElementNormalCount();
}

- (FBXLayerElementNormal *)getElementNormalAtIndex:(int)index
{
    FbxGeometryElementNormal* cNormals = self.cMesh->GetElementNormal(index);
    return [FBXLayerElementNormal createWithCLayerElementNormal:cNormals];
}

- (void)getElementTangentCount
{
    self.cMesh->GetElementTangentCount();
}

- (void)GetElementTangentAtIndex:(int)index
{
    self.cMesh->GetElementTangent(index);
}

- (int)getPolygonCount
{
    if (_cMesh == NULL) {
        return 0;
    }
        
    return _cMesh->GetPolygonCount();
}

- (int*)getPolygonVertices
{
    if (_cMesh == NULL) {
        return nullptr;
    }
    return _cMesh->GetPolygonVertices();
}

- (int)getPolygonVertexCount
{
    if (_cMesh == NULL) {
        return 0;
    }
        
    return _cMesh->GetPolygonVertexCount();
}

- (void)getElementPolygonGroupCount
{
    self.cMesh->GetElementPolygonGroupCount();
}

- (void)getElementPolygonGroup
{
    self.cMesh->GetElementPolygonGroup();
}

- (void)getPolygonSizeAtIndex:(int)index
{
    self.cMesh->GetPolygonSize(index);
}

- (void)getPolygonVertexAtIndexPath:(NSIndexPath*)indexPath
{
    self.cMesh->GetPolygonVertex(0, 0);
}

- (void)getElementVertexColorCount
{
    self.cMesh->GetElementVertexColorCount();
}

- (void)getElementVertexColorAtIndex:(int)index
{
    self.cMesh->GetElementVertexColor(index);
}

- (void)getElementUVCount
{
    self.cMesh->GetElementUVCount();
}

- (void)getElementUVAtIndex:(int)index
{
    self.cMesh->GetElementUV(index);
}

- (void)getTextureUVIndex
{
    self.cMesh->GetTextureUVIndex(0, 0);
}

- (void)getElementMaterialCount
{
    self.cMesh->GetElementMaterialCount();
}

- (void)getElementMaterialAtIndex:(int)index
{
    self.cMesh->GetElementMaterial(index);
}

- (void)getElementVisibilityCount
{
    self.cMesh->GetElementVisibilityCount();
}

- (void)getElementVisibilityAtIndex:(int)index
{
    self.cMesh->GetElementVisibility(index);
}
@end
