//
//  Scene4ViewController.swift
//  TestCoreAnimationApp
//

import UIKit

class Scene4ViewController: UIViewController {

    let layer = CALayer()
    
    let trajectoryLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
            
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 3.0
        layer.opacity = 0.3
        layer.lineCap = .round
        
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        layer.backgroundColor = UIColor.black.cgColor
//        layer.cornerRadius = 50.0
        
        layer.contents = UIImage(named: "podlodka")?.cgImage
        layer.contentsGravity = .resizeAspect
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.7)
        
        view.layer.addSublayer(trajectoryLayer)
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

    private func randomPoint() -> CGPoint {
        let x = CGFloat.random(in: 0...view.frame.maxX)
        let y = CGFloat.random(in: 0...view.frame.maxY)
        return CGPoint(x: x, y: y)
    }
    
    @objc func tapOnScreen(sender: UITapGestureRecognizer) {
        
        let touchLocation = sender.location(in: view)
        
        let displayLayer = layer.presentation() ?? layer
        
        let points = [
            displayLayer.position,
            randomPoint(),
            randomPoint(),
            randomPoint(),
            touchLocation
        ]
        
        let path: UIBezierPath = {
            let path = UIBezierPath()

            guard let firstPoint = points.first else {
                return path
            }

            path.move(to: firstPoint)
            points.suffix(from: 1).forEach {
                path.addLine(to: $0)
            }

            return path
        }()
        
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        
        moveAnimation.path = path.cgPath
        moveAnimation.rotationMode = .rotateAuto
        
        moveAnimation.duration = 3.0

        moveAnimation.delegate = self
        
        moveAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        moveAnimation.setValue("move", forKey: "id")
        
        layer.position = touchLocation
        layer.add(moveAnimation, forKey: "move")
        
        //
        
        trajectoryLayer.path = path.cgPath
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.duration = 1.5
        trajectoryLayer.add(pathAnimation, forKey: nil)
        
        let fadeAnimation = CABasicAnimation(keyPath: "strokeStart")
        fadeAnimation.fromValue = 0.0
        fadeAnimation.toValue = 1.0
        fadeAnimation.duration = 1.5
        fadeAnimation.beginTime = CACurrentMediaTime() + pathAnimation.duration
        trajectoryLayer.add(fadeAnimation, forKey: nil)
            
        
    }

}


extension Scene4ViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        trajectoryLayer.path = nil
    }
    
}
