//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImGuiStyleWrapper : NSObject

+ (void)alpha:(float)alpha;
+ (void)windowPadding:(CGPoint)padding;
+ (void)windowRounding:(float)rouding;
+ (void)windowBorderSize:(float)borderSize;
+ (void)windowMinSize:(CGSize)minSize;
+ (void)windowTitleAlign:(CGPoint)titleAlign;
+ (void)windowMenuButtonPosition:(int)position;
+ (void)childRounding:(float)childRounding;
+ (void)childBorderSize:(float)childBorderSize;
+ (void)popupRounding:(float)popupRounding;
+ (void)popupBorderSize:(float)popupBorderSize;
+ (void)framePadding:(CGPoint)framePadding;
+ (void)frameRounding:(float)frameRounding;
+ (void)frameBorderSize:(float)frameBorderSize;
+ (void)itemSpacing:(CGPoint)itemSpacing;
+ (void)itemInnerSpacing:(CGPoint)itemInnerSpacing;
+ (void)touchExtraPadding:(CGPoint)touchExtraPadding;
+ (void)indentSpacing:(float)indentSpacing;
+ (void)columnsMinSpacing:(float)columnsMinSpacing;
+ (void)scrollbarSize:(float)scrollbarSize;
+ (void)scrollbarRounding:(float)scrollbarRounding;
+ (void)grabMinSize:(float)grabMinSize;
+ (void)grabRounding:(float)grabRounding;
+ (void)tabRounding:(float)tabRounding;
+ (void)tabBorderSize:(float)tabBorderSize;
+ (void)colorButtonPosition:(int)colorButtonPosition;
+ (void)buttonTextAlign:(CGPoint)buttonTextAlign;
+ (void)selectableTextAlign:(CGPoint)selectableTextAlign;
+ (void)displayWindowPadding:(CGPoint)displayWindowPadding;
+ (void)displaySafeAreaPadding:(CGPoint)displaySafeAreaPadding;
+ (void)mouseCursorScale:(float)mouseCursorScale;
+ (void)antiAliasedLines:(bool)antiAliasedLines;
+ (void)antiAliasedFill:(bool)antiAliasedFill;
+ (void)curveTessellationTol:(float)curveTessellationTol;

+ (void)colorText:(CGColorRef _Nonnull)color;
+ (void)colorTextDisabled:(CGColorRef _Nonnull)color;
+ (void)colorWindowBg:(CGColorRef _Nonnull)color;
+ (void)colorChildBg:(CGColorRef _Nonnull)color;
+ (void)colorPopupBg:(CGColorRef _Nonnull)color;
+ (void)colorBorder:(CGColorRef _Nonnull)color;
+ (void)colorBorderShadow:(CGColorRef _Nonnull)color;
+ (void)colorFrameBg:(CGColorRef _Nonnull)color;
+ (void)colorFrameBgHovered:(CGColorRef _Nonnull)color;
+ (void)colorFrameBgActive:(CGColorRef _Nonnull)color;
+ (void)colorTitleBg:(CGColorRef _Nonnull)color;
+ (void)colorTitleBgActive:(CGColorRef _Nonnull)color;
+ (void)colorTitleBgCollapsed:(CGColorRef _Nonnull)color;
+ (void)colorMenuBarBg:(CGColorRef _Nonnull)color;
+ (void)colorScrollbarBg:(CGColorRef _Nonnull)color;
+ (void)colorScrollbarGrab:(CGColorRef _Nonnull)color;
+ (void)colorScrollbarGrabHovered:(CGColorRef _Nonnull)color;
+ (void)colorScrollbarGrabActive:(CGColorRef _Nonnull)color;
+ (void)colorCheckMark:(CGColorRef _Nonnull)color;
+ (void)colorSliderGrab:(CGColorRef _Nonnull)color;
+ (void)colorSliderGrabActive:(CGColorRef _Nonnull)color;
+ (void)colorButton:(CGColorRef _Nonnull)color;
+ (void)colorButtonHovered:(CGColorRef _Nonnull)color;
+ (void)colorButtonActive:(CGColorRef _Nonnull)color;
+ (void)colorHeader:(CGColorRef _Nonnull)color;
+ (void)colorHeaderHovered:(CGColorRef _Nonnull)color;
+ (void)colorHeaderActive:(CGColorRef _Nonnull)color;
+ (void)colorSeparator:(CGColorRef _Nonnull)color;
+ (void)colorSeparatorHovered:(CGColorRef _Nonnull)color;
+ (void)colorSeparatorActive:(CGColorRef _Nonnull)color;
+ (void)colorResizeGrip:(CGColorRef _Nonnull)color;
+ (void)colorResizeGripHovered:(CGColorRef _Nonnull)color;
+ (void)colorResizeGripActive:(CGColorRef _Nonnull)color;
+ (void)colorTab:(CGColorRef _Nonnull)color;
+ (void)colorTabHovered:(CGColorRef _Nonnull)color;
+ (void)colorTabActive:(CGColorRef _Nonnull)color;
+ (void)colorTabUnfocused:(CGColorRef _Nonnull)color;
+ (void)colorTabUnfocusedActive:(CGColorRef _Nonnull)color;
+ (void)colorDockingPreview:(CGColorRef _Nonnull)color;
+ (void)colorDockingEmptyBg:(CGColorRef _Nonnull)color;
+ (void)colorPlotLines:(CGColorRef _Nonnull)color;
+ (void)colorPlotLinesHovered:(CGColorRef _Nonnull)color;
+ (void)colorPlotHistogram:(CGColorRef _Nonnull)color;
+ (void)colorPlotHistogramHovered:(CGColorRef _Nonnull)color;
+ (void)colorTextSelectedBg:(CGColorRef _Nonnull)color;
+ (void)colorDragDropTarget:(CGColorRef _Nonnull)color;
+ (void)colorNavHighlight:(CGColorRef _Nonnull)color;
+ (void)colorNavWindowingHighlight:(CGColorRef _Nonnull)color;
+ (void)colorNavWindowingDimBg:(CGColorRef _Nonnull)color;
+ (void)colorModalWindowDimBg:(CGColorRef _Nonnull)color;

@end

NS_ASSUME_NONNULL_END
