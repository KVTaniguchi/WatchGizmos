/*
 * ACEDrawingView: https://github.com/acerbetti/ACEDrawingView
 *
 * Copyright (c) 2013 Stefano Acerbetti
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import <UIKit/UIKit.h>

#define ACEDrawingViewVersion   1.3.8

typedef enum {
    ACEDrawingToolTypePen,
    ACEDrawingToolTypeLine,
    ACEDrawingToolTypeArrow,
    ACEDrawingToolTypeRectagleStroke,
    ACEDrawingToolTypeRectagleFill,
    ACEDrawingToolTypeEllipseStroke,
    ACEDrawingToolTypeEllipseFill,
    ACEDrawingToolTypeEraser,
    ACEDrawingToolTypeText,
    ACEDrawingToolTypeMultilineText,
    ACEDrawingToolTypeCustom,
} ACEDrawingToolType;

typedef NS_ENUM(NSUInteger, ACEDrawingMode) {
    ACEDrawingModeScale,
    ACEDrawingModeOriginalSize
};

@protocol ACEDrawingViewDelegate, ACEDrawingTool;

@interface ACEDrawingView : UIView<UITextViewDelegate>

@property (nonatomic, assign) ACEDrawingToolType drawTool;
@property (nonatomic, strong) id<ACEDrawingTool> customDrawTool;
@property (nonatomic, assign) id<ACEDrawingViewDelegate> delegate;

// public properties
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineAlpha;
@property (nonatomic, strong) NSString *fontName;
@property (nonatomic, assign) CGFloat edgeSnapThreshold;
@property (nonatomic, assign) ACEDrawingMode drawMode;

// get the current drawing
@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, readonly) NSUInteger undoSteps;

// load external image
- (void)loadImage:(UIImage *)image;
- (void)loadImageData:(NSData *)imageData;

// erase all
- (void)clear;

// undo / redo
- (BOOL)canUndo;
- (void)undoLatestStep;

- (BOOL)canRedo;
- (void)redoLatestStep;

/**
 @discussion Discards the tool stack and renders them to prev_image, making the current state the 'start' state.
 (Can be called before resize to make content more predictable)
 */
- (void)commitAndDiscardToolStack;

@end

#pragma mark - 

@interface ACEDrawingView (Deprecated)
@property (nonatomic, strong) UIImage *prev_image DEPRECATED_MSG_ATTRIBUTE("Use 'backgroundImage' instead.");
@end

#pragma mark -

@protocol ACEDrawingViewDelegate <NSObject>

@optional
- (void)drawingView:(ACEDrawingView *)view willBeginDrawUsingTool:(id<ACEDrawingTool>)tool;
- (void)drawingView:(ACEDrawingView *)view didEndDrawUsingTool:(id<ACEDrawingTool>)tool;

@end
