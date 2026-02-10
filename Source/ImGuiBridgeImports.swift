//
// Copyright (c) 2020-2026, Erick Jung.
// All rights reserved.
//
// This source code is licensed under the MIT-style license found in the
// LICENSE file in the root directory of this source tree.
//

// Re-export ImGuiBridge so Swift files can access ImGuiWrapper
@_exported import ImGuiBridge
import Foundation

#if os(OSX)
import AppKit
#else
import UIKit
#endif
