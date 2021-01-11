//
//  SwiftyFBXLoader.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>
@class SwiftyFBXLoadResult;

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyFBXLoader : NSObject
@property (nonatomic, readonly) NSURL *URL;

- (instancetype)initWithURL:(NSURL *)URL;
- (SwiftyFBXLoadResult *)load;
+ (SwiftyFBXLoadResult *)loadWithURL:(NSURL *)URL;
@end

NS_ASSUME_NONNULL_END
