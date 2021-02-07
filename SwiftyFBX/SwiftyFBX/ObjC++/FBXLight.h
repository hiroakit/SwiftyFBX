//
//  FBXLight.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import <Foundation/Foundation.h>
#import "FBXStruct.h"
@class FBXNode;

NS_ASSUME_NONNULL_BEGIN

static NSArray<NSString*> *const FBXLightTypeNames = @[@"Point", @"Directional", @"Spot", @"Area", @"Volume"];

@interface FBXLight : NSObject

typedef NS_ENUM(int, FBXLightType)
{
    FBXLightTypeUnknown = -1,
    FBXLightTypePoint = 0,
    FBXLightTypeDirectional,
    FBXLightTypeSpot,
    FBXLightTypeArea,
    FBXLightTypeVolume
};

@property (nonatomic, readonly, getter=getName) NSString *name;
@property (nonatomic, readonly, getter=getLightType) FBXLightType lightType;
@property (nonatomic, readonly, getter=getLightTypeName) NSString *lightTypeName;
@property (nonatomic, readonly, getter=getTranslation) Position translation;
@property (nonatomic, readonly, getter=getNode) FBXNode *node;

- (NSString *)getName;
- (FBXLightType)getLightType;
- (NSString *)getLightTypeName;
- (Position)getTranslation;
- (FBXNode *)getNode;
@end

NS_ASSUME_NONNULL_END
