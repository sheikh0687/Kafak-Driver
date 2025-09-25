//
//  Localizer.swift
//  Localization102
//
//  Created by Moath_Othman on 2/24/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import UIKit

// MARK: - UIApplication Extension (Check only, no swizzling)
extension UIApplication {
    class func isRTL() -> Bool {
        return L102Language.currentAppleLanguage() == "ar"
    }
}

// MARK: - Swizzling Setup
class L102Localizer: NSObject {
    
    class func DoTheMagic() {
        MethodSwizzleGivenClassName(cls: Bundle.self,
                                    originalSelector: #selector(Bundle.localizedString(forKey:value:table:)),
                                    overrideSelector: #selector(Bundle.specialLocalizedStringForKey(_:value:table:)))

        // Remove UIApplication swizzling to avoid affecting keyboard
        MethodSwizzleGivenClassName(cls: UITextField.self,
                                    originalSelector: #selector(UITextField.layoutSubviews),
                                    overrideSelector: #selector(UITextField.cstmlayoutSubviews))

        MethodSwizzleGivenClassName(cls: UILabel.self,
                                    originalSelector: #selector(UILabel.layoutSubviews),
                                    overrideSelector: #selector(UILabel.cstmlayoutSubviews))

        MethodSwizzleGivenClassName(cls: UIImageView.self,
                                    originalSelector: #selector(UIImageView.layoutSubviews),
                                    overrideSelector: #selector(UIImageView.cstmLayoutSubviews))

        MethodSwizzleGivenClassName(cls: UIButton.self,
                                    originalSelector: #selector(UIButton.layoutSubviews),
                                    overrideSelector: #selector(UIButton.cstmLayoutSubviews))
        
//        MethodSwizzleGivenClassName(cls: UIView.self,
//                                    originalSelector: #selector(UIView.layoutSubviews),
//                                    overrideSelector: #selector(UIView.cstmlayoutSubviews))
    }
}

// MARK: - UILabel Swizzling
extension UILabel {
    @objc func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()

        if self.isKind(of: NSClassFromString("UITextFieldLabel")!) {
            return
        }
        
        if self.tag == 999 {
            if let attributed = self.attributedText,
               attributed.length > 0,
               attributed.attribute(.paragraphStyle, at: 0, effectiveRange: nil) != nil {
                return
            }
        }

        if self.tag <= 0 {
            self.textAlignment = UIApplication.isRTL() ? .right : .left
        }
    }
}

// MARK: - UITextField Swizzling
extension UITextField {
    @objc func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()

        if self.tag <= 0 {
            self.textAlignment = UIApplication.isRTL() ? .right : .left
        }

        if self.tag == 40 || self.tag == 41 {
            self.textAlignment = .left
        }
    }
}

//extension UIView {
//    @objc func cstmlayoutSubviews() {
//        self.cstmlayoutSubviews()
//
//        // Skip adjustment for views with tag 999
//        if self.tag == 999 {
//            self.semanticContentAttribute = .unspecified
//            return
//        }
//
//        // Apply RTL or LTR layout direction
//        if UIApplication.isRTL() {
//            self.semanticContentAttribute = .forceRightToLeft
//        } else {
//            self.semanticContentAttribute = .forceLeftToRight
//        }
//    }
//}

// MARK: - UIImageView RTL Flip
//extension UIImageView {
//    @objc func cstmLayoutSubviews() {
//        self.cstmLayoutSubviews()
//        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
//            self.semanticContentAttribute = .forceRightToLeft // Mirrors the image in RTL
//        } else {
//            self.semanticContentAttribute = .forceLeftToRight // No mirroring in LTR
//        }
//    }
//}
//
//// MARK: - UIButton RTL Image Flip
//extension UIButton {
//    @objc func cstmLayoutSubviews() {
//        self.cstmLayoutSubviews()
//
//        if UIApplication.isRTL() {
//            self.semanticContentAttribute = .forceRightToLeft
//            self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
//            self.titleLabel?.textAlignment = .right
//        } else {
//            self.semanticContentAttribute = .forceLeftToRight
//            self.imageView?.transform = .identity
//            self.titleLabel?.textAlignment = .left
//        }
//    }
//}

// MARK: - Bundle Swizzling for Language
extension Bundle {
    @objc func specialLocalizedStringForKey(_ key: String, value: String?, table tableName: String?) -> String {
        if self == Bundle.main {
            let currentLanguage = L102Language.currentAppleLanguage()
            var bundle = Bundle()

            if let path = Bundle.main.path(forResource: L102Language.currentAppleLanguageFull(), ofType: "lproj") {
                bundle = Bundle(path: path)!
            } else if let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
                bundle = Bundle(path: path)!
            } else {
                let path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
                bundle = Bundle(path: path)!
            }

            return bundle.specialLocalizedStringForKey(key, value: value, table: tableName)
        } else {
            return self.specialLocalizedStringForKey(key, value: value, table: tableName)
        }
    }
}

// MARK: - Method Swizzling Function
func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    guard let origMethod = class_getInstanceMethod(cls, originalSelector),
          let overrideMethod = class_getInstanceMethod(cls, overrideSelector) else {
        return
    }

    if class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod))
    } else {
        method_exchangeImplementations(origMethod, overrideMethod)
    }
}
