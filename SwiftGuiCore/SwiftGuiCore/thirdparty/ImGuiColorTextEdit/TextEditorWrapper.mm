//
//  TextEditorWrapper.m
//  SwiftGuiCore
//
//  Created by Erick Jung on 05/02/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

#import "TextEditorWrapper.h"
#import "TextEditor.h"

// restricted to unique editor
static TextEditor textEditor;
static TextEditor::ErrorMarkers markers;

@interface TextEditorWrapper ()

@end

@implementation TextEditorWrapper

+ (void)setLanguageDefinition:(TextEditorWrapperLanguage)type {
    
    switch (type) {
        case cpp:         textEditor.SetLanguageDefinition(TextEditor::LanguageDefinition::CPlusPlus()); break;
        case hlsl:        textEditor.SetLanguageDefinition(TextEditor::LanguageDefinition::HLSL()); break;
        case glsl:        textEditor.SetLanguageDefinition(TextEditor::LanguageDefinition::GLSL()); break;
        case c:           textEditor.SetLanguageDefinition(TextEditor::LanguageDefinition::C()); break;
        case sql:         textEditor.SetLanguageDefinition(TextEditor::LanguageDefinition::SQL()); break;
        case angelScript: textEditor.SetLanguageDefinition(TextEditor::LanguageDefinition::AngelScript()); break;
        case lua:         textEditor.SetLanguageDefinition(TextEditor::LanguageDefinition::Lua()); break;
        default: break;
    }
}

+ (int)getTotalLines {
    
    return textEditor.GetTotalLines();
}

+ (bool)isOverwrite {
    
    return textEditor.IsOverwrite();
}

+ (void)setReadOnly:(bool)value {
    
    textEditor.SetReadOnly(value);
}

+ (bool)isReadOnly {
    
    return textEditor.IsReadOnly();
}

+ (bool)isTextChanged {
    
    return textEditor.IsTextChanged();
}

+ (bool)isCursorPositionChanged {
    
    return textEditor.IsCursorPositionChanged();
}

+ (void)setShowWhitespaces:(bool)value {
    
    textEditor.SetShowWhitespaces(value);
}

+ (bool)isShowingWhitespaces {
    
    return textEditor.IsShowingWhitespaces();
}

+ (void)setColorizerEnable:(bool)value {
    
    textEditor.SetColorizerEnable(value);
}

+ (bool)isColorizerEnabled {
    
    return textEditor.IsColorizerEnabled();
}

+ (void)setTabSize:(int)value {
    
    textEditor.SetTabSize(value);
}

+ (int)getTabSize {
    
    return textEditor.GetTabSize();
}

+ (bool)canUndo {
    
    return textEditor.CanUndo();
}

+ (void)undo {
    
    textEditor.Undo();
}

+ (bool)canRedo {
    
    return textEditor.CanRedo();
}

+ (void)redo {
    
    textEditor.Redo();
}

+ (bool)hasSelection {
    
    return textEditor.HasSelection();
}

+ (void)copy {
    
    textEditor.Copy();
}

+ (void)cut {
    
    textEditor.Cut();
}

+ (void)remove {
    
    textEditor.Delete();
}

+ (void)paste {
    
    textEditor.Paste();
}

+ (void)selectAll {
    
    textEditor.SelectAll();
}

+ (void)setPallete:(TextEditorWrapperPallete)type {
    
    switch (type) {
        case dflt:      textEditor.SetPalette(TextEditor::GetDefaultPalette()); break;
        case retroBlue: textEditor.SetPalette(TextEditor::GetRetroBluePalette()); break;
        case light:     textEditor.SetPalette(TextEditor::GetLightPalette()); break;
        case dark:      textEditor.SetPalette(TextEditor::GetDarkPalette()); break;
        default: break;
    }
}

+ (void)setText:(NSString *)text {
    
    textEditor.SetText(std::string([text UTF8String]));
}

+ (NSString *)getText {
    
    return [NSString stringWithCString:textEditor.GetText().c_str() encoding:[NSString defaultCStringEncoding]];
}

+ (void)insertText:(NSString *)text {
    
    textEditor.InsertText(std::string([text UTF8String]));
}

+ (void)render:(NSString *)title {
    
    textEditor.Render([title UTF8String]);
}

+ (void)clearErrorMarkers {
    
    markers.clear();
    
    textEditor.SetErrorMarkers(markers);
}

+ (void)insertErrorMarker:(int)index text:(NSString *)text {
    
    markers.insert(std::make_pair(index, std::string([text UTF8String])));
    
    textEditor.SetErrorMarkers(markers);
}

@end
