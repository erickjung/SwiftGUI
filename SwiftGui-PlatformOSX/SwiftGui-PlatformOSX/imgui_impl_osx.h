// dear imgui: Platform Binding for OSX / Cocoa
// This needs to be used along with a Renderer (e.g. OpenGL2, OpenGL3, Vulkan, Metal..)
// [ALPHA] Early bindings, not well tested. If you want a portable application, prefer using the GLFW or SDL platform bindings on Mac.

// Implemented features:
//  [X] Platform: Mouse cursor shape and visibility. Disable with 'io.ConfigFlags |= ImGuiConfigFlags_NoMouseCursorChange'.
//  [X] Platform: OSX clipboard is supported within core Dear ImGui (no specific code in this back-end).
// Issues:
//  [ ] Platform: Keys are all generally very broken. Best using [event keycode] and not [event characters]..

@class NSEvent;
@class NSView;

#if defined _WIN32 || defined __CYGWIN__
    #ifdef CIMGUI_NO_EXPORT
        #define API
    #else
        #define API __declspec(dllexport)
    #endif
    #ifndef __GNUC__
    #define snprintf sprintf_s
    #endif
#else
    #define API
#endif

#if defined __cplusplus
    #define EXTERN extern "C"
#else
    #include <stdarg.h>
    #include <stdbool.h>
    #define EXTERN extern
#endif

#define CIMGUI_API EXTERN API

CIMGUI_API bool        ImGui_ImplOSX_Init();
CIMGUI_API void        ImGui_ImplOSX_Shutdown();
CIMGUI_API void        ImGui_ImplOSX_NewFrame(NSView *_Nonnull view);
CIMGUI_API bool        ImGui_ImplOSX_HandleEvent(NSEvent *_Nonnull event, NSView *_Nullable view);
