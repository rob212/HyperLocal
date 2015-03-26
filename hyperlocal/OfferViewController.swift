//
//  OfferViewController.swift
//  hyperlocal
//
//  Created by Yasir Ahmad on 26/03/2015.
//  Copyright (c) 2015 hackdays. All rights reserved.
//

import UIKit

class OfferViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init() {
        super.init(nibName: "OfferViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.view.layer.borderWidth = 1.0
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
