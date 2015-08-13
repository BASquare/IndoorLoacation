//
//  Locate.h
//  IndorLocation
//
//  Created by Taras Sheremet on 18/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#ifndef __IndorLocation__Locate__
#define __IndorLocation__Locate__

#include <stdio.h>
#include <vector>

#define defPointsCount	20

typedef double LPCoordinate;

struct LNPoint {
	LPCoordinate _x;
	LPCoordinate _y;
};

typedef ::std::vector<LNPoint> LNPointsArray;

struct LNRadius {
protected:
	LNPoint _pt;
	LPCoordinate _radius;
	
	LNPointsArray _points;
	
public:
	void fillRadiusPoints(size_t count = defPointsCount);
	void fillRadiusPoints(LPCoordinate beginX, LPCoordinate endX, size_t count);
	LNPointsArray crossing(LNRadius & second);
};

typedef ::std::vector<LNPoint> LNRadiusArray;

#endif /* defined(__IndorLocation__Locate__) */
