//
//  SwiftyFBXLoadResult.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/08.
//

#import <Foundation/Foundation.h>
@class SwiftyFBXFormat;
@class FBXScene;

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyFBXLoadResult : NSObject
@property (nonatomic, readonly) BOOL isSuccessful;
@property (nullable, nonatomic, readonly) FBXScene *scene;
@property (nonatomic, readonly) SwiftyFBXFormat *format;
- (instancetype)initWithResult:(BOOL)result
                        format:(SwiftyFBXFormat *)format
                         scene:(nullable FBXScene *)scene;
@end

NS_ASSUME_NONNULL_END
