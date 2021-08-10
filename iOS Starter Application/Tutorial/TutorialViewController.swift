//
//  TutorialViewController.swift
//  iOS Starter Application
//
//  Created by Tuan Pham on 2021/08/10.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var tutorialTitle: UILabel!
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tutorialTitle.text = "Tutorial \(index + 1)"
    }
    
}
