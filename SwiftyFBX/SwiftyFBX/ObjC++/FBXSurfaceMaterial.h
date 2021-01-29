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
- (NSString *)getName;
@end

NS_ASSUME_NONNULL_END
