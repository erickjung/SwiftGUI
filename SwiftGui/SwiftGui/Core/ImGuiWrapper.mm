//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

#import "imgui.h"
#import "ImGuiWrapper.h"

@implementation ImGuiWrapper

+ (ImVec4)convertCGColor:(CGColorRef _Nonnull)color {
    
    const CGFloat* components = CGColorGetComponents(color);

    if (CGColorGetNumberOfComponents(color) == 2) {
        
        return ImVec4(components[0], components[0], components[0], components[1]);
    }
    
    return ImVec4(components[0], components[1], components[2], components[3]);
}

+ (bool)button:(NSString *)label size:(CGSize)size {
    
    return ImGui::Button(label.UTF8String, ImVec2(size.width, size.height));
}

+ (bool)smallButton:(NSString *_Nonnull)label {
 
    return ImGui::SmallButton(label.UTF8String);
}

+ (bool)arrowButton:(NSString *_Nonnull)strId dir:(int)dir {
    
    return ImGui::ArrowButton(strId.UTF8String, dir);
}

+ (void)bullet {
    
    ImGui::Bullet();
}

+ (bool)checkbox:(NSString *_Nonnull)label value:(bool *_Nonnull)value {

    bool _value = *value;
    bool res = ImGui::Checkbox(label.UTF8String, &_value);
    *value = _value;
    return res;
}

+ (bool)radioButton:(NSString *_Nonnull)label active:(bool)active {
 
    return ImGui::RadioButton(label.UTF8String, active);
}

+ (bool)radioButton:(NSString *_Nonnull)label value:(int *_Nonnull)value vButton:(int)vButton {
    
    int _value = *value;
    bool res = ImGui::RadioButton(label.UTF8String, &_value, vButton);
    *value = _value;
    return res;
}

+ (void)progressBar:(float)fraction size:(CGSize)size overlay:(NSString *_Nullable)overlay {
    
    ImGui::ProgressBar(fraction, ImVec2(size.width, size.height), overlay.UTF8String);
}

#pragma mark - Drags

+ (bool)dragInt:(NSString *_Nonnull)label value:(int *_Nonnull)value vSpeed:(float)vSpeed vMin:(int)vMin vMax:(int)vMax format:(NSString *_Nonnull)format {
    
    return ImGui::DragInt(label.UTF8String, value, vSpeed, vMin, vMax, format.UTF8String);
}

#pragma mark - Sliders

+ (bool)sliderFloat:(NSString *_Nonnull)label value:(float *_Nonnull)value min:(float)min max:(float)max format:(NSString *_Nullable)format power:(float)power {

    return ImGui::SliderFloat(label.UTF8String, value, min, max, format != NULL ? format.UTF8String : NULL, power);
}

#pragma mark - Image

+ (void)image:(void *_Nonnull)textureId size:(CGSize)size uv0:(CGSize)uv0 uv1:(CGSize)uv1 tintColor:(CGColorRef _Nonnull)tintColor borderColor:(CGColorRef _Nonnull)borderColor {

    ImVec4 _tintColor = [self convertCGColor:tintColor];
    ImVec4 _borderColor = [self convertCGColor:borderColor];

    return ImGui::Image(textureId, ImVec2(size.width, size.height), ImVec2(uv0.width, uv0.height), ImVec2(uv1.width, uv1.height), _tintColor, _borderColor);
}

#pragma mark - button repeat

+ (void)pushButtonRepeat:(bool)repeat {
    
    ImGui::PushButtonRepeat(repeat);
}

+ (void)popButtonRepeat {
    
    ImGui::PopButtonRepeat();
}

#pragma mark - props

+ (bool)isItemHovered {
    return ImGui::IsItemHovered();
}

// menu
+ (bool)beginMenuBar {
    return ImGui::BeginMenuBar();
}

+ (void)endMenuBar {
    return ImGui::EndMenuBar();
}

+ (bool)beginMenu:(NSString *_Nonnull)label enabled:(bool)enabled {
    
    return ImGui::BeginMenu(label.UTF8String, enabled);
}

+ (void)endMenu {
    
    ImGui::EndMenu();
}

