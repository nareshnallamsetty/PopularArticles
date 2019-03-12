//
//  CustomButton.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }

}
