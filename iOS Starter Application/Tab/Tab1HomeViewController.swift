//
//  Tab1HomeViewController.swift
//  iOS Starter Application
//
//  Created by Tuan Pham on 2021/08/10.
//

import UIKit

class Tab1HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style:UIBarButtonItem.Style.done, target: self, action: #selector(didTapMenuButton))
    }
    
    @objc func didTapMenuButton() {
        
        let menuStoryboard = UIStoryboard(name: "Menu", bundle: nil)
        let menuViewController = menuStoryboard.instantiateViewController(withIdentifier:"menuViewController") as? MenuViewController
        
        parent?.addChild(menuViewController!)
        parent?.view.addSubview(menuViewController!.view)
        menuViewController!.didMove(toParent: parent)
        
    }

}
