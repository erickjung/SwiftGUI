#import <MetalKit/MetalKit.h>

@protocol SGRendererDelegate<NSObject>

- (void)draw;

@end

@interface SGRenderer : NSObject <MTKViewDelegate>

@property (nonatomic, weak, nullable) id<SGRendererDelegate> delegate;

-(nonnull instancetype)initWithView:(nonnull MTKView *)view;

+(void)handleEvent:(UIEvent *_Nullable)event view:(UIView *_Nullable)view;

@end

