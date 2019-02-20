//
//  UIColor+PawNergy.swift
//  PawNergy
//
//  Created by Trong Triet Le on 20/02/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
