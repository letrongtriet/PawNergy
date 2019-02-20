//
//  Storyboard+PawNergy.swift
//  PawNergy
//
//  Created by Trong Triet Le on 20/02/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return mainStoryboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
