//
//  ViewController.swift
//  Project01_SimpleStopWatch
//
//  Created by 张新宇 on 16/8/15.
//  Copyright © 2016年 Xinyu Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewControllerTimer = NSTimer.init()
    var viewControllerTimeNumber : Int = 0
    @IBOutlet weak var TimeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func updateFrame() {
        TimeTextField.text = String(viewControllerTimeNumber / 10) + String(".") + String(viewControllerTimeNumber % 10)
    }
    
    internal func viewControllerTimerFire() {
        viewControllerTimeNumber += 1
        updateFrame()
    }

    @IBAction func StartTouchDown(sender: AnyObject) {
        NSLog("STD: Fire")
        
        viewControllerTimer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                                                                     target: self,
                                                                     selector: #selector(ViewController.viewControllerTimerFire),
                                                                     userInfo: nil,
                                                                     repeats: true)
    }
    
    @IBAction func StopTouchDown(sender: AnyObject) {
        NSLog("STD: Stop")
        
        viewControllerTimer.invalidate()
    }
    @IBAction func ResetTouchDown(sender: AnyObject) {
        NSLog("RTD: Reset")
        
        viewControllerTimeNumber = 0
        updateFrame()
    }
}

