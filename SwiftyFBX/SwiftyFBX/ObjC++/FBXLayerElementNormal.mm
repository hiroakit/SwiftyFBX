//
//  FBXLayerElementNormal.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/10.
//

#import "FBXLayerElementNormal.h"
#import "FBXLayerElementNormal_Internal.h"
#import <fbxsdk.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXLayerElementNormal ()
@property FbxLayerElementNormal* cLayerElementNormal;
@end

NS_ASSUME_NONNULL_END

@implementation FBXLayerElementNormal
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCLayerElementNormal:(FbxLayerElementNormal *)cLayerElementNormal
{
    self = [self init];
    if (self) {
        _cLayerElementNormal = cLayerElementNormal;
        
        FbxLayerElement::EMappingMode cMappingMode = _cLayerElementNormal->GetMappingMode();
        switch (cMappingMode) {
            case FbxLayerElement::EMappingMode::eNone:
                super.mappingMode = FBXLayerElementMappingModeNone;
                break;
            case FbxLayerElement::EMappingMode::eByControlPoint:
                super.mappingMode = FBXLayerElementMappingModeByControlPoint;
                break;
            case FbxLayerElement::EMappingMode::eByPolygonVertex:
                super.mappingMode = FBXLayerElementMappingModeByPolygonVertex;
                break;
            case FbxLayerElement::EMappingMode::eByPolygon:
                super.mappingMode = FBXLayerElementMappingModeByPolygon;
                break;
            case FbxLayerElement::EMappingMode::eByEdge:
                super.mappingMode = FBXLayerElementMappingModeByEdge;
                break;
            case FbxLayerElement::EMappingMode::eAllSame:
                super.mappingMode = FBXLayerElementMappingModeAllSame;
                break;
            default:
                break;
        }
        
        FbxLayerElement::EReferenceMode cReferenceMode = _cLayerElementNormal->GetReferenceMode();
        switch (cReferenceMode) {
            case FbxLayerElement::EReferenceMode::eDirect:
                super.referenceMode = FBXLayerElementReferenceModeDirect;
                break;
            case FbxLayerElement::EReferenceMode::eIndex:
                super.referenceMode = FBXLayerElementReferenceModeIndex;
                break;
            case FbxLayerElement::EReferenceMode::eIndexToDirect:
                super.referenceMode = FBXLayerElementReferenceModeIndexToDirect;
                break;
            default:
                break;
        }
    }
    return self;
}

+ (instancetype)createWithCLayerElementNormal:(FbxLayerElementNormal* )cLayerElementNormal
{
    FBXLayerElementNormal *layerElementNormal = [[FBXLayerElementNormal alloc] initWithCLayerElementNormal:cLayerElementNormal];
    return layerElementNormal;
}
@end
