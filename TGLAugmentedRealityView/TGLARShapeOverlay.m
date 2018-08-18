//
//  TGLARShapeOverlay.m
//  TGLAugmentedRealityView
//
//  Created by Tim Gleue on 09.11.15.
//  Copyright (c) 2015 PowerMobile Team (https://powermobile.org)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "TGLARShapeOverlay.h"

@interface TGLARShapeOverlay ()

@property (nonatomic, strong) GLKTextureInfo *textureInfo;

@end

@implementation TGLARShapeOverlay

- (instancetype)initWithContext:(EAGLContext *)context {

    self = [super init];
    
    if (self) {
        
        _context = context;
        
        [EAGLContext setCurrentContext:self.context];
        
        _effect = [[GLKBaseEffect alloc] init];
        _transform = GLKMatrix4Identity;
    }

    return self;
}

- (void)dealloc {
    
    if (self.context) {
        
        [EAGLContext setCurrentContext:self.context];
        
        self.context = nil;
    }
}

#pragma mark - Methods

- (BOOL)draw {
    
    if (!self.context) return NO;
    
    GLKVector3 targetPosition = self.overlay.targetPosition;
    GLKMatrix4 positionMatrix = GLKMatrix4MakeTranslation(targetPosition.x, targetPosition.y, targetPosition.z);
    GLKMatrix4 modelMatrix = GLKMatrix4Multiply(positionMatrix, self.transform);
    
    self.effect.transform.modelviewMatrix = GLKMatrix4Multiply(self.viewMatrix, modelMatrix);
    self.effect.transform.projectionMatrix = self.projectionMatrix;

    [self.effect prepareToDraw];
    
    return YES;
}

- (BOOL)drawUsingConstantColor:(GLKVector4)color {
    
    return [self draw];
}

@end
