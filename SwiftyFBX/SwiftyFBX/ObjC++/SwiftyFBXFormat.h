//
//  SwiftyFBXFormat.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/08.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyFBXFormat : NSObject
@property (nonatomic, readonly) NSString *versionString;
@property (nonatomic, readonly) NSUInteger major;
@property (nonatomic, readonly) NSUInteger minor;
@property (nonatomic, readonly) NSUInteger revision;
+ (instancetype)formatWithString:(NSString *)value;
+ (instancetype)unknown;
- (instancetype)initWithMajor:(NSUInteger)major minor:(NSUInteger)minor revision:(NSUInteger)revision;
@end

NS_ASSUME_NONNULL_END
