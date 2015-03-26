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

    var lastLocation:CGPoint = CGPointMake(0, 0)

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init() {
        super.init(nibName: "OfferViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.layer.borderColor = UIColor.darkGrayColor().CGColor
//        self.view.layer.borderWidth = 1.0
    }

    override func viewWillAppear(animated: Bool) {
        var panRecognizer = UIPanGestureRecognizer(target:self, action:"detectPan:")
        self.view.gestureRecognizers = [panRecognizer]
    }

    override func viewWillDisappear(animated: Bool) {
        self.view.gestureRecognizers = nil;
    }

    func detectPan(recognizer:UIPanGestureRecognizer) {
        switch (recognizer.state) {
        case UIGestureRecognizerState.Ended:
            if (self.view.center.x < 0) {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.view.center = CGPointMake(-self.view.frame.width/2, self.view.frame.height/2);
                })
            } else {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: nil, animations: { () -> Void in
                    self.resetView()
                    }, completion:nil)
            }
            break
        case UIGestureRecognizerState.Changed:
            var translation  = recognizer.translationInView(self.view!)

            let newLoc = lastLocation.x + translation.x;
            if (newLoc > self.view.frame.width/2) {
                self.resetView()
            } else {
                self.view.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y)
                                println("\(translation.x) \(self.view.frame.width)")
//                println(abs(translation.x - lastLocation.x))
                self.view.alpha = (self.view.frame.width - abs(translation.x)) / self.view.frame.width
            }
            break
        default:
            break
        }
    }

    func resetView() {
        self.view.center = CGPointMake(self.view.frame.width/2, self.view.frame.height/2);
        self.view.alpha = 1.0
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // Promote the touched view
        self.view.bringSubviewToFront(self.view)

        // Remember original location
        lastLocation = self.view.center
    }
}
