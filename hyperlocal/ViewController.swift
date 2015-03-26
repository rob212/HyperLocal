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

    var topOfferVC: OfferViewController?
    var bottomOfferVC: OfferViewController?
    var cachedOfferVC: OfferViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addOffers()
    }

    // MARK: - Offers

    func addOffers() {
        self.display(self.topOfferVC, inView:self.topView)
        self.display(self.bottomOfferVC, inView: self.bottomView)
    }

    func display(var offer:OfferViewController?, inView containerView:UIView) {
        offer = OfferViewController()
        self.addChildViewController(offer!)
        self.inflate(containerView, withView: offer!.view)
    }

    func inflate(view: UIView, withView internalView:UIView) {
        internalView.frame = view.bounds
        view.addSubview(internalView)
    }
}

