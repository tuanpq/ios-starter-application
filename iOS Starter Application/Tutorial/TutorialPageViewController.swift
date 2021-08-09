//
//  TutorialPageViewController.swift
//  iOS Starter Application
//
//  Created by Tuan Pham on 2021/08/10.
//

import UIKit

class TutorialPageViewController: UIViewController {

    @IBOutlet weak var skipStartButton: UIButton!
    
    private var pageViewController: UIPageViewController?
    private var pageControl: UIPageControl? = nil
    private let numberOfPages: Int = 3
    private var currentlyShowingIndex = 0
    private var isInitialized: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pageViewController = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        pageViewController!.dataSource = self
        pageViewController!.delegate = self
        
        let firstTutorial = self.viewControllerAtIndex(index: 0)
        let viewControllers: [TutorialViewController] = [firstTutorial]
        pageViewController!.setViewControllers(viewControllers, direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        
        addChild(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParent: self)
        
        setTitleForButton()
    }
    
    private func setTitleForButton() {
        skipStartButton.setTitle((currentlyShowingIndex != (numberOfPages - 1)) ? "Skip" : "Start", for: UIControl.State.normal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let subViews = view.subviews
        var scrollView: UIScrollView? = nil
        
        for view in subViews {
            if (view as AnyObject).isKind(of: UIScrollView.self) {
                scrollView = view as? UIScrollView
            } else if (view as AnyObject).isKind(of: UIPageControl.self) {
                if (!isInitialized) {
                    pageControl = view as? UIPageControl
                    pageControl?.numberOfPages = numberOfPages
                    pageControl?.currentPage = 0
                    pageControl?.pageIndicatorTintColor = .lightGray
                    pageControl?.currentPageIndicatorTintColor = .blue
                    
                    isInitialized = true
                }
            }
        }
        
        if (scrollView != nil && pageControl != nil) {
            scrollView?.frame = view.bounds
            view.bringSubviewToFront(pageControl!)
        }
        
        view.bringSubviewToFront(skipStartButton)
    }

    func viewControllerAtIndex(index: Int) -> TutorialViewController {
        let tutorialStoryboard = UIStoryboard.init(name: "Tutorial", bundle: nil)
        
        if let tutorialViewController = tutorialStoryboard.instantiateViewController(withIdentifier: "tutorialViewController") as? TutorialViewController {
            tutorialViewController.index = index
            return tutorialViewController
        }
            
        return TutorialViewController()
    }
    
    @IBAction func didTapSkipStartButton(_ sender: Any) {
        // Go to Login/Register screen
        let loginStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
        if let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "loginViewController") as? LoginViewController {
            
            parent?.addChild(loginViewController)
            parent?.view.addSubview(loginViewController.view)
            loginViewController.didMove(toParent: parent)

            removeMe()
        }
    }
    
}

extension TutorialPageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? TutorialViewController {
            var index = viewController.index
            if index == 0 {
                return nil
            }
            index += -1
            currentlyShowingIndex = index
            
            return self.viewControllerAtIndex(index: index)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? TutorialViewController {
            var index = viewController.index
            index += 1
            if index == numberOfPages {
                return nil
            }
            
            currentlyShowingIndex = index
                    
            return self.viewControllerAtIndex(index: index)
        }
                
        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return numberOfPages
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentlyShowingIndex
    }
    
}

extension TutorialPageViewController : UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        print("\(#file), \(#function), \(#line)")
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let tutorialViewController = pageViewController.viewControllers![0] as! TutorialViewController
        self.pageControl?.currentPage = tutorialViewController.index
        setTitleForButton()
    }
    
}
