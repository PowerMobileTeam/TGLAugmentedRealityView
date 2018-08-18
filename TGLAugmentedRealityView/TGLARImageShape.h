//
//  TGLARImageShape.h
//  TGLAugmentedRealityView
//
//  Created by Tim Gleue on 12.11.15.
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

/// A rectangular 3D shape in Y/Z plane showing an image texture and facing the positive X axis.
@interface TGLARImageShape : TGLARShapeOverlay

/** Designated intializer.
 *
 * @param context OpenGL ES context to create shape in.
 * @param size Shape width and height in meters.
 * @param image The Image to apply as shape's texture.
 *
 * @return An initilized instance or nil if initialization fails.
 */
- (nullable instancetype)initWithContext:(nonnull EAGLContext *)context size:(CGSize)size image:(nullable UIImage *)image;

/** Set the shape's texture image.
 *
 * @param image The Image to apply as shape's texture.
 *
 * @return YES on success, NO if texture loading fails.
 */
- (BOOL)setImage:(nullable UIImage *)image;

@end
