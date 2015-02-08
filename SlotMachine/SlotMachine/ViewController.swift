//
//  ViewController.swift
//  SlotMachine
//
//  Created by Shanti on 18/1/15.
//  Copyright (c) 2015 Shanti Rodríguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - VIEWS
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    //MARK: - LABELS
    var titleLabel: UILabel!
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    //MARK: - BUTTONS
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    // Slots - Array
    var slots: [[Slot]] = []
    
    //MARK: - CONSTRAINTS
    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat         = 1.0/6.0

    let kNumberOfContainers    = 3
    let kNumberOfSlots         = 3

    let kHalf:CGFloat          = 1.0/2.0
    let kEighth:CGFloat        = 1.0/8.0

    let kThird:CGFloat         = 1.0/3.0
    let kMarginForSlot:CGFloat = 2.0
    
    //MARK: - view DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: -
    //MARK: Setup ContainerViews
    func setupContainerViews()
    {
        self.firstContainer                  = UIView(frame: CGRect(x: 0, y: self.view.bounds.origin.y, width: self.view.bounds.width, height: self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor  = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1)
        self.view.addSubview(self.firstContainer)


        self.secondContainer                 = UIView(frame: CGRect(x: 0, y: firstContainer.frame.height, width: self.view.bounds.width, height: self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor(red:0.2, green:0.29, blue:0.37, alpha:1)
        self.view.addSubview(self.secondContainer)


        self.thirdContainer                  = UIView(frame: CGRect(x: 0, y: firstContainer.frame.height + secondContainer.frame.height, width: self.view.bounds.width, height: self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor  = UIColor(red:0.38, green:0.49, blue:0.55, alpha:1)
        self.view.addSubview(self.thirdContainer)


        self.fourthContainer                 = UIView(frame: CGRect(x: 0, y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, width: self.view.bounds.width, height: self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1)
        self.view.addSubview(self.fourthContainer)
    }

    //MARK: setup First Container
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel           = UILabel()
        self.titleLabel.text      = "Super Slots"
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.font      = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center    = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    //MARK: setupSecondContainer
    func setupSecondContainer(containerView: UIView)
    {
        
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
            
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
                
                var slot: Slot
                var slotImageView = UIImageView()
                
                if slots.count != 0 {
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                }
                else {
                    slotImageView.image = UIImage(named: "Ace")
                }

                
                slotImageView.backgroundColor = UIColor(red:0.95, green:0.77, blue:0.06, alpha:1)
                
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlot)
                
                containerView.addSubview(slotImageView)
            }
        }
    }

    //MARK: setupThirdContainer
    func setupThirdContainer(containerView: UIView) {
        
        self.creditsLabel                 = UILabel()
        self.creditsLabel.text            = "000000"
        self.creditsLabel.textColor       = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1)
        self.creditsLabel.font            = UIFont(name: "Menlo-Bold", size: 18)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center          = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
        self.creditsLabel.textAlignment   = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel                        = UILabel()
        self.betLabel.text                   = "0000"
        self.betLabel.textColor              = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1)
        self.betLabel.font                   = UIFont(name: "Menlo-Bold", size: 18)
        self.betLabel.sizeToFit()
        self.betLabel.center                 = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird)
        self.betLabel.textAlignment          = NSTextAlignment.Center
        self.betLabel.backgroundColor        = UIColor.whiteColor()
        containerView.addSubview(self.betLabel)

        self.winnerPaidLabel                 = UILabel()
        self.winnerPaidLabel.text            = "000000"
        self.winnerPaidLabel.textColor       = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1)
        self.winnerPaidLabel.font            = UIFont(name: "Menlo-Bold", size: 18)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center          = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird)
        self.winnerPaidLabel.textAlignment   = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.whiteColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.whiteColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 16)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.whiteColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 16)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.whiteColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 16)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * 5 * kSixth, y: containerView.frame.height * 2 * kThird)
        containerView.addSubview(self.winnerPaidTitleLabel)
    }
    
    //MARK: setup Fourth Container
    
    func setupFourthContainer (containerView: UIView) {
        self.resetButton = UIButton()
        self.resetButton.setTitle("  Reset  ", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor(red:0.91, green:0.3, blue:0.24, alpha:1), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 14)
        self.resetButton.backgroundColor = UIColor.whiteColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle(" Bet One ", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 14)
        self.betOneButton.backgroundColor = UIColor(red:0.18, green:0.8, blue:0.44, alpha:1)
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPoint(x: containerView.frame.width * 3 * kEighth, y: containerView.frame.height * kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle(" BetMax ", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 14)
        self.betMaxButton.backgroundColor = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1)
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPoint(x: containerView.frame.width * 5 * kEighth, y: containerView.frame.height * kHalf)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle(" Spin ", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 14)
        self.spinButton.backgroundColor = UIColor(red:0.18, green:0.8, blue:0.44, alpha:1)
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(x: containerView.frame.width * 7 * kEighth, y: containerView.frame.height * kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)
    }

    //MARK: -
    //MARK: ACTIONS BUTTONS
    
    func resetButtonPressed (button: UIButton) {
        println("resetButtonPressed")
    }
    
    func betOneButtonPressed (button: UIButton) {
        println(button)
    }
    func betMaxButtonPressed (button: UIButton) {
        
    }
    
    func spinButtonPressed (button: UIButton) {
        slots = Factory.createSlots()
        setupSecondContainer(self.secondContainer)
    }

}

