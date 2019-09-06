//
//  IJSVGUnitLength.m
//  IJSVGExample
//
//  Created by Curtis Hard on 13/01/2017.
//  Copyright © 2017 Curtis Hard. All rights reserved.
//

#import "IJSVGUnitLength.h"
#import "IJSVGNode.h"

@implementation IJSVGUnitLength

@synthesize value;
@synthesize type;
@synthesize inherit;

+ (IJSVGUnitLength *)unitWithFloat:(CGFloat)number
{
    IJSVGUnitLength * unit = [[[self alloc] init] autorelease];
    unit.value = number;
    unit.type = IJSVGUnitLengthTypeNumber;
    return unit;
}

+ (IJSVGUnitLength *)unitWithString:(NSString *)string
                       fromUnitType:(IJSVGUnitType)units
{
    if(units == IJSVGUnitObjectBoundingBox) {
        return [self unitWithPercentageString:string];
    }
    return [self unitWithString:string];
}

+ (IJSVGUnitLength *)unitWithFloat:(CGFloat)number
                              type:(IJSVGUnitLengthType)type
{
    IJSVGUnitLength * unit = [[[self alloc] init] autorelease];
    unit.value = number;
    unit.type = type;
    return unit;
}

+ (IJSVGUnitLength *)unitWithPercentageFloat:(CGFloat)number
{
    return [self unitWithFloat:number
                          type:IJSVGUnitLengthTypePercentage];
}

+ (IJSVGUnitLength *)unitWithPercentageString:(NSString *)string
{
    IJSVGUnitLength * unit = [self unitWithString:string];
    unit.type = IJSVGUnitLengthTypePercentage;
    return unit;
}

+ (IJSVGUnitLength *)unitWithString:(NSString *)string
{
    // just return noting for inherit, node will deal
    // with the rest...hopefully
    NSCharacterSet * cSet = NSCharacterSet.whitespaceCharacterSet;
    string = [string stringByTrimmingCharactersInSet:cSet];
    
    if([string isEqualToString:@"inherit"]) {
        return nil;
    }
    
    IJSVGUnitLength * unit = [[[self alloc] init] autorelease];
    unit.value = string.floatValue;
    unit.type = IJSVGUnitLengthTypeNumber;
    if([string hasSuffix:@"%"] == YES) {
        unit.value /= 100.f;
        unit.type = IJSVGUnitLengthTypePercentage;
    }
    return unit;
}

- (CGFloat)computeValue:(CGFloat)anotherValue
{
    if(self.type == IJSVGUnitLengthTypePercentage) {
        return ((anotherValue/100.f)*(self.value*100.f));
    }
    return self.value;
}

- (CGFloat)valueAsPercentage
{
    return self.value/100;
}

- (NSString *)stringValue
{
    if(self.type == IJSVGUnitLengthTypePercentage) {
        return [NSString stringWithFormat:@"%g%%",(self.value*100.f)];
    }
    return [NSString stringWithFormat:@"%g",self.value];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%f%@",self.value,(self.type == IJSVGUnitLengthTypePercentage ? @"%" : @"")];
}

@end
