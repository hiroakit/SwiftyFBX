//
//  FBXManager.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/05.
//

#import <Foundation/Foundation.h>
#import "FBXIOSettings.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXManager : NSObject
@property(nonatomic, weak) FBXIOSettings* iossettings;

- (NSString*)create;
@end

NS_ASSUME_NONNULL_END
