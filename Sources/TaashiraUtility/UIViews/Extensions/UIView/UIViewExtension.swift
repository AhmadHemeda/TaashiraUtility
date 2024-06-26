import Foundation
import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable public var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(
                    cgColor:color
                )
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable public var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable public var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable public var shadowRadius:CGFloat {
        set {
            layer.shadowRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.shadowRadius
        }
    }
    @IBInspectable public var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    @IBInspectable public var padding:CGFloat {
        
        set {
            self.bounds = self.frame.insetBy(
                dx: newValue,
                dy: newValue
            );
        }
        get {
            return self.bounds.origin.x
        }
    }
    
    @IBInspectable public var shadowColor:UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(
                    cgColor:color
                )
            }
            else {
                return nil
            }
        }
    }
    
    
}
