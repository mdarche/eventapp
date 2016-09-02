//
//  ProgressView.swift
//  EventApp
//
//  Created by Michael Darche on 8/16/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    private let progressLayer: CAShapeLayer = CAShapeLayer()
    private var innerCircle = UIView()
    private var progressLabel: UILabel
    var activityCount: String?

    
    required init?(coder aDecoder: NSCoder) {
        progressLabel = UILabel()
        super.init(coder: aDecoder)
        createInnerCircle()
        createProgressLayer()
        createLabel()
    }
    
    override init(frame: CGRect) {
        progressLabel = UILabel()
        super.init(frame: frame)
        createProgressLayer()
        createInnerCircle()
        createLabel()
    }
    
    func createLabel() {
        progressLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: innerCircle.frame.width, height: 60))
        progressLabel.textColor = .whiteColor()
        progressLabel.textAlignment = .Center
        progressLabel.text = ""
        progressLabel.font = UIFont(name: "Roboto-Light", size: 42.0)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(progressLabel)
        
        NSLayoutConstraint(item: progressLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: innerCircle, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: progressLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: innerCircle, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0).active = true
    }
    
    func createInnerCircle() {
        innerCircle = UIView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(frame)/2.35, height: CGRectGetHeight(frame)/2.35))
        innerCircle.layer.cornerRadius = innerCircle.frame.width / 2
        innerCircle.backgroundColor = UIColor(white: 1, alpha: 0.04)
        innerCircle.center = CGPoint(x: CGRectGetMidX(self.bounds), y: CGRectGetMidY(self.bounds))
        addSubview(innerCircle)
        
    }
    
    private func createProgressLayer() {
        let startAngle = CGFloat(M_PI_2)
        let endAngle = CGFloat(M_PI * 2 + M_PI_2)
        let centerPoint = CGPoint(x: CGRectGetWidth(frame)/2 , y: CGRectGetHeight(frame)/2)
        
        let gradientMaskLayer = gradientMask()
        progressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: CGRectGetWidth(frame)/2 - 30.0, startAngle:startAngle, endAngle:endAngle, clockwise: true).CGPath
        progressLayer.backgroundColor = UIColor.clearColor().CGColor
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.blackColor().CGColor
        progressLayer.lineWidth = 10.0
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = 0.0
        
        gradientMaskLayer.mask = progressLayer
        layer.addSublayer(gradientMaskLayer)
        self.alpha = 0.0
    }
    
    private func gradientMask() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        gradientLayer.locations = [0.0, 1.0]
        let arrayOfColors: [AnyObject] = [Colors.primaryBlue.CGColor, Colors.accentRed.CGColor]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    func hideProgressView() {
        self.innerCircle.backgroundColor = UIColor(white: 1, alpha: 0)
        progressLayer.strokeEnd = 0.0
        progressLayer.removeAllAnimations()
        progressLabel.text = ""
    }
    
    func animateProgressView() {
        UIView.animateWithDuration(0.9, animations: {
            self.alpha = 1.0
        })
        
        progressLabel.text = ""
        progressLayer.strokeEnd = 0.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = 0.45
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.additive = true
        animation.fillMode = kCAFillModeForwards
        progressLayer.addAnimation(animation, forKey: "strokeEnd")

        progressLayer.shadowColor = UIColor.blackColor().CGColor
        progressLayer.shadowOpacity = 0.2
        progressLayer.shadowOffset = CGSizeZero
        progressLayer.shadowRadius = 4
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        progressLabel.text = "35"
    }
}
