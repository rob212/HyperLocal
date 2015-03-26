//
//  ViewController.swift
//  hyperlocal
//
//  Created by Yasir Ahmad on 26/03/2015.
//  Copyright (c) 2015 hackdays. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!

    var topOfferVC: OfferViewController!
    var bottomOfferVC: OfferViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addOffers()

        bottomOfferVC.didMoveToParentViewController(self)
        topOfferVC.didMoveToParentViewController(self)
        
    }

    func addOffers() {

        topOfferVC = OfferViewController()
        bottomOfferVC = OfferViewController()

        self.addChildViewController(topOfferVC)
        self.addChildViewController(bottomOfferVC)

        self.inflate(self.topView, withView: self.topOfferVC.view)
        self.inflate(self.bottomView, withView: self.bottomOfferVC.view)
    }

    func inflate(view: UIView, withView internalView:UIView) {
        internalView.frame = view.bounds
        view.addSubview(internalView)
    }
}

