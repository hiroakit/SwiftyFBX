//
//  FBXImporter.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>
#import "FBXManager.h"
#import "FBXIOSettings.h"
#import "FBXDocument.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXImporter : NSObject
+ (instancetype)createWithManager:(FBXManager*)manager;

- (bool)initializeWithFileName:(NSString*)fileName
                    fileformat:(int)fileformat
                    iosettings:(FBXIOSettings*)iosettings;

- (void)importWithFBXDocument:(FBXDocument*)document nonBlocking:(bool)nonBlocking;
@end

NS_ASSUME_NONNULL_END
