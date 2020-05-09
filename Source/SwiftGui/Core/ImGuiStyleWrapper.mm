//
// Copyright (c) 2020, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

#import "imgui.h"
#import "ImGuiStyleWrapper.h"

@implementation ImGuiStyleWrapper

#pragma mark - Properties

+ (void)alpha:(float)value {
    ImGui::GetStyle().Alpha = value;
}

+ (void)windowPadding:(CGPoint)value {
    ImGui::GetStyle().WindowPadding = ImVec2(value.x, value.y);
}

+ (void)windowRounding:(float)value {
    ImGui::GetStyle().WindowRounding = value;
}

+ (void)windowBorderSize:(float)value {
    ImGui::GetStyle().WindowBorderSize = value;
}

+ (void)windowMinSize:(CGSize)value {
    ImGui::GetStyle().WindowMinSize = ImVec2(value.width, value.height);
}

+ (void)windowTitleAlign:(CGPoint)value {
    ImGui::GetStyle().WindowTitleAlign = ImVec2(value.x, value.y);
}

+ (void)windowMenuButtonPosition:(int)value {
    ImGui::GetStyle().WindowMenuButtonPosition = value;
}

+ (void)childRounding:(float)value {
    ImGui::GetStyle().ChildRounding = value;
}

+ (void)childBorderSize:(float)value {
    ImGui::GetStyle().ChildBorderSize = value;
}

+ (void)popupRounding:(float)value {
    ImGui::GetStyle().PopupRounding = value;
}

+ (void)popupBorderSize:(float)value {
    ImGui::GetStyle().PopupBorderSize = value;
}

+ (void)framePadding:(CGPoint)value {
    ImGui::GetStyle().FramePadding = ImVec2(value.x, value.y);
}

+ (void)frameRounding:(float)value {
    ImGui::GetStyle().FrameRounding = value;
}

+ (void)frameBorderSize:(float)value {
    ImGui::GetStyle().FrameBorderSize = value;
}

+ (void)itemSpacing:(CGPoint)value {
    ImGui::GetStyle().ItemSpacing = ImVec2(value.x, value.y);
}

+ (void)itemInnerSpacing:(CGPoint)value {
    ImGui::GetStyle().ItemInnerSpacing = ImVec2(value.x, value.y);
}

+ (void)touchExtraPadding:(CGPoint)value {
    ImGui::GetStyle().TouchExtraPadding = ImVec2(value.x, value.y);
}

+ (void)indentSpacing:(float)value {
    ImGui::GetStyle().IndentSpacing = value;
}

+ (void)columnsMinSpacing:(float)value {
    ImGui::GetStyle().ColumnsMinSpacing = value;
}

+ (void)scrollbarSize:(float)value {
    ImGui::GetStyle().ScrollbarSize = value;
}

+ (void)scrollbarRounding:(float)value {
    ImGui::GetStyle().ScrollbarRounding = value;
}

+ (void)grabMinSize:(float)value {
    ImGui::GetStyle().GrabMinSize = value;
}

+ (void)grabRounding:(float)value {
    ImGui::GetStyle().GrabRounding = value;
}

+ (void)tabRounding:(float)value {
    ImGui::GetStyle().TabRounding = value;
}

+ (void)tabBorderSize:(float)value {
    ImGui::GetStyle().TabBorderSize = value;
}

+ (void)colorButtonPosition:(int)value {
    ImGui::GetStyle().ColorButtonPosition = value;
}

+ (void)buttonTextAlign:(CGPoint)value {
    ImGui::GetStyle().ButtonTextAlign = ImVec2(value.x, value.y);
}

+ (void)selectableTextAlign:(CGPoint)value {
    ImGui::GetStyle().SelectableTextAlign = ImVec2(value.x, value.y);
}

+ (void)displayWindowPadding:(CGPoint)value {
    ImGui::GetStyle().DisplayWindowPadding = ImVec2(value.x, value.y);
}

+ (void)displaySafeAreaPadding:(CGPoint)value {
    ImGui::GetStyle().DisplaySafeAreaPadding = ImVec2(value.x, value.y);
}

+ (void)mouseCursorScale:(float)value {
    ImGui::GetStyle().MouseCursorScale = value;
}

+ (void)antiAliasedLines:(bool)value {
    ImGui::GetStyle().AntiAliasedLines = value;
}

+ (void)antiAliasedFill:(bool)value {
    ImGui::GetStyle().AntiAliasedFill = value;
}

+ (void)curveTessellationTol:(float)value {
    ImGui::GetStyle().CurveTessellationTol = value;
}

#pragma mark - Colors

+ (ImVec4)convertCGColor:(CGColorRef _Nonnull)color {
    
    const CGFloat* components = CGColorGetComponents(color);

    if (CGColorGetNumberOfComponents(color) == 2) {
        
        return ImVec4(components[0], components[0], components[0], components[1]);
    }
    
    return ImVec4(components[0], components[1], components[2], components[3]);
}

