//
//  ViewController.swift
//  Example
//
//  Created by Jorge Ouahbi on 18/08/2020.
//  Copyright © 2020 Jorge Ouahbi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var tooltip: OMBubbleTextView!

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tooltip = OMBubbleTextView()
        tooltip.frame = CGRect(x: view.center.x - 200 * 0.5,
                               y: view.center.y - 100 * 0.5,
                               width: 200,
                               height: 100)
        tooltip.alpha = 1.0
        tooltip.textAlignment = .center
        tooltip.textColor = .black
        tooltip.layer.cornerRadius = 6
        tooltip.layer.masksToBounds = true
        tooltip.backgroundColor = .clear
        tooltip.layer.borderColor = UIColor.clear.cgColor
        tooltip.layer.borderWidth = 0
        // Shadow
        tooltip.layer.shadowColor   = UIColor.black.cgColor
        tooltip.layer.shadowOffset  = CGSize(width: 0, height: 2)
        tooltip.layer.shadowOpacity = 0.7
        tooltip.layer.shadowRadius  = 3.0
        self.view.addSubview(tooltip)
        
        tooltip.string = """
        
        The problem is that you are not resizing
        
        """
        
        
        
    }
    func locationFromTouch(_ touches: Set<UITouch>) -> CGPoint {
        if let touch = touches.first {
            return touch.location(in: self.view)
        }
        return .zero
    }
    
    func centerLocationXFromTouch(_ touches: Set<UITouch>) -> CGPoint {
        if let touch = touches.first {
            let location =  touch.location(in: self.view)
            return CGPoint(x: (location.x - tooltip.bounds.width / 2),
                           y: (location.y - tooltip.bounds.size.height))
        }
        return .zero
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches , with: event)
        let location: CGPoint = centerLocationXFromTouch(touches)
        
        self.view.animatePrespective(layer: tooltip.layer)
        tooltip.shakeGrow(duration: 2)
                tooltip.displayTooltip(location)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches , with: event)
        let location: CGPoint = centerLocationXFromTouch(touches)
        tooltip.hideTooltip(location)
        tooltip.shakeGrow(duration: 2)
        
        self.view.animatePrespective(layer: tooltip.layer)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches , with: event)
        let location: CGPoint = centerLocationXFromTouch(touches)
        tooltip.moveTooltip(location)
        tooltip.shakeGrow(duration: 2)
        self.view.animatePrespective(layer: tooltip.layer)
    }
}
