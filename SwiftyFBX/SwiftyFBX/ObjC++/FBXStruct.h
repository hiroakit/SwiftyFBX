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

typedef NS_ENUM(int, FBXUpVector)
{
    FBXUpVectorUnknown = -1,
    FBXUpVectorX = 1,
    FBXUpVectorY = 2,
    FBXUpVectorZ = 3
};

typedef NS_ENUM(int, FBXFrontVector)
{
    FBXFrontVectorUnknown = -1,
    FBXFrontVectorParityEven = 1,
    FBXFrontVectorParityOdd = 2
};

typedef NS_ENUM(int, FBXCoordSystem)
{
    FBXCoordSystemUnknown = -1,
    FBXCoordSystemRightHanded = 0,
    FBXCoordSystemLeftHanded
};

typedef struct AxisSystem {
    FBXUpVector up;
    FBXFrontVector front;
} AxisSystem;

extern const AxisSystem AxisSystemUnknown;

static inline AxisSystem AxisSystemMake(FBXUpVector up, FBXFrontVector front)
{
    AxisSystem axis;
    axis.up = up;
    axis.front = front;
    return axis;
}

#endif /* FBXStruct_h */
