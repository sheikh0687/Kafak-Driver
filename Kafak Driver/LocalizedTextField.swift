//
//  LocalizedTextField.swift
//  Cinerama Maps
//
//  Created by Techimmense Software Solutions on 20/12/24.
//

import UIKit

@IBDesignable
class LocalizedTextField: UITextField {
    
    enum DirectionVal {
        case on, off
    }
    
    var directionVal: DirectionVal = .on {
        didSet {
            updateTextAlignment()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateTextAlignment()
    }
    
    private func updateTextAlignment() {
        switch directionVal {
        case .on where L102Language.isRTL:
            textAlignment = .right
        case .on:
            textAlignment = .left
        case .off:
            break
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateTextAlignment()
    }
}

@IBDesignable
class LocalizedTextView: UITextView {
    
    enum DirectionVal {
        case on, off
    }
    
    var directionVal: DirectionVal = .on {
        didSet {
            updateTextAlignment()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateTextAlignment()
    }
    
    private func updateTextAlignment() {
        switch directionVal {
        case .on where L102Language.isRTL:
            textAlignment = .right
        case .on:
            textAlignment = .left
        case .off:
            break
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateTextAlignment()
    }
}
