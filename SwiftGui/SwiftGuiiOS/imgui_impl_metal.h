// dear imgui: Renderer for Metal
// This needs to be used along with a Platform Binding (e.g. OSX)

// Implemented features:
//  [X] Renderer: User texture binding. Use 'MTLTexture' as ImTextureID. Read the FAQ about ImTextureID in imgui.cpp.
//  [X] Renderer: Support for large meshes (64k+ vertices) with 16-bits indices.

// You can copy and use unmodified imgui_impl_* files in your project. See main.cpp for an example of using this.
// If you are new to dear imgui, read examples/README.txt and read the documentation at the top of imgui.cpp.
// https://github.com/ocornut/imgui
#include <Foundation/Foundation.h>
#include <Metal/Metal.h>

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

@class MTLRenderPassDescriptor;
@protocol MTLDevice, MTLCommandBuffer, MTLRenderCommandEncoder;

CIMGUI_API bool ImGui_ImplMetal_Init(id<MTLDevice> device);
CIMGUI_API void ImGui_ImplMetal_Shutdown();
CIMGUI_API void ImGui_ImplMetal_NewFrame(MTLRenderPassDescriptor *renderPassDescriptor);
CIMGUI_API void ImGui_ImplMetal_RenderDrawData(void* draw_data,
                                                   id<MTLCommandBuffer> commandBuffer,
                                                   id<MTLRenderCommandEncoder> commandEncoder);

// Called by Init/NewFrame/Shutdown
CIMGUI_API bool ImGui_ImplMetal_CreateFontsTexture(id<MTLDevice> device);
CIMGUI_API void ImGui_ImplMetal_DestroyFontsTexture();
CIMGUI_API bool ImGui_ImplMetal_CreateDeviceObjects(id<MTLDevice> device);
CIMGUI_API void ImGui_ImplMetal_DestroyDeviceObjects();
