//
//  FBXTexture.mm
//  SwiftyFBX
//
//  Created by hiroakit on 2021/01/17.
//

#import "FBXTexture.h"
#import "FBXTexture_Internal.h"
#import "fbxsdk.h"

@implementation FBXTexture

- (instancetype)initWithCTexture:(FbxTexture* )cTexture
{
    self = [self init];
    if(cTexture == NULL) {
        return self;
    }
    
    FbxFileTexture* cFileTexture = FbxCast<FbxFileTexture>(cTexture);
    NSString *filePath = [NSString stringWithCString:cFileTexture->GetFileName() encoding:NSUTF8StringEncoding];
    _url = [NSURL fileURLWithPath:filePath];
    
    return self;
}

@end
