//
//  FlipViewExtension.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 10/09/25.
//

//import Foundation
//import UIKit
//import ObjectiveC
//
//private var shouldIgnoreRTLKey: UInt8 = 0
//
//extension UIView {
//
//    // IBInspectable property to mark if RTL should be ignored
//    @IBInspectable var shouldIgnoreRTL: Bool {
//        get {
//            return objc_getAssociatedObject(self, &shouldIgnoreRTLKey) as? Bool ?? false
//        }
//        set {
//            objc_setAssociatedObject(self, &shouldIgnoreRTLKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            setNeedsLayout()
//        }
//    }
//
//    @objc func cstmLayoutSubviews() {
//        self.cstmLayoutSubviews() // Call original layoutSubviews after swizzling
//
//        // Only apply logic if shouldIgnoreRTL is false
//        guard !shouldIgnoreRTL else { return }
//
//        // Example RTL adjustment – flip or change semantic content attribute
//        if UIApplication.isRTL() {
//            self.semanticContentAttribute = .forceRightToLeft
//        } else {
//            self.semanticContentAttribute = .forceLeftToRight
//        }
//    }
//    
//}
