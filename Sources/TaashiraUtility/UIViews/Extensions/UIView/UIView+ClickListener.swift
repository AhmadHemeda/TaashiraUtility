//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 28/05/2024.
//

import Foundation
import UIKit

extension UIView {
    func setOnClickListener(action :@escaping () -> Void){
        let tapRecogniser = ClickListener(target: self, action: #selector(onViewClicked(sender:)))
        tapRecogniser.onClick = action
        self.addGestureRecognizer(tapRecogniser)
    }
     
    @objc func onViewClicked(sender: ClickListener) {
        if let onClick = sender.onClick {
            onClick()
        }
    }
}

class ClickListener: UITapGestureRecognizer {
   var onClick : (() -> Void)? = nil
  }
