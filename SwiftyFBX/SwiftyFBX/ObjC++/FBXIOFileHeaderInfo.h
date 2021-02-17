//
//  FBXIOFileHeaderInfo.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/02/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXIOFileHeaderInfo : NSObject
@property (nonatomic, readonly, getter=getCreator) NSString *creator;
@end

NS_ASSUME_NONNULL_END
