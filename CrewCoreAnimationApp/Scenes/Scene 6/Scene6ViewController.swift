//
//  Scene6ViewController.swift
//  CrewCoreAnimationApp
//

import UIKit

class Scene6ViewController: UIViewController {

    let layer = CAShapeLayer()
    
    lazy var replicatorLayer: CAReplicatorLayer = {
       
        let layer = CAReplicatorLayer()
       layer.frame = view.bounds
       layer.backgroundColor = UIColor.clear.cgColor
       layer.instanceDelay = 0.1
       layer.instanceCount = 60

        let angle = CGFloat((6 * 360 / layer.instanceCount)) * CGFloat.pi / 180.0
       layer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)

       return layer
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        layer.frame = CGRect(x: 0, y: 0, width: 40.0, height: 40.0)
        layer.backgroundColor = UIColor.black.cgColor
        layer.cornerRadius = 20.0
        
        layer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        
        replicatorLayer.addSublayer(layer)
        
        view.layer.addSublayer(replicatorLayer)
        
        configureTapGesture()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        replicatorLayer.frame = view.bounds
        layer.position = CGPoint(x: replicatorLayer.bounds.midX + layer.bounds.width ,y: replicatorLayer.bounds.midY)
    }
    
    private func configureTapGesture() {
        let gr = UITapGestureRecognizer(target: self, action: #selector(tapOnScreen))
        view.addGestureRecognizer(gr)
    }
    
    @objc func tapOnScreen(sender: UITapGestureRecognizer) {
        
        let moveAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        moveAnimation.fromValue = 0.0
        moveAnimation.toValue = 200.0
        
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.values = [0.0, 1.0, 1.0, 1.0, 0.0]
        
        let group = CAAnimationGroup()
        
        group.animations = [moveAnimation, scaleAnimation]
        group.duration = 5.0
        group.repeatCount = .infinity
        group.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        layer.add(group, forKey: "scale")
        
    }


}
