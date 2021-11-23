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
        
        
    }
}
