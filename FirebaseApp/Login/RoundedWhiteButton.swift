//
//  RoundedWhiteButton.swift
//  CloudFunctions
//
//  Created by Robert Canton on 2017-09-13.
//  Copyright © 2017 Robert Canton. All rights reserved.
//

import Foundation
import UIKit


class RoundedWhiteButton:UIButton {
    
    var highlightedColor = UIColor(hex: "397EB8")    {
        didSet {
            if isHighlighted {
                backgroundColor = highlightedColor
            }
        }
    }
    var defaultColor = UIColor(hex: "EFC849")
    {
        didSet {
            if !isHighlighted {
                backgroundColor = defaultColor
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.alpha = 0.5
                // backgroundColor = UIColor(hex: "397EB8")
               // self.layer.borderColor = UIColor(hex: "397EB8").cgColor
                
            } else {
                self.alpha = 1

               // backgroundColor = defaultColor
               // self.layer.borderColor = defaultColor.cgColor
            }
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        self.layer.backgroundColor = UIColor(hex: "EFC849").cgColor

        self.layer.borderColor = UIColor(hex: "EFC849").cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = self.frame.height / 6
        self.clipsToBounds = true
    }
}
