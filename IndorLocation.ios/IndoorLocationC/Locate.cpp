//
//  Locate.cpp
//  IndorLocation
//
//  Created by Taras Sheremet on 18/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#include "Locate.h"
#include <math.h>

void LNRadius::fillRadiusPoints(LPCoordinate beginX, LPCoordinate endX, size_t count) {
	LPCoordinate step = (endX - beginX) / count;
	LPCoordinate y = 0;
	LPCoordinate squareRadius = (_radius * _radius);
	
	_points.clear();
	
	for (LPCoordinate x = beginX; x <= endX; x += step) {
		LPCoordinate sqX = (x - _pt._x);
		sqX = (sqX * sqX);
		y = sqrt(squareRadius - x*x);
		_points.insert( _points.end(), LNPoint({ x, _pt._y - y }) );
		_points.insert( _points.begin(), LNPoint({ x, _pt._y + y }) );
	}
}

void LNRadius::fillRadiusPoints(size_t count) {
	fillRadiusPoints(_pt._x - _radius, _pt._x - _radius, count);
}

LNPointsArray LNRadius::crossing(LNRadius & second) {
	LNPointsArray result(0);
	LNPoint coordDif, coordDifNew;
	
	for (LNPoint & point1 : _points) {
		for (LNPoint & point2 : second._points) {
			coordDifNew._x = fabs(point1._x - point2._x);
			coordDifNew._y = fabs(point1._y - point2._y);
			if (result.size() == 0 || coordDif._x + coordDif._y < coordDifNew._x + coordDifNew._y) {
				result.reserve(2);
				coordDif = coordDifNew;
				result[0] = point1;
				result[1] = point2;
			}
		}
	}
	
	return result;
}

LNPoint getPosition() {
	LNPoint result = {0};
	
	
	return result;
}
