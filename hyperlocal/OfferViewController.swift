//
//  OfferViewController.swift
//  hyperlocal
//
//  Created by Yasir Ahmad on 26/03/2015.
//  Copyright (c) 2015 hackdays. All rights reserved.
//

import UIKit

protocol OfferViewControllerDelegate {

}

class OfferViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init() {
        super.init(nibName: "OfferViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
