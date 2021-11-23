//
//  Scene2ViewController.swift
//  TestCoreAnimationApp
//

import UIKit

class Scene2ViewController: UIViewController {

    let subview = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subview.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        subview.backgroundColor = .black
        
        view.addSubview(subview)
        
        configureTapGesture()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        subview.center = view.center
    }
    
    private func configureTapGesture() {
        let gr = UITapGestureRecognizer(target: self, action: #selector(tapOnScreen))
        view.addGestureRecognizer(gr)
    }

    @objc func tapOnScreen() {
        
        UIView.animate(withDuration: 2.0) {
            self.subview.layer.cornerRadius = 50.0 - self.subview.layer.cornerRadius

            print(self.subview.layer.action(forKey: "cornerRadius") ?? "Nil")
        }
        
        
    
        
    }

}
