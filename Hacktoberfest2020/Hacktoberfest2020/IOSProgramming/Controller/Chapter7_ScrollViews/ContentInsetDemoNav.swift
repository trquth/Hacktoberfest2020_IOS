//
//  ContentInsetDemoNav.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 01/04/2021.
//

import UIKit

class ContentInsetDemoNav: UINavigationController {

    override open var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }

}
