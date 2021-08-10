//
//  Extensions.swift
//  iOS Starter Application
//
//  Created by Tuan Pham on 2021/08/10.
//

import Foundation
import UIKit

extension UIViewController {
    
    func removeMe() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
