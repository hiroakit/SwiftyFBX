//
//  FBXLight.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import <Foundation/Foundation.h>
#import "FBXStruct.h"

NS_ASSUME_NONNULL_BEGIN

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
- (NSString *)getName;
- (FBXLightType)getLightType;
@end

NS_ASSUME_NONNULL_END
