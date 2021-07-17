//
//  ImageViewExt.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 15/07/2021.
//

import UIKit

extension UIImageView {
    func markCircleAround() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
