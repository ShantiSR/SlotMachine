//
//  ViewController.swift
//  SlotMachine
//
//  Created by Shanti on 18/1/15.
//  Copyright (c) 2015 Shanti Rodríguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // VIEWS
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    // LABELS
    var titleLabel: UILabel!
    
    // FRAMES
    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Setup ContainerViews
    func setupContainerViews()
    {
        self.firstContainer = UIView(frame: CGRect(x: 0, y: self.view.bounds.origin.y, width: self.view.bounds.width, height: self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1)
        self.view.addSubview(self.firstContainer)
        
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }

    // setup First Container
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }

}

