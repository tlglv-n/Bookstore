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

        if let viewControllers = viewControllers {
            viewControllers[0].tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
            viewControllers[1].tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
