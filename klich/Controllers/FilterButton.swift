//
//  FilterButton.swift
//  klich
//
//  Created by Ryan Nazari on 5/10/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class FilterButton: UIButton {

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        UIView.animate(withDuration: 0.3) {
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: (.pi / 2))
                self.backgroundColor = #colorLiteral(red: 0.1765, green: 0.1765, blue: 0.1765, alpha: 1) /* #2d2d2d */
            } else {
                self.transform = .identity
                self.backgroundColor = #colorLiteral(red: 0.1529, green: 0.2, blue: 0.1882, alpha: 1) /* #273330 */
            }
        }
         return super.beginTracking(touch, with: event)
    }

}



