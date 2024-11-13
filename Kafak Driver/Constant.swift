//
//  Constant.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 09/08/24.
//

import Foundation
import UIKit

struct k {
    
    static let appName                          =   "Kafak"
    static var iosRegisterId                    =   "123456"
    static let emptyString                      =   ""
    static let userDefault                      =   UserDefaults.standard
    static let userType                         =   "CLIENT"
    static let screenSize                       =   UIScreen.main.bounds
    static let currency                         =   "AED"
    static let themeColor                       =   "#5E2F7F"
    
    static let milesToMeter                     =   1609.34
    
    struct languages {
        struct english {
            static let urlTermsCondition        =   ""
            static let urlPrivacyPolicy         =   ""
            static let urlAboutus               =   ""
            static let urlhelp                  =   ""
        }
    }
    
    struct session {
        static let status                       =   "status"
        static let userId                       =   "user_id"
        static let userName                     =   "user_name"
        static let userEmail                    =   "user_email"
        static let userMobile                   =   "user_mobile"
        static let userType                     =   "user_type"
        static let userAddress                  =   ""
        static let stripeCustomerId             =   "stripe_customer_id"
        static let catShortCode                 =   "service_type"
        static let onlineStatus                 =   "online_status"
        static let categoryId                   =   "category_id"
        static let subCategoryId                =   "sub_cat_id"
        static let userImage                    =   "user_image"
        
        static let ads                          =   "ad"
        static let gambling                     =   "gambling"
        static let malware                      =   "malware"
        static let phishing                     =   "phishing"
        static let spyware                      =   "spyware"
        static let cartCatId                    =   "cartCatId"
        static let language                     =   "language"
    }
    
    struct google {
        static let googleApiKey                 =   "AIzaSyDnC9SccSvyLA5Hi6jvwX-by7l-kSi6BSg"
        static let googleClientId               =   ""
    }
    
    struct facebook {
        static let facebookId                   =   ""
    }
    
    struct sinch {
        static let sinchApplicationKey          =   ""
        static let sinchSecretKey               =   ""
        static let sinchHost                    =   ""
    }
    
    struct paypal {
        static let paypalClientId               =   ""
        static let sandboxAccount               =   ""
    }
    
    struct stripe {
        static let publisherKey                 =   "pk_test_itJKubyhNHEbYnr14cuuPZCh"
    }
    
    struct postCode {
        static let key                          =   "ak_k2ltpogjzBnjbH3DnVjHmZS5e1Ick"
    }
    
    static var menuWidth: CGFloat               =   0.0
    static var topMargin: CGFloat               =   0.0
}
