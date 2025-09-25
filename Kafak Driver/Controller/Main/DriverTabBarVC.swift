//
//  DriverTabBarVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 12/08/24.
//

import UIKit

class DriverTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
//        updateTabBarTitles()
    }
    
    private func updateTabBarTitles() {
        // Assuming tab at index 1 is the one you want to update
        if let viewControllers = self.viewControllers {
            let vC0 = viewControllers[0]
            let vC1 = viewControllers[1]
            let vC2 = viewControllers[2]
            if L102Language.currentAppleLanguage() == "en" {
                vC0.tabBarItem.title = "Home"
                vC1.tabBarItem.title = "Notifications"
                vC2.tabBarItem.title = "Settings"
            } else if L102Language.currentAppleLanguage() == "ar" {
                vC0.tabBarItem.title = "الرئيسية"
                vC1.tabBarItem.title = "الإشعارات"
                vC2.tabBarItem.title = "الإعدادات"
            } else {
                vC0.tabBarItem.title = "گھر"
                vC1.tabBarItem.title = "اطلاعات"
                vC2.tabBarItem.title = "سیٹنگز"
            }
        }
    }
}
