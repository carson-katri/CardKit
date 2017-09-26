//
//  CardView.swift
//  CardKit
//
//  Created by Carson Katri on 9/25/17.
//  Copyright © 2017 Carson Katri. All rights reserved.
//

import UIKit

@IBDesignable public class CardView: UIView {
    @IBInspectable public var corner: Double = 20.0 {
        didSet {
            self.layer.cornerRadius = CGFloat(corner)
            self.layer.shadowRadius = CGFloat(corner)
        }
    }
    @IBInspectable public var shadow: Double = 0.2 {
        didSet {
            self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.layer.shadowOpacity = Float(shadow / 10)
            self.layer.shadowRadius = CGFloat(self.corner)
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            addShadow()
        }
    }
    public var blur: CardBlur = .none
    
    public var blurView: UIVisualEffectView = UIVisualEffectView()
    
    var shadowView: UIView = UIView()
    
    var tapped: (() -> ())? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, corner: Double, shadow: Double) {
        super.init(frame: frame)
        
        self.corner = corner
        self.shadow = shadow
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupCard()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setupCard() {
        self.clipsToBounds = true
        
        self.layer.cornerRadius = CGFloat(corner)
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        
        addBlur()
        addShadow()
        detectTap()
    }
    
    func addBlur() {
        // BLUR
        var blurEffect: UIBlurEffect? = nil
        switch blur {
        case .none:
            // No blur
            break
        case .light:
            // Light blur
            blurEffect = UIBlurEffect(style: .light)
            break
        case .dark:
            // Light blur
            blurEffect = UIBlurEffect(style: .dark)
            break
        case .extraLight:
            // Light blur
            blurEffect = UIBlurEffect(style: .extraLight)
            break
        }
        
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.frame
        blurView.bounds = self.bounds
        blurView.layer.cornerRadius = CGFloat(corner)
        blurView.clipsToBounds = true
        self.superview?.insertSubview(blurView, belowSubview: self)
        
        if blurEffect != nil {
            self.backgroundColor = .clear
        }
    }
    
    func addShadow() {
        // If there is a blur, then the shadow isn't shown
        if blur == .none {
            shadowView = UIView(frame: self.frame)
            shadowView.bounds = self.bounds
            shadowView.backgroundColor = .white
            
            shadowView.clipsToBounds = false
            shadowView.layer.masksToBounds = false
            
            shadowView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            shadowView.layer.shadowOpacity = Float(shadow / 10)
            shadowView.layer.shadowRadius = CGFloat(self.corner)
            shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
            
            shadowView.layer.cornerRadius = CGFloat(corner)
            
            self.superview?.insertSubview(shadowView, belowSubview: self)
        } else {
            shadowView.backgroundColor = .clear
        }
    }
    
    func detectTap() {
        // Add gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(detectedTouch(sender:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func detectedTouch(sender: UIGestureRecognizer) {
        if tapped != nil {
            tapped!()
        }
    }
}

// CARD BLUR:
public enum CardBlur: Int {
    case none = 0
    case light = 1
    case dark = 2
    case extraLight = 3
}
