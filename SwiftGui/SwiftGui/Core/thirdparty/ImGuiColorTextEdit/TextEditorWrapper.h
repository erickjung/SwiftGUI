//
//  TextEditorWrapper.h
//  SwiftGuiCore
//
//  Created by Erick Jung on 05/02/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TextEditorWrapperLanguage) {
    cpp,
    hlsl,
    glsl,
    c,
    sql,
    angelScript,
    lua
};

typedef NS_ENUM(NSUInteger, TextEditorWrapperPallete) {
    dflt,
    retroBlue,
    light,
    dark
};

@interface TextEditorWrapper : NSObject

+ (void)setLanguageDefinition:(TextEditorWrapperLanguage)type;
+ (int)getTotalLines;
+ (bool)isOverwrite;
+ (void)setReadOnly:(bool)value;
+ (bool)isReadOnly;
+ (bool)isTextChanged;
+ (bool)isCursorPositionChanged;
+ (void)setShowWhitespaces:(bool)value;
+ (bool)isShowingWhitespaces;
+ (void)setColorizerEnable:(bool)value;
+ (bool)isColorizerEnabled;
+ (void)setTabSize:(int)value;
+ (int)getTabSize;
+ (bool)canUndo;
+ (void)undo;
+ (bool)canRedo;
+ (void)redo;
+ (bool)hasSelection;
+ (void)copy;
+ (void)cut;
+ (void)remove;
+ (void)paste;
+ (void)selectAll;
+ (void)setPallete:(TextEditorWrapperPallete)type;
+ (void)setText:(NSString *)text;
+ (NSString *)getText;
+ (void)insertText:(NSString *)text;
+ (void)render:(NSString *)title;

+ (void)clearErrorMarkers;
+ (void)insertErrorMarker:(int)index text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
