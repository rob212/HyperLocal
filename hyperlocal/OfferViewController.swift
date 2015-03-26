//
//  OfferViewController.swift
//  hyperlocal
//
//  Created by Yasir Ahmad on 26/03/2015.
//  Copyright (c) 2015 hackdays. All rights reserved.
//

import UIKit

class OfferViewController: UIViewController {

    var lastLocation:CGPoint = CGPointMake(0, 0)

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init() {
        super.init(nibName: "OfferViewController", bundle: nil)


        //randomize view color
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.view.layer.borderWidth = 1.0
    }

    override func viewWillAppear(animated: Bool) {
        var panRecognizer = UIPanGestureRecognizer(target:self, action:"detectPan:")
        self.view.gestureRecognizers = [panRecognizer]
    }

    override func viewWillDisappear(animated: Bool) {
        self.view.gestureRecognizers = nil;
    }

    func detectPan(recognizer:UIPanGestureRecognizer) {
        switch (recognizer.state) {        case UIGestureRecognizerState.Ended:
            if (self.view.center.x < 0) {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.view.center = CGPointMake(-self.view.frame.width/2, self.view.frame.height/2);
                })
            } else {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.resetView()
                })
            }
            break
        case UIGestureRecognizerState.Changed:
            var translation  = recognizer.translationInView(self.view!)

            let newLoc = lastLocation.x + translation.x;
            if (newLoc > self.view.frame.width/2) {
                self.resetView()
            } else {
                self.view.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y)
            }
            break
        default:
            break
        }
    }

    func resetView() {
        self.view.center = CGPointMake(self.view.frame.width/2, self.view.frame.height/2);
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // Promote the touched view
        self.view.bringSubviewToFront(self.view)

        // Remember original location
        lastLocation = self.view.center
    }
}
