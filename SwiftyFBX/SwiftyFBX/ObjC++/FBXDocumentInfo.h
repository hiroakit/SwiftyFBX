//
//  FBXDocumentInfo.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/02/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXDocumentInfo : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *author;
@property (nonatomic) NSString *fileName;
@property (nonatomic) NSString *applicationName;
@property (nonatomic) NSString *applicationVender;
@property (nonatomic) NSString *applicationVersion;
@end

NS_ASSUME_NONNULL_END
