//
//  FBXSurfaceMaterial.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import <Foundation/Foundation.h>
@class FBXColor;

NS_ASSUME_NONNULL_BEGIN

@interface FBXSurfaceMaterial : NSObject
@property (nonatomic, readonly, getter=isPhong) BOOL phong;
@property (nonatomic, readonly, getter=isLambert) BOOL lambert;
@property (nonatomic, readonly, getter=getUUID) NSString *uuid;
@property (nonatomic, readonly, getter=getName) NSString *name;
@property (nonatomic, readonly, getter=getInitialName) NSString *initialName;
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
@property (nonatomic, readonly, getter=getShadingModel) NSString *shadingModel;
@property (nonatomic, readonly, getter=getAmbient) FBXColor *ambient;
@property (nonatomic, readonly, getter=getDiffuse) FBXColor *diffuse;
@property (nonatomic, readonly, getter=getSpecular) FBXColor *specular;
@property (nonatomic, readonly, getter=getSpecularFactor) CGFloat specularFactor;
@property (nonatomic, readonly, getter=getEmissive) FBXColor *emissive;
@property (nonatomic, readonly, getter=getTransparencyColor) FBXColor *transparencyColor;
@property (nonatomic, readonly, getter=getTransparencyFactor) CGFloat transparencyFactor;
@property (nonatomic, readonly, getter=getShininess) CGFloat shininess;
@property (nonatomic, readonly, getter=getReflectionColor) FBXColor *reflectionColor;
@property (nonatomic, readonly, getter=getReflectionFactor) CGFloat reflectionFactor;

- (BOOL)isPhong;
- (BOOL)isLambert;
- (NSString *)getUUID;
- (NSString *)getName;
- (NSString *)getInitialName;
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
- (NSString *)getShadingModel;
- (FBXColor *)getAmbient;
- (FBXColor *)getDiffuse;
- (FBXColor *)getSpecular;
- (CGFloat)getSpecularFactor;
- (FBXColor *)getEmissive;
- (FBXColor *)getTransparencyColor;
- (CGFloat)getTransparencyFactor;
- (CGFloat)getShininess;
- (FBXColor *)getReflectionColor;
- (CGFloat)getReflectionFactor;
@end

NS_ASSUME_NONNULL_END
