//
//  FBXStruct.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/31.
//

#ifndef FBXStruct_h
#define FBXStruct_h

typedef struct Position {
    CGFloat x;
    CGFloat y;
    CGFloat z;
} Position;

extern const Position PositionZero;

static inline Position PositionMake(CGFloat x, CGFloat y, CGFloat z)
{
    Position position;
    position.x = x;
    position.y = y;
    position.z = z;
    return position;
}

#endif /* FBXStruct_h */
