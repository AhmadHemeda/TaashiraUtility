//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 16/05/2024.
//

import Foundation
import UIKit

@IBDesignable
public extension UIView {
    
    func addGradient(_ colors: [UIColor], locations: [NSNumber], frame: CGRect = .zero, direction: GradientDirection) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map{ $0.cgColor }
        gradientLayer.locations = locations
        switch direction {
        case .vertical:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .horizontal:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .diagonal:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }
        
        gradientLayer.frame = frame
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addLight(alphaDegree: Double) {
        let lightView = UIView()
        lightView.backgroundColor = UIColor.init(white: 1.0, alpha: 0.8)
        lightView.alpha = alphaDegree
        lightView.frame = frame
        self.addSubview(lightView)
    }
}

public enum GradientDirection {
    case vertical
    case horizontal
    case diagonal
}
