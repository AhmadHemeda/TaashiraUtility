import Foundation
import UIKit

extension UILabel {
    @IBInspectable
    public var rotation: Int {
        get {
            return 0
        } set {
            let radians = CGFloat(
                CGFloat(
                    Double.pi
                ) * CGFloat(
                    newValue
                ) / CGFloat(
                    180.0
                )
            )
            self.transform = CGAffineTransform(
                rotationAngle: radians
            )
        }
    }
    
    public typealias MethodHandler = () -> Void
    public func addRangeGesture(
        stringRange: String,
        function: @escaping MethodHandler
    ) {
        RangeGestureRecognizer.stringRange = stringRange
        RangeGestureRecognizer.function = function
        self.isUserInteractionEnabled = true
        let tapgesture: UITapGestureRecognizer = RangeGestureRecognizer(
            target: self,
            action: #selector(
                tappedOnLabel(
                    _ :
                )
            )
        )
        tapgesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(
            tapgesture
        )
    }
    
    @objc public func tappedOnLabel(
        _ gesture: RangeGestureRecognizer
    ) {
        guard let text = self.text else {
            return
        }
        let stringRange = (
            text as NSString
        ).range(
            of: RangeGestureRecognizer.stringRange ?? ""
        )
        if gesture.didTapAttributedTextInLabel(
            label: self,
            inRange: stringRange
        ) {
            guard let existedFunction = RangeGestureRecognizer.function else {
                return
            }
            existedFunction()
        }
    }
    
    
}
