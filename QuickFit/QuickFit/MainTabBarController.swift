//
//  MainTabBarController.swift
//  QuickFit
//
//  Created by Adam Abukhdair on 7/16/24.
//
import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let workoutsVC = WorkoutsViewController()
        let customTimerVC = CustomTimerViewController()
        let settingsVC = SettingsViewController()

        workoutsVC.title = "Workouts"
        customTimerVC.title = "Custom Timer"
        settingsVC.title = "Settings"

        let workoutsNav = UINavigationController(rootViewController: workoutsVC)
        let customTimerNav = UINavigationController(rootViewController: customTimerVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)

        self.setViewControllers([workoutsNav, customTimerNav, settingsNav], animated: false)

        guard let items = self.tabBar.items else { return }

        let images = ["house", "timer", "gear"]

        for (index, item) in items.enumerated() {
            item.image = UIImage(systemName: images[index])
        }
    }
}
