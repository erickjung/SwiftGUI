//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

/// A value type representing a texture pointer for ImGui rendering.
/// Wraps platform image objects (NSImage/UIImage) as opaque pointers.
public struct GuiTexture {
    // Store the object to keep it alive (ARC managed)
    private let object: AnyObject

    // Compute the pointer on-demand without retaining
    public var pointer: UnsafeMutableRawPointer {
        return Unmanaged.passUnretained(object).toOpaque()
    }

    /// Creates a texture from a platform image object.
    /// - Parameter object: The image object (id<MTLTexture> on macOS/iOS)
    public init(from object: AnyObject) {
        self.object = object
    }
}
