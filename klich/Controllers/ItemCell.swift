//
//  MyCell.swift
//  klich
//
//  Created by Ryan Nazari on 5/13/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import SwipeCellKit


class ItemCell: SwipeCollectionViewCell {
    
    
    
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descLable: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
 
}

//var swipeGesture: UIPanGestureRecognizer!
//var originalPoint: CGPoint!
//
//func configureCell() {
//    setupSwipeGesture()
//}
//
//func setupSwipeGesture() {
//    swipeGesture = UIPanGestureRecognizer(target: self, action:#selector(swiped(_:)))
//    swipeGesture.delegate = self as! UIGestureRecognizerDelegate
//
//    self.addGestureRecognizer(swipeGesture)
//}
//
//
//@objc func swiped(_ gestureRecognizer: UIPanGestureRecognizer) {
//    let xDistance:CGFloat = gestureRecognizer.translation(in: self).x
//
//    switch(gestureRecognizer.state) {
//    case UIGestureRecognizerState.began:
//        self.originalPoint = self.center
//    case UIGestureRecognizerState.changed:
//        let translation: CGPoint = gestureRecognizer.translation(in: self)
//        let displacement: CGPoint = CGPoint.init(x: translation.x, y: translation.y)
//
//        if displacement.x + self.originalPoint.x < self.originalPoint.x {
//            self.transform = CGAffineTransform.init(translationX: displacement.x, y: 0)
//            self.center = CGPoint(x: self.originalPoint.x + xDistance, y: self.originalPoint.y)
//        }
//    case UIGestureRecognizerState.ended:
//        let hasMovedToFarLeft = self.frame.maxX < UIScreen.main.bounds.width / 2
//        if (hasMovedToFarLeft) {
//            removeViewFromParentWithAnimation()
//        } else {
//            resetViewPositionAndTransformations()
//        }
//    default:
//        break
//    }
//}
//
//func resetViewPositionAndTransformations(){
//    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: UIView.AnimationOptions(), animations: {
//        self.center = self.originalPoint
//        self.transform = CGAffineTransform(rotationAngle: 0)
//    }, completion: {success in })
//}
//
//func removeViewFromParentWithAnimation() {
//    var animations:(()->Void)!
//    animations = {self.center.x = -self.frame.width}
//
//    UIView.animate(withDuration: 0.2, animations: animations , completion: {success in self.removeFromSuperview()})
//}
