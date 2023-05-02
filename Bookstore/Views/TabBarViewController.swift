//
//  TabBarViewController.swift
//  Bookstore
//
//  Created by Nurikk T. on 16.04.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers?.forEach(setBookStore(on:))
        delegate = self
    }
    

}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        _ = (viewController as? SearchViewController)?.focusSearchBar()
    }
}
