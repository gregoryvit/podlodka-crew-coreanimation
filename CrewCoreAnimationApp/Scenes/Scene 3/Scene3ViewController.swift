//
//  Scene3ViewController.swift
//  TestCoreAnimationApp
//

import UIKit

class Scene3ViewController: UIViewController {

    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.black.cgColor
        layer.cornerRadius = 50.0
        
        view.layer.addSublayer(layer)
        
        configureTapGesture()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layer.position = view.center
    }
    
    private func configureTapGesture() {
        let gr = UITapGestureRecognizer(target: self, action: #selector(tapOnScreen))
        view.addGestureRecognizer(gr)
    }

    @objc func tapOnScreen(sender: UITapGestureRecognizer) {
     
        let touchLocation = sender.location(in: view)
        
        let displayLayer = layer.presentation() ?? layer
        if displayLayer.hitTest(touchLocation) != nil {
            
            let resultLayerColor = layer.backgroundColor == UIColor.black.cgColor ? UIColor.red.cgColor : UIColor.black.cgColor

            let bgAnimation = CABasicAnimation(keyPath: "backgroundColor")
           bgAnimation.fromValue = displayLayer.backgroundColor
           bgAnimation.toValue = resultLayerColor
           bgAnimation.duration = 0.5
            
            bgAnimation.delegate = self

            layer.backgroundColor = resultLayerColor
           layer.add(bgAnimation, forKey: "bg")
            
        } else {
            
            let moveAnimation = CABasicAnimation(keyPath: "position")
            moveAnimation.fromValue = displayLayer.position
            moveAnimation.toValue = touchLocation
            moveAnimation.duration = 3.0

            moveAnimation.delegate = self
            
            moveAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            moveAnimation.setValue("move", forKey: "id")
                        
            layer.position = touchLocation
            layer.add(moveAnimation, forKey: "move")
            
        }
        
    }
        
}


extension Scene3ViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        guard let id = anim.value(forKey: "id") as? String else { return }
        
        switch id {
        case "move": print("Animation done!")
        default: break
        }
    }
    
}
