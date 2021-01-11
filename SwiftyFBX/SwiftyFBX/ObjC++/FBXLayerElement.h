//
//  FBXLayerElement.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXLayerElement : NSObject

typedef NS_ENUM(int, FBXLayerElementMappingMode)
{
    FBXLayerElementMappingModeNone,
    FBXLayerElementMappingModeByControlPoint,
    FBXLayerElementMappingModeByPolygonVertex,
    FBXLayerElementMappingModeByPolygon,
    FBXLayerElementMappingModeByEdge,
    FBXLayerElementMappingModeAllSame
};

typedef NS_ENUM(int, FBXLayerElementReferenceMode)
{
    FBXLayerElementReferenceModeDirect,
    FBXLayerElementReferenceModeIndex,
    FBXLayerElementReferenceModeIndexToDirect
};

@property (nonatomic) NSString *name;
@property (nonatomic) FBXLayerElementMappingMode mappingMode;
@property (nonatomic) FBXLayerElementReferenceMode referenceMode;
@end

NS_ASSUME_NONNULL_END
