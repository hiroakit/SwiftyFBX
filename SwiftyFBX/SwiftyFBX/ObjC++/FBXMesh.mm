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
#import "FBXPoint.h"
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

- (NSArray<FBXPoint*>*)getControlPoints
{
    NSMutableArray<FBXPoint*> *controlPoints = [NSMutableArray array];
    
    if (_cMesh == NULL) {
        return controlPoints;
    }
    
    FbxVector4* points = _cMesh->GetControlPoints();
    if (points == NULL) {
        return controlPoints;
    }

    int lengthOfMData = std::extent<decltype(points->mData)>::value;
    if (lengthOfMData < 3) {
        return controlPoints;
    }

    int pointCount = _cMesh->GetControlPointsCount();
    for (int i = 0; i < pointCount; i++) {
        FBXPoint *point = [FBXPoint pointWithX:points[i][0] y:points[i][1] z:points[i][2]];
        [controlPoints addObject:point];
    }
    
    return controlPoints;
}

- (int)getElementNormalCount
{
    if (_cMesh == NULL) {
        return NULL;
    }
    return _cMesh->GetElementNormalCount();
}

- (FBXLayerElementNormal *)getElementNormal
{
    if (_cMesh == NULL) {
        return nil;
    }

    FbxGeometryElementNormal* cNormal = _cMesh->GetElementNormal();
    if (cNormal == NULL) {
        return nil;
    }
    
    return [FBXLayerElementNormal createWithCLayerElementNormal:(FbxLayerElementNormal*)cNormal];
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

- (NSArray<FBXPoint*>*)getPolygonVertices
{
    NSMutableArray<FBXPoint*> *vertices = [NSMutableArray array];
    
    if (_cMesh == NULL) {
        return vertices;
    }
    
    int* polygonVertices = _cMesh->GetPolygonVertices();
    if (polygonVertices == NULL) {
        return vertices;
    }
    
    int polygonVertexCount = [self getPolygonVertexCount];
    if (polygonVertexCount < 1) {
        return vertices;
    }
    
    FbxVector4* controlPoints = _cMesh->GetControlPoints();
    if (controlPoints == NULL) {
        return vertices;
    }
        
    for (int i = 0; i < polygonVertexCount; i++) {
        int cursor = polygonVertices[i];
        FBXPoint *point = [FBXPoint pointWithX:controlPoints[cursor][0]
                                             y:controlPoints[cursor][1]
                                             z:controlPoints[cursor][2]];
        [vertices addObject:point];
    }
    
    return vertices;
}

- (int)getPolygonVertexCount
{
    if (_cMesh == NULL) {
        return 0;
    }
        
    return _cMesh->GetPolygonVertexCount();
}

- (NSArray<FBXPoint*>*)getPolygonVertexNormals
{
    NSMutableArray *polygonVertexNormals = [NSMutableArray array];
    if (_cMesh == NULL) {
        return polygonVertexNormals;
    }
        
    FbxArray<fbxsdk::FbxVector4> normals;
    BOOL status = _cMesh->GetPolygonVertexNormals(normals);
    if (!status || normals.GetCount() < 1) {
        return polygonVertexNormals;
    }
    
    FbxVector4 hoge = normals.GetFirst();
    int lengthOfMData = std::extent<decltype(hoge.mData)>::value;
    if (lengthOfMData < 3) {
        return polygonVertexNormals;
    }

    for (int i = 0; i < normals.Size(); i++) {
        FBXPoint *normal = [FBXPoint pointWithX:normals[i][0]
                                              y:normals[i][1]
                                              z:normals[i][2]];
        [polygonVertexNormals addObject:normal];
    }
    
    return polygonVertexNormals;
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
