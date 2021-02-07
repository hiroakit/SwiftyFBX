//
//  FBXNode.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>
#import "FBXStruct.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXNode : NSObject
@property (nonatomic, getter=getTranslation, setter=setTranslation:) Position translation;
- (Position)getTranslation;
- (void)setTranslation:(Position)value;
@end

NS_ASSUME_NONNULL_END
