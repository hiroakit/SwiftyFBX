//
//  SwiftyFBXFormat.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/08.
//

#import "SwiftyFBXFormat.h"

@implementation SwiftyFBXFormat
+ (instancetype)formatWithString:(NSString *)value
{
    NSArray<NSString *> *values = [value componentsSeparatedByString:@"."];
    return [[SwiftyFBXFormat alloc] initWithMajor:(NSUInteger)values[0]
                                            minor:(NSUInteger)values[1]
                                         revision:(NSUInteger)values[2]];
}

+ (instancetype)unknown
{
    return [[SwiftyFBXFormat alloc] initWithMajor:0
                                            minor:0
                                         revision:0];
}


- (instancetype)init
{
    return [self initWithMajor:0 minor:0 revision:0];
}

- (instancetype)initWithMajor:(NSUInteger)major minor:(NSUInteger)minor revision:(NSUInteger)revision
{
    self = [super init];
    if (self) {
        _major = major;
        _minor = minor;
        _revision = revision;
        _versionString = [NSString stringWithFormat:@"%lu.%lu.%lu", major, minor, revision];
    }
    return self;
}
@end
