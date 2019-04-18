//
//  IJSVGImageLayer.m
//  IJSVGExample
//
//  Created by Curtis Hard on 07/01/2017.
//  Copyright © 2017 Curtis Hard. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IJSVGImageLayer.h"

@implementation IJSVGImageLayer

- (id)initWithImage:(NSImage *)image
{
    
    NSImageRep *rep = [[image representations] objectAtIndex:0];
    
    NSRect rect = (NSRect){
        .origin = NSZeroPoint,
        // TODO, George: size cannot be found in forward class object 'NSImage'
        .size = NSMakeSize(rep.pixelsWide, rep.pixelsHigh)
    };
    CGImageRef ref = [image CGImageForProposedRect:&rect
                                           context:nil
                                             hints:nil];
    return [self initWithCGImage:ref];
}

- (id)initWithCGImage:(CGImageRef)imageRef
{
    if((self = [super init]) != nil) {
        // set the contents
        self.contents = (id)imageRef;
        
        // make sure we say we need help
        self.requiresBackingScaleHelp = YES;
        self.shouldRasterize = YES;
        
        // set the frame, simple stuff
        self.frame = (CGRect){
            .origin = CGPointZero,
            .size = CGSizeMake(CGImageGetWidth(imageRef),
                               CGImageGetHeight(imageRef))
        };
    }
    return self;
}

- (void)setNeedsDisplay
{
    // swap the content around on call
    // because set needs display discards previous
    // content - yolo!
    id oldContent = self.contents;
    [super setNeedsDisplay];
    self.contents = oldContent;
}

@end
