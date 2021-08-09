//
//  MenuViewController.swift
//  iOS Starter Application
//
//  Created by Tuan Pham on 2021/08/10.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    
    private var isMenuOpenned: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .clear
        
        close(animated: false)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(open), userInfo: nil, repeats: false)
    }
    
    @objc private func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .left {
            close(animated: true)
        }
    }

    @objc private func open() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.menuView.frame.origin.x = 0
        } completion: { [weak self] (completed) in
            self?.isMenuOpenned = true
        }
    }
    
    @objc private func close(animated: Bool) {
        if (animated) {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.menuView.frame.origin.x = -300
            } completion: { [weak self] (completed) in
                self?.isMenuOpenned = false
                self?.removeMe()
            }
        } else {
            self.menuView.frame.origin.x = -300
            self.isMenuOpenned = false
        }
    }
    
}
