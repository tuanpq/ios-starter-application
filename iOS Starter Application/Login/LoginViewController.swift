//
//  LoginViewController.swift
//  iOS Starter Application
//
//  Created by Tuan Pham on 2021/08/10.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        let tabStoryboard = UIStoryboard(name: "Tab", bundle: nil)
        let tabViewContainerController = tabStoryboard.instantiateViewController(withIdentifier:"tabViewContainerController") as! TabViewContainerController
        parent?.addChild(tabViewContainerController)
        parent?.view.addSubview(tabViewContainerController.view)
        tabViewContainerController.didMove(toParent: self)
        
        removeMe()
    }
}