+ (bool)menuItem:(NSString *_Nonnull)label shortcut:(NSString *_Nullable)shortcut selected:(bool)selected enabled:(bool)enabled {
    
    return ImGui::MenuItem(label.UTF8String, shortcut.UTF8String, selected, enabled);
}

#pragma mark - Tooltips

+ (void)beginTooltip {
    
    ImGui::BeginTooltip();
}

+ (void)endTooltip {
    
    ImGui::EndTooltip();
}

#pragma mark - ID stack/scopes

+ (void)pushID:(NSString *_Nonnull)labelId {
    
    ImGui::PushID(labelId.UTF8String);
}

+ (void)popID {
    
    ImGui::PopID();
}

#pragma mark - Input with Keyboard

+ (bool)inputText:(NSString *_Nonnull)label buffer:(char *_Nonnull)buffer bufferSize:(int)bufferSize flags:(int)flags {
    
    return ImGui::InputText(label.UTF8String, buffer, bufferSize);
}

+ (bool)inputTextWithHint:(NSString *_Nonnull)label hint:(NSString *_Nonnull)hint buffer:(char *_Nonnull)buffer bufferSize:(int)bufferSize flags:(int)flags {
    
    return ImGui::InputTextWithHint(label.UTF8String, hint.UTF8String, buffer, bufferSize);
}

+ (bool)inputFloat:(NSString *_Nonnull)label v:(float *_Nonnull)v step:(float)step stepFast:(float)stepFast format:(NSString *_Nonnull)format flags:(int)flags {
    
    return ImGui::InputFloat(label.UTF8String, v, step, stepFast, format.UTF8String, flags);
}

+ (bool)inputInt:(NSString *_Nonnull)label v:(int *_Nonnull)v step:(int)step stepFast:(int)stepFast flags:(int)flags {
    
    return ImGui::InputInt(label.UTF8String, v, step, stepFast, flags);
}

+ (bool)inputTextMultiline:(NSString *_Nonnull)label buffer:(char *_Nonnull)buffer bufferSize:(int)bufferSize size:(CGSize)size flags:(int)flags {
    
    return ImGui::InputTextMultiline(label.UTF8String, buffer, bufferSize, ImVec2(size.width, size.height), flags);
}

#pragma mark - List Boxes

+ (bool)listBox:(NSString *_Nonnull)label currentItem:(int *_Nonnull)currentItem items:(NSArray<NSString *> *_Nonnull)items heightInItems:(int)heightInItems {

    const char* _items[items.count];
    for (int i = 0; i < items.count; i++) {
        _items[i] = (char *)items[i].UTF8String;
    }
    return ImGui::ListBox(label.UTF8String, currentItem, _items, int(items.count), heightInItems);
}

#pragma mark - Color Editor/Picker

+ (bool)colorEdit3:(NSString *_Nonnull)label color:(float *_Nonnull)color flags:(int)flags {
    
    return ImGui::ColorEdit3(label.UTF8String, color, flags);
}

#pragma mark - Combo Box

+ (bool)combo:(NSString *_Nonnull)label currentItem:(int *_Nonnull)currentItem items:(NSArray<NSString *> *_Nonnull)items popupMaxHeightItems:(int)popupMaxHeightItems {

    const char* _items[items.count];
    for (int i = 0; i < items.count; i++) {
        _items[i] = (char *)items[i].UTF8String;
    }
    
    return ImGui::Combo(label.UTF8String, currentItem, _items, (int)items.count, popupMaxHeightItems);
}

#pragma mark - Cursor / Layout

+ (void)separator {
    
    ImGui::Separator();
}

+ (void)sameLine:(float)offset_from_start_x spacing:(float)spacing {
    
    ImGui::SameLine(offset_from_start_x, spacing);
}

+ (void)newLine {
    
    ImGui::NewLine();
}

+ (void)spacing {
    
    ImGui::Spacing();
}

+ (void)indent:(float)indent_w {
    
    ImGui::Indent(indent_w);
}

+ (void)unindent:(float)indent_w {
    
    ImGui::Unindent(indent_w);
}

+ (void)beginGroup {
    
    ImGui::BeginGroup();
}

+ (void)endGroup {
    
    ImGui::EndGroup();
}

