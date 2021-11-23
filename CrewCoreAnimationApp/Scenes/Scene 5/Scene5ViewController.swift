//
//  Scene5ViewController.swift
//  TestCoreAnimationApp
//

import UIKit

class Scene5ViewController: UIViewController {

    let layer = CATransformLayer()
    
    private func createCircleLayer(diameter: CGFloat, zPosition: CGFloat) -> CALayer {

        let layer = CAShapeLayer()

        layer.frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        layer.path = UIBezierPath(ovalIn: layer.bounds).cgPath
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.lineWidth = 1.0
        layer.zPosition = zPosition

        return layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        layer.backgroundColor = UIColor.black.cgColor
//        layer.cornerRadius = 50.0
        
//        layer.addSublayer(createCircleLayer(diameter: 100, zPosition: 0))
        
        let diameter = 200.0
        let minZ = -(diameter / 2.0)
        let slices = 20
        let zStep = diameter / Double(slices)

        for idx in 0..<slices {
            let curZ = minZ + zStep * Double(idx)
            
            let normalSlize = curZ / (diameter / 2.0)
            let curDiameter = CGFloat(sqrt(1-normalSlize*normalSlize))
            let resultSize = curDiameter * diameter

            layer.addSublayer(createCircleLayer(diameter: resultSize, zPosition: curZ))
        }
        
        view.layer.addSublayer(layer)
        
        startAnimations()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layer.frame = view.bounds
        
        layer.sublayers?.forEach {
            $0.position = CGPoint(x: layer.bounds.midX, y: layer.bounds.midY)
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        layer.timeOffset = CFTimeInterval(sender.value)
    }
    
    func startAnimations() {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.y")
        animation.values = [
            0.0, CGFloat.pi, 2.0*CGFloat.pi
        ]

        animation.duration = 5.0
        animation.repeatCount = .infinity
        
        layer.speed = 0.0
        layer.add(animation, forKey: "rotate")
    }
}
