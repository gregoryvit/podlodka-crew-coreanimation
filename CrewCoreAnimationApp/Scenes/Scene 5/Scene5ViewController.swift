//
//  Scene5ViewController.swift
//  TestCoreAnimationApp
//

import UIKit

class Scene5ViewController: UIViewController {

    let layer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.black.cgColor
        layer.cornerRadius = 50.0
        
        view.layer.addSublayer(layer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layer.position = view.center
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        
    }
    
    func startAnimations() {
        
    }
}
