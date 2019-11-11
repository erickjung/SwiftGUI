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
-(void)handleEvent:(UIEvent *_Nullable)event view:(UIView *_Nullable)view;

@end

