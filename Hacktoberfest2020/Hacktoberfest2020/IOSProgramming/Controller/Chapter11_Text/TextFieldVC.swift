//
//  TextFieldVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 16/01/2021.
//

import UIKit

class TextFieldVC: UIViewController {

    @IBOutlet weak var tf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Text Field"
        
        let image = UIImage(named: "oneBlueCircle.png")
        let size = CGSize(16, 16)
        let r = UIGraphicsImageRenderer(size: size)
        let im2 = r.image{
            _ in image?.draw(in: CGRect(origin: .zero, size: size))
        }
        
        tf.leftView = UIImageView(image: im2)
        tf.leftViewMode = .always
        tf.leftViewMode = .whileEditing
        tf.leftViewMode = .unlessEditing
        tf.clearButtonMode = .whileEditing
        
        tf.keyboardType = .numberPad
        tf.allowsEditingTextAttributes = true
        tf.text = "Howdy there"
        //tf.clearsOnBeginEditing = true
        //tf.clearsOnInsertion = true
        
        tf.borderStyle = .line
        tf.background = UIImage(named: "yellowsilk4")
        
        do{
            let r = UIGraphicsImageRenderer(size: size)
            let im2 = r.image {
                ctx in ctx.cgContext.strokeEllipse(in: CGRect(origin: .zero, size: size))
            }
            tf.background = im2.resizableImage(withCapInsets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        
    }
}
