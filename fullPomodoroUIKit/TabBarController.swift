//
//  TabBarController.swift
//  fullPomodoroUIKit
//
//  Created by Тулеби Берик on 07.05.2023.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .white
        tabBar.tintColor = .white
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            wrapInNavigationController(with: HomeView(), tabTitle: "Home", tabImage: UIImage(named: "home")!),
            wrapInNavigationController(with: SettingsView(), tabTitle: "Settings", tabImage: UIImage(named: "settings")!),
            wrapInNavigationController(with: HistoryView(), tabTitle: "History", tabImage: UIImage(named: "history")!),
        ]
    }

    func wrapInNavigationController(with rootViewController: UIViewController,
                                    tabTitle: String,
                                    tabImage: UIImage) -> UINavigationController
    {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.tabBarItem.image = tabImage
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationController?.title = tabTitle
        return navigationController
    }
}
