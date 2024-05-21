import Foundation
import UIKit

@IBDesignable extension UITextField {
    public func setupSideImage(imageViewNamed: String, imageFrame: CGRect, containerFrame: CGRect, alignment: Alignment){
        let imageView = UIImageView(
            frame: imageFrame)
        imageView.image = UIImage(named: imageViewNamed)
        let imageViewContainerView = UIView(
            frame: containerFrame)
        imageViewContainerView.addSubview(imageView)
        switch alignment {
        case .right:
            rightView = imageViewContainerView
            rightViewMode = .always
        case .left:
            leftView = imageViewContainerView
            leftViewMode = .always
        }
    }
    
}

public enum Alignment {
    case right
    case left
}
