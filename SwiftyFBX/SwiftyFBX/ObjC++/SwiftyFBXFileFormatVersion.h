//
//  SwiftyFBXFileFormatVersion.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/08.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyFBXFileFormatVersion : NSObject
@property (nonatomic, readonly) NSString *versionString;
@property (nonatomic, readonly) NSUInteger major;
@property (nonatomic, readonly) NSUInteger minor;
@property (nonatomic, readonly) NSUInteger revision;
- (instancetype)initWithMajor:(NSUInteger)major minor:(NSUInteger)minor revision:(NSUInteger)revision;
@end

NS_ASSUME_NONNULL_END
