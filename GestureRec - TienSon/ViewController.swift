//
//  ViewController.swift
//  GestureRec - TienSon
//
//  Created by HoangHai on 6/20/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("onTap:"))
        self.view.addGestureRecognizer(tapGesture)
    }

    func onTap(tapGesture : UITapGestureRecognizer) {
        let point = tapGesture.locationInView(self.view)
        let mole = UIImageView(image: UIImage(named: "mole.png"))
        mole.bounds.size = CGSizeMake(5, 5)
        mole.center = point
        self.view.addSubview(mole)
    }

}

