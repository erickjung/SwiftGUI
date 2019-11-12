#import <MetalKit/MetalKit.h>

@protocol SGRendererDelegate<NSObject>

- (void)setup;
- (void)draw;

@end

@interface SGRenderer : NSObject <MTKViewDelegate>

@property (nonatomic, weak, nullable) id<SGRendererDelegate> delegate;

-(nonnull instancetype)initWithView:(nonnull MTKView *)view;

-(void)initializePlatform;
-(void)shutdownPlatform;
-(bool)handleEvent:(NSEvent *_Nonnull)event view:(NSView *_Nullable)view;

-(id<MTLTexture>_Nullable)loadTextureWithURL:(NSURL *_Nonnull)url;
-(id<MTLTexture>_Nullable)loadTextureWithName:(NSString *_Nonnull)name;

@end

