//
//  ViewController.swift
//  Day1_Animation
//
//  Created by Pham Nhat Anh on 6/2/16.
//  Copyright © 2016 Pham Nhat Anh. All rights reserved.
//

import UIKit
import pop

class ViewController: UIViewController {

    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    let lblHello = UILabel(frame: CGRectMake(10,60,100,21))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btnStart = UIButton(type:.System)
        btnStart.frame = CGRectMake(50,30, SCREEN_WIDTH-100 ,30)
        btnStart.setTitle("Start", forState:.Normal)
        btnStart.addTarget(self, action:#selector(ViewController.StartTouchUp(_:)), forControlEvents:.TouchUpInside)
        btnStart.backgroundColor = UIColor.brownColor()
        btnStart.tintColor = UIColor.whiteColor()
        btnStart.layer.cornerRadius = 8.0
        btnStart.layer.masksToBounds = true
        view.addSubview(btnStart)
        
        let btnStart2 = UIButton(type:.System)
        btnStart2.frame = CGRectMake(50,80, SCREEN_WIDTH-100 ,30)
        btnStart2.setTitle("Start", forState:.Normal)
        btnStart2.addTarget(self, action:#selector(ViewController.Start2TouchUp(_:)), forControlEvents:.TouchUpInside)
        btnStart2.backgroundColor = UIColor.brownColor()
        btnStart2.tintColor = UIColor.whiteColor()
        btnStart2.layer.cornerRadius = 8.0
        btnStart2.layer.masksToBounds = true
        view.addSubview(btnStart2)

    }
    
    
    
    func StartTouchUp(button:UIButton)  {
 
        lblHello.text = "Hello From Swift".uppercaseString
        lblHello.sizeToFit()
        view.addSubview(lblHello)
        
        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: [], animations: {
                self.lblHello.center.x = self.view.center.x
                self.lblHello.center.y = 250
            }) { (status) in
                if(status){
                    let changeText = CATransition()
                    changeText.duration = 2.0
                    changeText.type = kCATransitionMoveIn
                    changeText.subtype = kCATransitionFromRight
                    self.lblHello.layer.addAnimation(changeText, forKey: "myChangText")
                    self.lblHello.text = "By Frank Pham"
                    self.lblHello.font = UIFont.boldSystemFontOfSize(20)
                    self.lblHello.sizeToFit()
                }
        }
        
        
        
    }
    
    func Start2TouchUp(button:UIButton)  {
        
        let basicAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        basicAnimation.toValue = NSValue(CGPoint: CGPointMake(0.9, 0.9))
        basicAnimation.velocity = NSValue(CGPoint: CGPointMake(4, 4))
        basicAnimation.springBounciness = 50.0
        basicAnimation.name = "myAnimation"
        lblHello.pop_addAnimation(basicAnimation, forKey: "BBB")
        
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

