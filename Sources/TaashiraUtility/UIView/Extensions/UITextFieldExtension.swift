import Foundation
import UIKit

@IBDesignable extension UITextField {
    public func setupRightSideImage(
        imageViewNamed: String
    ){
        let imageView = UIImageView(
            frame: CGRect(
                x: 0,
                y: 2,
                width: 16,
                height: 16
            )
        )
        imageView.image = UIImage(
            named: imageViewNamed
        )
        let imageViewContainerView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 20,
                height: 20
            )
        )
        imageViewContainerView.addSubview(
            imageView
        )
        rightView = imageViewContainerView
        rightViewMode = .always
        
    }
    
    func setupTXTField(
        label: String
    ){
    }
    
}
