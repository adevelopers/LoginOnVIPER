//
//  UITextField+extension.swift
//  LoginOnViper
//
//  Created by Kirill Khudiakov on 01/03/2019.
//  Copyright © 2019 adeveloper. All rights reserved.
//

import UIKit


extension UITextField {
    
    func addBottomBorder(with color: UIColor) {
        borderStyle = .none
        layer.masksToBounds = false
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
    }
    
    func add(placeholder: String, with color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
}
