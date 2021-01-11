//
//  FBXCollection.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "FBXCollection.h"
#import "FBXMesh.h"

@implementation FBXCollection
- (int)GetMemberCount {
    return (int)[[NSArray array] count];
}

- (id)GetMemberWitnIndex:(int)index {
    return self;
}
@end
