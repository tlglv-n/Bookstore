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
//        delegate = self
    }
    
    private func setBookStore(on viewController: UIViewController) {
        _setBookStore(on: viewController)
        viewController.children.forEach(_setBookStore(on:))
    }
    
    private func _setBookStore(on viewController: UIViewController) {
        (viewController as? BookStoreView)?.set(ITBookStoreService())
    }
}

//extension TabBarViewController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//
//        _ = (viewController as? SearchViewController)?.focusSearchBar()
//    }
//}
