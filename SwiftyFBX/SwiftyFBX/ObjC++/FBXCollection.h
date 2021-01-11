//
//  FBXCollection.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXCollection<__covariant T> : NSObject
- (int)GetMemberCount;
- (id)GetMemberWitnIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
