//
//  MainViewController.swift
//  SnapChatDemo
//
//  Created by Prashant on 10/08/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,ScrollVIewControllerDelegate {
 
    

    //MARK:- Outlets
    
    @IBOutlet weak var contentView: NavigationView!
    
    //MARK:- Var
    
    var scrollViewController:ScrollViewController!
    
    lazy var lensViewController:LensVIewController = {
        return LensVIewController.viewController()
    }()
    lazy var chatViewController:ChatViewController = {
        return ChatViewController.viewController()
    }()
    
    lazy var discoverViewController:DiscoverViewController = {
        return DiscoverViewController.viewController()
    }()
    
    
    //--------------------------------------------------------------------------------
    
    //MARK:- Memory Managment Methods
    
    //--------------------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    //--------------------------------------------------------------------------------
    
    //MARK:-  Navigation Methdos
    
    //--------------------------------------------------------------------------------

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ScrollViewController {
            scrollViewController = controller
            scrollViewController.delegate = self
        }
        
    }
    
    //--------------------------------------------------------------------------------
    
    //MARK:-  ScrollVIewControllerDelegate Methdos
    
    //--------------------------------------------------------------------------------

    func viewControllers() -> [UIViewController?] {
        return [chatViewController,lensViewController,discoverViewController]
    }
    
    func initalViewController() -> UIViewController {
        return lensViewController
    }
    
    func scrollViewDidScroll() {
        let offet = scrollViewController.scrollView.contentOffset.x
        let maxOffset = scrollViewController.scrollView.frame.width
        
        let percentage = offet / maxOffset - 1
        self.contentView.animate(per:percentage)
        print(percentage)
        
    }
    
    //--------------------------------------------------------------------------------
    
    //MARK:- ViewLifeCycle Methods
    
    //--------------------------------------------------------------------------------
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //--------------------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //--------------------------------------------------------------------------------
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    

}
