//
//  Items.swift
//  GestureRec - TienSon
//
//  Created by HoangHai on 6/20/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class Item: UIImageView, UIGestureRecognizerDelegate {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: Selector("onPan:"))
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: Selector("pinchPhoto:"))
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: Selector("rotatePhoto:"))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }

    func onPan(panGesture: UIPanGestureRecognizer) {
        if (panGesture.state == .Began || panGesture.state == .Changed) {
            let point = panGesture.locationInView(self.superview)
            self.center = point
    }
    }
    
    func pinchPhoto(pinchGesture: UIPinchGestureRecognizer) {
        if let view = pinchGesture.view {
            view.transform = CGAffineTransformScale(view.transform, pinchGesture.scale, pinchGesture.scale)
            pinchGesture.scale = 1
    }
    }

    func rotatePhoto(rotateGesture: UIRotationGestureRecognizer) {
        if let view = rotateGesture.view {
            view.transform = CGAffineTransformRotate(view.transform, rotateGesture.rotation)
            rotateGesture.rotation = 0
        
        }
        }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
    }
    }

