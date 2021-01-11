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
#import "fbxsdk.h"

@interface FBXMesh ()
@property (nonatomic)FbxMesh* cMesh;
@end

@implementation FBXMesh

- (instancetype)init
{
    self = [super init];
    if (self) {
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

- (int)getControlPointsCount
{
    return self.cMesh->GetControlPointsCount();
}

- (FbxVector4* )getControlPoints
{
    return self.cMesh->GetControlPoints();
}

- (int)getElementNormalCount
{
    return self.cMesh->GetElementNormalCount();
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

- (void)getPolygonCount
{
    self.cMesh->GetPolygonCount();
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