+ (void)dummy:(CGSize)size {

    ImGui::Dummy(ImVec2(size.width, size.height));
}

#pragma mark - Text

+ (void)text:(NSString *)text {
    
    ImGui::Text("%s", text.UTF8String);
}

+ (void)textDisabled:(NSString *_Nonnull)text {
    
    ImGui::TextDisabled("%s", text.UTF8String);
}

+ (void)textWrapped:(NSString *_Nonnull)text {

    ImGui::TextWrapped("%s", text.UTF8String);
}

+ (void)labelText:(NSString *_Nonnull)label format:(NSString *_Nonnull)format {
    
    ImGui::LabelText(label.UTF8String, "%s", format.UTF8String);
}

+ (void)bulletText:(NSString *_Nonnull)text {
   
    ImGui::BulletText("%s", text.UTF8String);
}

#pragma mark - Trees

+ (bool)treeNodeEx:(NSString *_Nonnull)label flags:(int)flags {
    
    return ImGui::TreeNodeEx(label.UTF8String, flags);
}

+ (void)treePop {
    
    return ImGui::TreePop();
}

+ (bool)collapsingHeader:(NSString *_Nonnull)label flags:(int)flags {
    
    return ImGui::CollapsingHeader(label.UTF8String, flags);
}

+ (bool)collapsingHeader:(NSString *_Nonnull)label open:(bool *_Nonnull)open flags:(int)flags {

    bool _value = *open;
    bool res = ImGui::CollapsingHeader(label.UTF8String, &_value, flags);
    *open = _value;
    return res;
}

#pragma mark - Popup

+ (bool)beginPopup:(NSString *)strId flags:(int)flags {

    return ImGui::BeginPopup(strId.UTF8String, flags);
}

+ (void)endPopup {

    ImGui::EndPopup();
}

+ (void)openPopup:(NSString *)strId {

    ImGui::OpenPopup(strId.UTF8String);
}

+ (void)closeCurrentPopup {

    ImGui::CloseCurrentPopup();
}

#pragma mark - Tabbar

+ (bool)beginTabBar:(NSString *)strId flags:(int)flags {
    
    return ImGui::BeginTabBar(strId.UTF8String, flags);
}

+ (void)endTabBar {

    return ImGui::EndTabBar();
}

+ (bool)beginTabItem:(NSString *_Nonnull)label flags:(int)flags {

    return ImGui::BeginTabItem(label.UTF8String, nil, flags);
}

+ (void)endTabItem {
    
    ImGui::EndTabItem();
}


#pragma mark - Data Plotting

+ (void)plotLines:(NSString *_Nonnull)label values:(const float *_Nonnull)values valueCount:(int)valueCount valuesOffset:(int)valuesOffset overlayText:(NSString *_Nullable)overlayText minScale:(float)minScale maxScale:(float)maxScale graphSize:(CGSize)graphSize stride:(int)stride {
    
    ImGui::PlotLines(label.UTF8String, values, valueCount, valuesOffset, overlayText.UTF8String, minScale, maxScale, ImVec2(graphSize.width, graphSize.height), stride);
}

+ (void)plotHistogram:(NSString *_Nonnull)label values:(const float * _Nonnull)values valueCount:(int)valueCount valuesOffset:(int)valuesOffset overlayText:(NSString *_Nullable)overlayText minScale:(float)minScale maxScale:(float)maxScale graphSize:(CGSize)graphSize stride:(int)stride {
    
    ImGui::PlotHistogram(label.UTF8String, values, valueCount, valuesOffset, overlayText.UTF8String, minScale, maxScale, ImVec2(graphSize.width, graphSize.height), stride);
}

#pragma mark - Parameters stacks (shared)

+ (void)pushStyleColor:(int)idx colorNumber:(unsigned int)color {
    
    ImGui::PushStyleColor(idx, color);
}

+ (void)pushStyleColor:(int)idx colorRef:(CGColorRef _Nonnull)color {
    
    ImGui::PushStyleColor(idx, [self convertCGColor:color]);
}

+ (void)popStyleColor:(int)count {
 
    ImGui::PopStyleColor(count);
}

