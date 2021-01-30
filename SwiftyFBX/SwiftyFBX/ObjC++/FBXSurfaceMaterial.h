//
//  FBXSurfaceMaterial.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXSurfaceMaterial : NSObject
@property (nonatomic, readonly, getter=getName) NSString *name;
@property (nonatomic, readonly, getter=getShadingModelName) NSString *shadingModelName;
@property (nonatomic, readonly, getter=getMultiLayerName) NSString *multiLayerName;
@property (nonatomic, readonly, getter=getEmissiveName) NSString *emissiveName;
@property (nonatomic, readonly, getter=getEmissiveFactorName) NSString *emissiveFactorName;
@property (nonatomic, readonly, getter=getAmbientName) NSString *ambientName;
@property (nonatomic, readonly, getter=getAmbientFactorName) NSString *ambientFactorName;
@property (nonatomic, readonly, getter=getDiffuseName) NSString *diffuseName;
@property (nonatomic, readonly, getter=getDiffuseFactorName) NSString *diffuseFactorName;
@property (nonatomic, readonly, getter=getSpecularName) NSString *specularName;
@property (nonatomic, readonly, getter=getSpecularFactorName) NSString *specularFactorName;
@property (nonatomic, readonly, getter=getShininessName) NSString *shininessName;
@property (nonatomic, readonly, getter=getBumpName) NSString *bumpName;
@property (nonatomic, readonly, getter=getBumpFactorName) NSString *bumpFactorName;
@property (nonatomic, readonly, getter=getNormalMapName) NSString *normalMapName;
@property (nonatomic, readonly, getter=getTransparentColorName) NSString *transparentColorName;
@property (nonatomic, readonly, getter=getTransparencyFactorName) NSString *transparencyFactorName;
@property (nonatomic, readonly, getter=getReflectionName) NSString *reflectionName;
@property (nonatomic, readonly, getter=getReflectionFactorName) NSString *reflectionFactorName;
@property (nonatomic, readonly, getter=getDisplacementColorName) NSString *displacementColorName;
@property (nonatomic, readonly, getter=getDisplacementFactorName) NSString *displacementFactorName;
@property (nonatomic, readonly, getter=getVectorDisplacementColorName) NSString *vectorDisplacementColorName;
@property (nonatomic, readonly, getter=getVectorDisplacementFactorName) NSString *vectorDisplacementFactorName;

- (NSString *)getName;
- (NSString *)getShadingModelName;
- (NSString *)getMultiLayerName;
- (NSString *)getEmissiveName;
- (NSString *)getEmissiveFactorName;
- (NSString *)getAmbientName;
- (NSString *)getAmbientFactorName;
- (NSString *)getDiffuseName;
- (NSString *)getDiffuseFactorName;
- (NSString *)getSpecularName;
- (NSString *)getSpecularFactorName;
- (NSString *)getShininessName;
- (NSString *)getBumpName;
- (NSString *)getBumpFactorName;
- (NSString *)getNormalMapName;
- (NSString *)getTransparentColorName;
- (NSString *)getTransparencyFactorName;
- (NSString *)getReflectionName;
- (NSString *)getReflectionFactorName;
- (NSString *)getDisplacementColorName;
- (NSString *)getDisplacementFactorName;
- (NSString *)getVectorDisplacementColorName;
- (NSString *)getVectorDisplacementFactorName;
@end

NS_ASSUME_NONNULL_END
