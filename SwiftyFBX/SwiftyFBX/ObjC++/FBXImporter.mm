//
//  FBXImporter.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "FBXImporter.h"

@implementation FBXImporter

+ (instancetype)createWithManager:(FBXManager *)manager {
    return [[FBXImporter alloc] init];
}

- (bool)initializeWithFileName:(NSString *)fileName
                    fileformat:(int)fileformat
                    iosettings:(FBXIOSettings *)iosettings {
    return false;
}

- (void)importWithFBXDocument:(FBXDocument*)document nonBlocking:(bool)nonBlocking {
    
}
@end
