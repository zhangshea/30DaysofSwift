//
//  ViewController.swift
//  Project02_CustomFont
//
//  Created by 张新宇 on 16/8/16.
//  Copyright © 2016年 Xinyu Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topTextView: UITextView!
    @IBOutlet weak var changeFontButton: UIButton!
    var whichFontNumber: Int = 0
    var fonts: [String] = []
    var topTextFontSize: CGFloat? = CGFloat.init(16.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        changeFontButton!.layer.masksToBounds = true
        changeFontButton!.layer.cornerRadius = changeFontButton!.layer.bounds.width
        changeFontButton!.layer.borderWidth = 5
        changeFontButton!.layer.borderColor = UIColor.whiteColor().CGColor
        
        let fontsFamily = UIFont.familyNames()
        for fontsFamilyName in fontsFamily {
            let fontsUnderFamilyName = UIFont.fontNamesForFamilyName(fontsFamilyName)
            for fontsName in fontsUnderFamilyName {
                fonts.append(fontsName)
            }
        }
        topTextView.selectable = true
        topTextFontSize = (topTextView.font?.pointSize)!
        topTextView.selectable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeFont(sender: UIButton) {
        NSLog("changeFont button press")
        
        whichFontNumber += 1
        if (whichFontNumber == 1) {
            topTextView.font = UIFont.init(name: "OpenSans-Light.ttf", size: topTextFontSize!)
        } else {
            let fontsNumber = fonts.count
            srand(UInt32(time(nil)))
            let nextFontsIndex = random() % fontsNumber
            topTextView.font = UIFont.init(name: fonts[nextFontsIndex], size: topTextFontSize!)
            if (whichFontNumber == 3) {
                whichFontNumber = 0
            }
        }
    }
}