+ (void)colorText:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_Text] = [self convertCGColor:color];
}

+ (void)colorTextDisabled:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TextDisabled] = [self convertCGColor:color];
}

+ (void)colorWindowBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_WindowBg] = [self convertCGColor:color];
}

+ (void)colorChildBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ChildBg] = [self convertCGColor:color];
}

+ (void)colorPopupBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_PopupBg] = [self convertCGColor:color];
}

+ (void)colorBorder:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_Border] = [self convertCGColor:color];
}

+ (void)colorBorderShadow:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_BorderShadow] = [self convertCGColor:color];
}

+ (void)colorFrameBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_FrameBg] = [self convertCGColor:color];
}

+ (void)colorFrameBgHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_FrameBgHovered] = [self convertCGColor:color];
}

+ (void)colorFrameBgActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_FrameBgActive] = [self convertCGColor:color];
}

+ (void)colorTitleBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TitleBg] = [self convertCGColor:color];
}

+ (void)colorTitleBgActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TitleBgActive] = [self convertCGColor:color];
}

+ (void)colorTitleBgCollapsed:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TitleBgCollapsed] = [self convertCGColor:color];
}

+ (void)colorMenuBarBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_MenuBarBg] = [self convertCGColor:color];
}

+ (void)colorScrollbarBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ScrollbarBg] = [self convertCGColor:color];
}

+ (void)colorScrollbarGrab:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ScrollbarGrab] = [self convertCGColor:color];
}

+ (void)colorScrollbarGrabHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ScrollbarGrabHovered] = [self convertCGColor:color];
}

+ (void)colorScrollbarGrabActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ScrollbarGrabActive] = [self convertCGColor:color];
}

+ (void)colorCheckMark:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_CheckMark] = [self convertCGColor:color];
}

+ (void)colorSliderGrab:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_SliderGrab] = [self convertCGColor:color];
}

+ (void)colorSliderGrabActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_SliderGrabActive] = [self convertCGColor:color];
}

+ (void)colorButton:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_Button] = [self convertCGColor:color];
}

+ (void)colorButtonHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ButtonHovered] = [self convertCGColor:color];
}

+ (void)colorButtonActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ButtonActive] = [self convertCGColor:color];
}

+ (void)colorHeader:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_Header] = [self convertCGColor:color];
}

+ (void)colorHeaderHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_HeaderHovered] = [self convertCGColor:color];
}

+ (void)colorHeaderActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_HeaderActive] = [self convertCGColor:color];
}

+ (void)colorSeparator:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_Separator] = [self convertCGColor:color];
}

+ (void)colorSeparatorHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_SeparatorHovered] = [self convertCGColor:color];
}

+ (void)colorSeparatorActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_SeparatorActive] = [self convertCGColor:color];
}

+ (void)colorResizeGrip:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ResizeGrip] = [self convertCGColor:color];
}

+ (void)colorResizeGripHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ResizeGripHovered] = [self convertCGColor:color];
}

+ (void)colorResizeGripActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ResizeGripActive] = [self convertCGColor:color];
}

+ (void)colorTab:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_Tab] = [self convertCGColor:color];
}

+ (void)colorTabHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TabHovered] = [self convertCGColor:color];
}

+ (void)colorTabActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TabActive] = [self convertCGColor:color];
}

+ (void)colorTabUnfocused:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TabUnfocused] = [self convertCGColor:color];
}

+ (void)colorTabUnfocusedActive:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TabUnfocusedActive] = [self convertCGColor:color];
}

+ (void)colorDockingPreview:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_DockingPreview] = [self convertCGColor:color];
}

+ (void)colorDockingEmptyBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_DockingEmptyBg] = [self convertCGColor:color];
}

+ (void)colorPlotLines:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_PlotLines] = [self convertCGColor:color];
}

+ (void)colorPlotLinesHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_PlotLinesHovered] = [self convertCGColor:color];
}

+ (void)colorPlotHistogram:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_PlotHistogram] = [self convertCGColor:color];
}

+ (void)colorPlotHistogramHovered:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_PlotHistogramHovered] = [self convertCGColor:color];
}

+ (void)colorTextSelectedBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_TextSelectedBg] = [self convertCGColor:color];
}

+ (void)colorDragDropTarget:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_DragDropTarget] = [self convertCGColor:color];
}

+ (void)colorNavHighlight:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_NavHighlight] = [self convertCGColor:color];
}

+ (void)colorNavWindowingHighlight:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_NavWindowingHighlight] = [self convertCGColor:color];
}

+ (void)colorNavWindowingDimBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_NavWindowingDimBg] = [self convertCGColor:color];
}

+ (void)colorModalWindowDimBg:(CGColorRef _Nonnull)color {
    ImGui::GetStyle().Colors[ImGuiCol_ModalWindowDimBg] = [self convertCGColor:color];
}


@end
