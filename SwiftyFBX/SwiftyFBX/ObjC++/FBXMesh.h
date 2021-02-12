//
//  FBXMesh.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>
#import "FBXGeometry.h"
#import "FBXNode.h"
@class FBXLayerElementNormal;
@class FBXPoint;

NS_ASSUME_NONNULL_BEGIN

@interface FBXMesh : FBXGeometry
@property (nonatomic, readonly, getter=getName) NSString *name;
@property (nonatomic, readonly, getter=getNode) FBXNode *node;
@property (nonatomic, readonly, getter=getControlPointsCount) int controlPointsCount;
@property (nonatomic, readonly, getter=getElementNormalCount) int elementNormalCount;
@property (nonatomic, readonly, getter=getPolygonCount) int polygonCount;
@property (nonatomic, readonly, getter=getPolygonVertexCount) int polygonVertexCount;
@property (nonatomic, readonly, getter=getTranslation) Position translation;
@property (nonatomic, readonly, getter=getRotation) Position rotation;
@property (nonatomic, readonly, getter=getScale) Position scale;
@property (nonatomic, readonly, getter=getControlPoints) NSArray<FBXPoint*> *controlPoints;

- (NSArray<FBXPoint*>*)getPolygonVertices;
- (NSArray<FBXPoint*>*)getPolygonVertexNormals;
- (FBXLayerElementNormal *)getElementNormal;
- (FBXLayerElementNormal *)getElementNormalAtIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
