//
//  GradientView.swift
//  LoginApp
//
//  Created by Lyubushkin on 02.02.2021.
//

import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.systemPink.cgColor.alpha, UIColor.systemBlue.cgColor]
    }
}
