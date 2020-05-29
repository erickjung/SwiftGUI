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

@interface ImGuiWrapper : NSObject

+ (bool)button:(NSString *)label size:(CGSize)size;
+ (bool)smallButton:(NSString *_Nonnull)label;
+ (bool)arrowButton:(NSString *_Nonnull)strId dir:(int)dir;
+ (void)bullet;
+ (bool)checkbox:(NSString *_Nonnull)label value:(bool *_Nonnull)value;
+ (bool)radioButton:(NSString *_Nonnull)label active:(bool)active;
+ (bool)radioButton:(NSString *_Nonnull)label value:(int *_Nonnull)value vButton:(int)vButton;
+ (void)progressBar:(float)fraction size:(CGSize)size overlay:(NSString *_Nullable)overlay;
+ (bool)dragInt:(NSString *_Nonnull)label value:(int *_Nonnull)value vSpeed:(float)vSpeed vMin:(int)vMin vMax:(int)vMax format:(NSString *_Nonnull)format;
+ (bool)sliderFloat:(NSString *_Nonnull)label value:(float *_Nonnull)value min:(float)min max:(float)max format:(NSString *_Nullable)format power:(float)power;
+ (void)image:(void *_Nonnull)textureId size:(CGSize)size uv0:(CGSize)uv0 uv1:(CGSize)uv1 tintColor:(CGColorRef _Nonnull)tintColor borderColor:(CGColorRef _Nonnull)borderColor;
+ (void)pushButtonRepeat:(bool)repeat;
+ (void)popButtonRepeat;
+ (bool)isItemHovered;
+ (bool)beginMenuBar;
+ (void)endMenuBar;
+ (bool)beginMenu:(NSString *_Nonnull)label enabled:(bool)enabled;
+ (void)endMenu;
+ (bool)menuItem:(NSString *_Nonnull)label shortcut:(NSString *_Nullable)shortcut selected:(bool)selected enabled:(bool)enabled;
+ (void)beginTooltip;
+ (void)endTooltip;
+ (void)pushID:(NSString *_Nonnull)labelId;
+ (void)popID;
+ (bool)inputText:(NSString *_Nonnull)label buffer:(char *_Nonnull)buffer bufferSize:(int)bufferSize flags:(int)flags;
+ (bool)inputTextWithHint:(NSString *_Nonnull)label hint:(NSString *_Nonnull)hint buffer:(char *_Nonnull)buffer bufferSize:(int)bufferSize flags:(int)flags;
+ (bool)inputFloat:(NSString *_Nonnull)label v:(float *_Nonnull)v step:(float)step stepFast:(float)stepFast format:(NSString *_Nonnull)format flags:(int)flags;
+ (bool)inputInt:(NSString *_Nonnull)label v:(int *_Nonnull)v step:(int)step stepFast:(int)stepFast flags:(int)flags;
+ (bool)inputTextMultiline:(NSString *_Nonnull)label buffer:(char *_Nonnull)buffer bufferSize:(int)bufferSize size:(CGSize)size flags:(int)flags;
+ (bool)listBox:(NSString *_Nonnull)label currentItem:(int *_Nonnull)currentItem items:(NSArray<NSString *> *_Nonnull)items heightInItems:(int)heightInItems;
+ (bool)colorEdit3:(NSString *_Nonnull)label color:(float *_Nonnull)color flags:(int)flags;
+ (bool)combo:(NSString *_Nonnull)label currentItem:(int *_Nonnull)currentItem items:(NSArray<NSString *> *_Nonnull)item popupMaxHeightItems:(int)popupMaxHeightItems;
+ (void)separator;
+ (void)sameLine:(float)offset_from_start_x spacing:(float)spacing;
+ (void)newLine;
+ (void)spacing;
+ (void)indent:(float)indent_w;
+ (void)unindent:(float)indent_w;
+ (void)beginGroup;
+ (void)endGroup;
+ (void)dummy:(CGSize)size;
+ (void)text:(NSString *)text;
+ (void)textDisabled:(NSString *_Nonnull)text;
+ (void)textWrapped:(NSString *_Nonnull)text;
+ (void)labelText:(NSString *_Nonnull)label format:(NSString *_Nonnull)format;
+ (void)bulletText:(NSString *_Nonnull)text;
+ (bool)treeNodeEx:(NSString *_Nonnull)label flags:(int)flags;
+ (void)treePop;
+ (bool)collapsingHeader:(NSString *_Nonnull)label flags:(int)flags;
+ (bool)collapsingHeader:(NSString *_Nonnull)label open:(bool *_Nonnull)open flags:(int)flags;
+ (bool)beginPopup:(NSString *)strId flags:(int)flags;
+ (bool)beginPopupModal:(NSString *)strId open:(bool *_Nonnull)open flags:(int)flags;
+ (void)endPopup;
+ (void)openPopup:(NSString *)strId;
+ (void)closeCurrentPopup;
+ (bool)beginTabBar:(NSString *)strId flags:(int)flags;
+ (void)endTabBar;
+ (bool)beginTabItem:(NSString *_Nonnull)label flags:(int)flags;
+ (void)endTabItem;
+ (void)plotLines:(NSString *_Nonnull)label values:(const float *_Nonnull)values valueCount:(int)valueCount valuesOffset:(int)valuesOffset overlayText:(NSString *_Nullable)overlayText minScale:(float)minScale maxScale:(float)maxScale graphSize:(CGSize)graphSize stride:(int)stride;
+ (void)plotHistogram:(NSString *_Nonnull)label values:(const float * _Nonnull)values valueCount:(int)valueCount valuesOffset:(int)valuesOffset overlayText:(NSString *_Nullable)overlayText minScale:(float)minScale maxScale:(float)maxScale graphSize:(CGSize)graphSize stride:(int)stride;
+ (void)pushStyleColor:(int)idx colorNumber:(unsigned int)color;
+ (void)pushStyleColor:(int)idx colorRef:(CGColorRef _Nonnull)color;
+ (void)popStyleColor:(int)count;
+ (void)pushStyleVar:(int)idx valNumber:(float)val;
+ (void)pushStyleVar:(int)idx valPoint:(CGPoint)val;
+ (void)popStyleVar:(int)count;
+ (void)pushItemWidth:(float)itemWidth;
+ (void)popItemWidth;
+ (void)pushFont:(void *_Nullable)font;
+ (void)popFont;
+ (void *_Nullable)getFontWithType:(int)type;
+ (void)addFontWithFilename:(NSString *_Nonnull)fileName sizePixels:(float)sizePixels;
+ (void)columns:(int)count strId:(NSString *_Nullable)strId border:(bool)border;
+ (void)nextColumn;
+ (void)setColumnWidth:(int)index width:(float)width;
+ (void)setColumnOffset:(int)index offset:(float)offset;
+ (bool)begin:(NSString *)name flags:(int)flags;
+ (void)end;
+ (bool)beginChild:(NSString *)strId size:(CGSize)size border:(bool)border flags:(int)flags;
+ (void)endChild;
+ (void)setNextWindowPos:(CGPoint)pos cond:(int)cond pivot:(CGPoint)pivot;
+ (void)setNextWindowSize:(CGSize)size cond:(int)cond;
+ (void *_Nullable)listClipperCreate:(int)itemsCount itemsHeight:(float)itemsHeight;
+ (void)listClipperDestroy:(void *_Nullable)clipperObj;
+ (void)listClipperBegin:(void *_Nullable)clipperObj itemsCount:(int)itemsCount itemsHeight:(float)itemsHeight;
+ (void)listClipperEnd:(void *_Nullable)clipperObj;
+ (void)listClipperLoop:(void *_Nullable)clipperObj block:(void (^) (int index))block;

@end

NS_ASSUME_NONNULL_END
