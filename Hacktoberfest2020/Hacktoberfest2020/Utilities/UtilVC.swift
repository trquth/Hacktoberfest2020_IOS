//
//  File.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 16/07/2021.
//

import Foundation
import SwiftLoader

class UtilVC {
    static let instance = UtilVC()
    
    
    func showActivityIndicator(){
        showActivityIndicator(title: "Searching...")
    }
    
    func showActivityIndicator(title: String, color: UIColor = UIColor.darkGray){
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 170
        config.backgroundColor = color.withAlphaComponent(0.5)
        config.spinnerColor = UIColor.colorWithHexString(hexValue: INDICATOR)
        config.titleTextColor = UIColor.colorWithHexString(hexValue: INDICATOR)
        config.spinnerLineWidth = 2.0
        config.cornerRadius =  30
        SwiftLoader.setConfig(config: config)
        SwiftLoader.show(title: title, animated: true)
    }
    
    func hideActivityIndicator(){
        SwiftLoader.hide()
    }
    
    func showMessage(viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Vivira", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        viewController.present(alert, animated: true){}
    }
    
    func showMessage(viewController: UIViewController, message: String, okHandler:@escaping () -> Void) {
        let alert = UIAlertController(title: "Vivira", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            okHandler()
        }))
        viewController.present(alert, animated: true){}
    }
}
