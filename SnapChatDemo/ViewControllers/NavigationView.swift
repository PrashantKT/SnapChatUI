//
//  NavigationView.swift
//  SnapChatDemo
//
//  Created by Prashant on 28/08/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class NavigationView: UIView {

    
    @IBOutlet private  var centerVeiw:UIView!
    @IBOutlet private  var centerVeiwInner:UIView!
    @IBOutlet private  var centerVeiwInnerWhite:UIView!

    @IBOutlet private var const_width_centerView:NSLayoutConstraint!
    @IBOutlet private var const_bottom_centerView:NSLayoutConstraint!

    
    @IBOutlet private  var leftView:UIView!
    @IBOutlet private  var leftViewInner:UIView!
    @IBOutlet private  var leftViewInnerWhite:UIView!

    @IBOutlet private var const_width_leftView:NSLayoutConstraint!
    @IBOutlet private var const_bottom_leftView:NSLayoutConstraint!
    @IBOutlet private var const_centerX_leftView:NSLayoutConstraint!

    
    @IBOutlet private  var rightView:UIView!
    @IBOutlet private  var rightViewInner:UIView!
    @IBOutlet private  var rightViewInnerWhite:UIView!

    @IBOutlet private var const_centerX_rightVIew:NSLayoutConstraint!
//    @IBOutlet private var const_width_rightView:NSLayoutConstraint!
//    @IBOutlet private var const_bottom_rightView:NSLayoutConstraint!

    
    @IBOutlet private  var indicator:UIView!

    //center view
    lazy var centerViewBottomConst  = {
        return const_bottom_centerView.constant
    }()
    
   
   
    lazy var centerViewWidthConst  = {
        return const_width_centerView.constant
    }()
    
    //leftview
    lazy var leftViewBottomConst  = {
        return const_bottom_leftView.constant
    }()
    
  
    
    lazy var leftViewWidthConst  = {
        return const_width_leftView.constant
    }()
    
//    //rightView
//    lazy var rightViewBottomConst  = {
//        return const_bottom_rightView.constant
//    }()
//
//    lazy var rightViewHeightConst  = {
//        return const_height_rightView.constant
//    }()
//
//    lazy var rightViewWidthConst  = {
//        return const_width_rightView.constant
//    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view =  super.hitTest(point, with: event)
        
        return view == self ? nil : view
    }

    
    func animate(per:CGFloat) {
        let offset = abs(per)
        animateColors(offset)
        animateBottomSpace(offset)
        animateSize(offset)
        animatePosition(offset)
    }
    
    func animateBottomSpace(_ per:CGFloat) {
        let minDistance:CGFloat = 25
        let distance = centerViewBottomConst - minDistance
        let valueToChanged = distance * per
        self.const_bottom_centerView.constant  = centerViewBottomConst -  valueToChanged
        
        let minDistanceLeftButton:CGFloat = 20
        let distanceLeftButton = leftViewBottomConst - minDistanceLeftButton
        let valueChangedLeftButton = distanceLeftButton * per
        self.const_bottom_leftView.constant = leftViewBottomConst - valueChangedLeftButton
        
    }
    
    func animateColors (_ offset:CGFloat) {
        let alpha =  1 - offset
        centerVeiwInnerWhite.alpha = alpha
        centerVeiwInner.alpha = offset

        leftViewInnerWhite.alpha = alpha
        leftViewInner.alpha = offset

        rightViewInnerWhite.alpha = alpha
        rightViewInner.alpha = offset

    }
    
    func animateSize(_ per:CGFloat) {
        let distance = centerViewWidthConst * 0.5
        let valueToChanged = distance * per
        self.const_width_centerView.constant  = centerViewWidthConst -  valueToChanged

        
        let distanceLeft = leftViewWidthConst * 0.5
        let valueToChangedLeft = distanceLeft * per
        self.const_width_leftView.constant  = leftViewWidthConst -  valueToChangedLeft

        
    }
    
    func animatePosition (_ offset:CGFloat) {
        let originalMultiplier = const_centerX_leftView.multiplier * bounds.width * 0.5
        let newMultiplier = (bounds.width * 0.54 * 0.5) - originalMultiplier
        const_centerX_leftView.constant = newMultiplier * offset
        const_centerX_rightVIew.constant = -newMultiplier * offset
    }
    
}