+ (void)pushStyleVar:(int)idx valNumber:(float)val {
    
    ImGui::PushStyleVar(idx, val);
}

+ (void)pushStyleVar:(int)idx valPoint:(CGPoint)val {
    
    ImGui::PushStyleVar(idx, ImVec2(val.x, val.y));
}

+ (void)popStyleVar:(int)count {
   
    ImGui::PopStyleVar(count);
}

+ (void)pushItemWidth:(float)itemWidth {

    ImGui::PushItemWidth(itemWidth);
}

+ (void)popItemWidth {

    ImGui::PopItemWidth();
}

+ (void)pushFont:(void *)font {

    ImFont *_font = (ImFont *)font;
    ImGui::PushFont(_font);
}

+ (void)popFont {

    ImGui::PopFont();
}

+ (void *)getFontWithType:(int)type {

    ImGuiIO& io = ImGui::GetIO();
    
    if (type < io.Fonts->Fonts.Size) {
        
        return io.Fonts->Fonts[type];
    }
    
    return nil;
}

+ (void)addFontWithFilename:(NSString *_Nonnull)fileName sizePixels:(float)sizePixels {

    ImGuiIO& io = ImGui::GetIO();
    io.Fonts->AddFontFromFileTTF(fileName.UTF8String, sizePixels);
}

#pragma mark - columns

+ (void)columns:(int)count strId:(NSString *)strId border:(bool)border {

    ImGui::Columns(count, strId.UTF8String, border);
}

+ (void)nextColumn {
    
    ImGui::NextColumn();
}

+ (void)setColumnWidth:(int)index width:(float)width {

    ImGui::SetColumnWidth(index, width);
}

+ (void)setColumnOffset:(int)index offset:(float)offset {

    ImGui::SetColumnOffset(index, offset);
}


#pragma mark - windows

+ (bool)begin:(NSString *)name flags:(int)flags {

    return ImGui::Begin(name.UTF8String, nil, flags);;
}

+ (void)end {
    
    ImGui::End();
}

#pragma mark - child windows

+ (bool)beginChild:(NSString *)strId size:(CGSize)size border:(bool)border flags:(int)flags {
    
    return ImGui::BeginChild(strId.UTF8String, ImVec2(size.width, size.height), border, flags);
}

+ (void)endChild {
    
    ImGui::EndChild();
}

+ (void)setNextWindowPos:(CGPoint)pos cond:(int)cond pivot:(CGPoint)pivot {
    
    ImGui::SetNextWindowPos(ImVec2(pos.x, pos.y), cond, ImVec2(pivot.x, pivot.y));
}

+ (void)setNextWindowSize:(CGSize)size cond:(int)cond {
    
    ImGui::SetNextWindowSize(ImVec2(size.width, size.height), cond);
}

#pragma mark - list clipper

+ (void *)listClipperCreate:(int)itemsCount itemsHeight:(float)itemsHeight {
    
    return IM_NEW(ImGuiListClipper)(itemsCount, itemsHeight);
}

+ (void)listClipperDestroy:(void *)clipperObj {

    if (clipperObj != nil) {
        
        ImGuiListClipper *clipper = (ImGuiListClipper *)clipperObj;
        IM_DELETE(clipper);
    }
}

+ (void)listClipperBegin:(void *)clipperObj itemsCount:(int)itemsCount itemsHeight:(float)itemsHeight {

    if (clipperObj != nil) {
        
        ImGuiListClipper *clipper = (ImGuiListClipper *)clipperObj;
        clipper->Begin(itemsCount, itemsHeight);
    }
}

+ (void)listClipperEnd:(void *)clipperObj {

    if (clipperObj != nil) {
        
        ImGuiListClipper *clipper = (ImGuiListClipper *)clipperObj;
        clipper->End();
    }
}

+ (void)listClipperLoop:(void *)clipperObj block:(void (^) (int index))block {

    if (clipperObj != nil) {
        
        ImGuiListClipper *clipper = (ImGuiListClipper *)clipperObj;
        
        while (clipper->Step()) {
            
            for (int i = clipper->DisplayStart; i < clipper->DisplayEnd; i++) {

                block(i);
            }
        }
    }
}

@end
