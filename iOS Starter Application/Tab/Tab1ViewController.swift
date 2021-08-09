//
//  Tab1ViewController.swift
//  iOS Starter Application
//
//  Created by Tuan Pham on 2021/08/10.
//

import UIKit

class Tab1ViewController: UIViewController {

    private var isMenuOpened: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tabStoryboard = UIStoryboard(name: "Tab", bundle: nil)
        let tab1HomeViewController = (tabStoryboard.instantiateViewController(withIdentifier:"tab1HomeViewController") as? Tab1HomeViewController)!
        let nc = UINavigationController(rootViewController: tab1HomeViewController)
        addChild(nc)
        view.addSubview(nc.view)
        nc.didMove(toParent: self)
    }

}
