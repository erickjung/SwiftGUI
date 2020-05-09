#import "SGRenderer.h"
#import <Metal/Metal.h>

#include "imgui.h"
#include "imgui_impl_metal.h"

#if TARGET_OS_OSX
#include "imgui_impl_osx.h"
#endif

@interface SGRenderer ()
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@property (nonatomic, strong) MTKTextureLoader *loader;
@end


@implementation SGRenderer

-(nonnull instancetype)initWithView:(nonnull MTKView *)view;
{
    self = [super init];
    if(self)
    {
        _device = view.device;
        _commandQueue = [_device newCommandQueue];
        _loader = [[MTKTextureLoader alloc] initWithDevice: _device];
        
        IMGUI_CHECKVERSION();
        ImGui::CreateContext();
        ImGui::StyleColorsDark();

    }

    return self;
}

- (void)drawInMTKView:(MTKView *)view
{
    ImGuiIO &io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;

#if TARGET_OS_OSX
    CGFloat framebufferScale = view.window.screen.backingScaleFactor ?: NSScreen.mainScreen.backingScaleFactor;
#else
    CGFloat framebufferScale = view.window.screen.scale ?: UIScreen.mainScreen.scale;
#endif
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);

    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];

    static float clear_color[4] = { 0.5, 0.5, 0.5, 1.0f };

    MTLRenderPassDescriptor *renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor != nil)
    {
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(clear_color[0], clear_color[1], clear_color[2], clear_color[3]);

        // Here, you could do additional rendering work, including other passes as necessary.

        id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        [renderEncoder pushDebugGroup:@"SwiftGUI"];

        // Start the Dear ImGui frame
        ImGui_ImplMetal_NewFrame(renderPassDescriptor);
#if TARGET_OS_OSX
        ImGui_ImplOSX_NewFrame(view);
#endif
        ImGui::NewFrame();

        if (self.delegate && [self.delegate respondsToSelector:@selector(draw)]) {

            [self.delegate draw];
        }

        // Rendering
        ImGui::Render();
        ImDrawData *drawData = ImGui::GetDrawData();
        ImGui_ImplMetal_RenderDrawData(drawData, commandBuffer, renderEncoder);

        [renderEncoder popDebugGroup];
        [renderEncoder endEncoding];

        [commandBuffer presentDrawable:view.currentDrawable];
    }

    [commandBuffer commit];
}

- (void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size {
}

-(void)initializePlatform:(BOOL)withDock {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(setup)]) {

        [self.delegate setup];
    }

    ImGui_ImplMetal_Init(_device);

    ImGui_ImplOSX_Init();
    
    if (withDock) {
        ImGuiIO& io = ImGui::GetIO();
        io.ConfigFlags |= ImGuiConfigFlags_DockingEnable;
    }
}

-(void)shutdownPlatform {
    
    ImGui_ImplOSX_Shutdown();
}

-(bool)handleEvent:(NSEvent *_Nonnull)event view:(NSView *_Nullable)view {
 
    return ImGui_ImplOSX_HandleEvent(event, view);
}

-(id<MTLTexture>)loadTextureWithURL:(NSURL *)url {

    id<MTLTexture> texture = [self.loader newTextureWithContentsOfURL:url options:nil error:nil];
    
    if(!texture)
    {
        NSLog(@"Failed to create the texture from %@", url.absoluteString);
        return nil;
    }
    return texture;
}

-(id<MTLTexture>)loadTextureWithName:(NSString *)name {

    id<MTLTexture> texture = [self.loader newTextureWithName:name scaleFactor:1.0 bundle:nil options:nil error:nil];

    if(!texture)
    {
        NSLog(@"Failed to create the texture from %@", name);
        return nil;
    }
    return texture;
}

@end
