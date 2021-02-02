//
//  GradientSwi.swift
//  LoginApp
//
//  Created by Lyubushkin on 02.02.2021.
//

import UIKit
 
@IBDesignable class GraphView: UIView {
 
  //1 - the properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.red
  @IBInspectable var endColor: UIColor = UIColor.green
    override func drawRect(rect: CGRect) {
 
      //2 - get the current context
      let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
 
      //3 - set up the color space
      let colorSpace = CGColorSpaceCreateDeviceRGB()
 
      //4 - set up the color stops
      let colorLocations:[CGFloat] = [0.0, 1.0]
 
      //5 - create the gradient
      let gradient = CGGradientCreateWithColors(colorSpace,
                                                colors as CFArray,
                                                colorLocations)
 
      //6 - draw the gradient
      var startPoint = CGPoint.zeroPoint
      var endPoint = CGPoint(x:0, y:self.bounds.height)
      CGContextDrawLinearGradient(context,
                                  gradient,
                                  startPoint,
                                  endPoint,
                                  0)
    }
}
