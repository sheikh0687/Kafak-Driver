//
//  Switcher.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 10/09/24.
//

import Foundation

class Switcher {
    
    static func updateRootVC()
    {
        let status = k.userDefault.bool(forKey: k.session.status)
        
        if status == true {
            let mainViewController = Kstoryboard.instantiateViewController(withIdentifier: "DriverTabBarVC") as! DriverTabBarVC
            let vC = UINavigationController(rootViewController: mainViewController)
            kAppDelegate.window?.rootViewController = vC
            kAppDelegate.window?.makeKeyAndVisible()
        } else {
            if isLogout {
                let mainViewController = Kstoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                let vC = UINavigationController(rootViewController: mainViewController)
                kAppDelegate.window?.rootViewController = vC
                kAppDelegate.window?.makeKeyAndVisible()
            } else {
                let mainViewController = Kstoryboard.instantiateViewController(withIdentifier: "LandingVC") as! LandingVC
                let vC = UINavigationController(rootViewController: mainViewController)
                kAppDelegate.window?.rootViewController = vC
                kAppDelegate.window?.makeKeyAndVisible()
            }
        }
    }
}
