//
//  ScrollViewController.swift
//  SnapChatDemo
//
//  Created by Prashant on 10/08/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit


protocol ScrollVIewControllerDelegate:class {
    
    func viewControllers () -> [UIViewController?]
    func initalViewController () -> UIViewController
    func scrollViewDidScroll()
}


class ScrollViewController: UIViewController {

    //MARK:- Outlets
    
    
    //MARK:- Var
    
    var delegate:ScrollVIewControllerDelegate? = nil
    var viewControllers:[UIViewController?]!
    var scrollView:UIScrollView!
    //--------------------------------------------------------------------------------
    
    //MARK:- Memory Managment Methods
    
    //--------------------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //--------------------------------------------------------------------------------
    
    //MARK:- ViewLifeCycle Methods
    
    //--------------------------------------------------------------------------------
    
    
    override func loadView() {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        self.scrollView = scrollView
        scrollView.backgroundColor = .clear
        self.view = scrollView
    }
    
    //--------------------------------------------------------------------------------

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //--------------------------------------------------------------------------------
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewControllers = self.delegate?.viewControllers()
        
        for (index,vc) in viewControllers.enumerated() {
            guard let vc = vc else {continue}
            self.addChildViewController(vc)
            scrollView.addSubview(vc.view)
            vc.view.frame = CGRect(x: scrollView.frame.size.width * CGFloat(index), y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
            vc.didMove(toParentViewController: self)
        }
        scrollView.contentSize = CGSize(width: CGFloat(viewControllers.count) * scrollView.frame.size.width, height: scrollView.frame.height)
        
        if let viewController = self.delegate?.initalViewController() {
            self.setViewController(viewController: viewController)
        }
    }
    
    //--------------------------------------------------------------------------------

    func setViewController(viewController:UIViewController) {
        guard let index = viewControllers.index(where: {$0 == viewController}) else {return}
        
        let contentOfsset = CGPoint(x: scrollView.frame.width * CGFloat(index), y: 0)
        scrollView.contentOffset = contentOfsset
        
    }
    
    //--------------------------------------------------------------------------------
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    
    
}

extension ScrollViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.delegate?.scrollViewDidScroll()
    }
}

