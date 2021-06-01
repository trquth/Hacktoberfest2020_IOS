//
//  ScrollViewNotCoveredByKeyboardVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 23/01/2021.
//

import UIKit

class ScrollViewNotCoveredByKeyboardVC: UIViewController {

    @IBOutlet weak var sv: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sv.contentSize = CGSize(width: 1, height: 200)
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
