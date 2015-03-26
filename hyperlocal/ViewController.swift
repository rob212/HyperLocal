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

    var lastLocation:CGPoint = CGPointMake(0, 0)
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


    override func viewWillAppear(animated: Bool) {
        var panRecognizer = UIPanGestureRecognizer(target:self, action: "detectPan:")
        self.topView.gestureRecognizers = [panRecognizer]
        self.bottomView.gestureRecognizers = [panRecognizer]
}

    override func viewWillDisappear(animated: Bool) {
        self.topView.gestureRecognizers = nil;
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

