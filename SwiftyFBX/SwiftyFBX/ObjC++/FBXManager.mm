//
//  FBXManager.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/05.
//

#import "FBXManager.h"
#import "SwiftyFBXLoader.h"
#import "fbxsdk.h"

@implementation FBXManager
- (NSString*)create {    
    FbxManager::Create();
    return @"";
}

@end
