//
//  Scene1ViewController.swift
//  TestCoreAnimationApp
//

import UIKit

class Scene1ViewController: UIViewController {

    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.black.cgColor
        
        view.layer.addSublayer(layer)
        
        let gr = UITapGestureRecognizer(target: self, action: #selector(tapOnScreen))
        view.addGestureRecognizer(gr)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layer.position = view.center
    }

    @objc func tapOnScreen() {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(3.0)
        CATransaction.setCompletionBlock {
            print("Done!")
        }
        
        layer.cornerRadius = 50.0 - layer.cornerRadius
        
        print(layer.action(forKey: "cornerRadius") ?? "Nil")
        
        CATransaction.commit()
        
    }
}
