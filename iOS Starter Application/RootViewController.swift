//
//  ViewController.swift
//  iOS Starter Application
//
//  Created by Tuan Pham on 2021/08/10.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tutorialStoryboard = UIStoryboard(name: "Tutorial", bundle: nil)
        let tutorialPageViewController = tutorialStoryboard.instantiateViewController(withIdentifier:"tutorialPageViewController") as! TutorialPageViewController
        addChild(tutorialPageViewController)
        view.addSubview(tutorialPageViewController.view)
        tutorialPageViewController.didMove(toParent: self)
    }
    
}

