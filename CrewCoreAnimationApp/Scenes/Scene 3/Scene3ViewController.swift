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
                
    }
        
}
