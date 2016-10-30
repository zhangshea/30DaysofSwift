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
        changeFontButton!.layer.borderColor = UIColor.white.cgColor
        
        let fontsFamily = UIFont.familyNames
        for fontsFamilyName in fontsFamily {
            let fontsUnderFamilyName = UIFont.fontNames(forFamilyName: fontsFamilyName)
            for fontsName in fontsUnderFamilyName {
                fonts.append(fontsName)
            }
        }
        topTextView.isSelectable = true
        topTextFontSize = (topTextView.font?.pointSize)!
        topTextView.isSelectable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeFont(_ sender: UIButton) {
        NSLog("changeFont button press")
        
        whichFontNumber += 1
        if (whichFontNumber == 1) {
            topTextView.font = UIFont.init(name: "OpenSans-Light.ttf", size: topTextFontSize!)
        } else {
            let fontsNumber = fonts.count
            let nextFontsIndex = Int(arc4random_uniform(UInt32(fontsNumber)))
            topTextView.font = UIFont.init(name: fonts[nextFontsIndex], size: topTextFontSize!)
            if (whichFontNumber == 3) {
                whichFontNumber = 0
            }
        }
    }
}

