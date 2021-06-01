//
//  SizingLabelVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 15/01/2021.
//

import UIKit

func lend<T> (closure:(T)->()) -> T where T:NSObject {
    let orig = T()
    closure(orig)
    return orig
}

class SizingLabelVC: UIViewController {

    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var lab1: UILabel!
    @IBOutlet weak var lab2: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let att = self.theLabel.attributedText?.mutableCopy() as! NSMutableAttributedString
//        att.addAttribute(.paragraphStyle, value: lend {
//            (para : NSMutableParagraphStyle) in
//            para.headIndent = 20
//            para.firstLineHeadIndent = 20
//            para.tailIndent = -20
//
//        } , range: NSMakeRange(0, 1))
        //self.theLabel.attributedText = att
        self.theLabel.sizeToFit()
        
        delay(2){
            self.updateSomething()
        }
    }
    
    func updateSomething() {
        let s2 = """
            Fourscore and seven years ago, our fathers brought forth \
            upon this continent a new nation, conceived in liberty and \
            dedicated to the proposition that all men are created equal.
            """
        let att2  = NSMutableAttributedString(string: s2, attributes: [
            .font : UIFont(name: "HoeflerText-Black", size: 16)
        ])
        att2.addAttribute(.paragraphStyle, value: lend{
            (para : NSMutableParagraphStyle) in
            para.headIndent = 10
            para.firstLineHeadIndent = 10
            para.tailIndent = 10
        }, range: NSMakeRange(0, 1))
        lab1.attributedText = att2
        lab2.attributedText = att2
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.navigationItem.title = "Sizing Label"
//
//        let s = "This is some text that is too small for its labelThis is some text that is too small for its label"
//        let label = UILabel(frame: CGRect(x: 25, y: 123, width: 300, height: 122))
//        label.backgroundColor = .yellow
//        self.view.addSubview(label)
//        label.numberOfLines = 2
//
//
//        label.attributedText = NSMutableAttributedString(string: s, attributes: [.foregroundColor: UIColor.black])
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s2 = """
            Fourscore and seven years ago, our fathers brought forth \
            upon this continent a new nation, conceived in liberty and \
            dedicated to the proposition that all men are created equal.
            """
        let att = NSMutableAttributedString(string: s2, attributes: [.font : UIFont(name:"HoeflerText-Black", size:16)])
        att.addAttributes([.font : UIFont(name:"HoeflerText-Black", size:24)
        ], range: NSMakeRange(0, 1))
        
//        att.addAttribute(.paragraphStyle, value: lend {
//            (para : NSMutableParagraphStyle) in
//            para.headIndent = 20
//            para.firstLineHeadIndent = 30
//            para.tailIndent = -20
//            para.lineBreakMode = .byWordWrapping
//            para.alignment = .justified
//            para.lineHeightMultiple = 1.2
//        }, range: NSMakeRange(0, 1))
        
        let label = UILabel()
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat:
                "H:|-[v(280)]",
                metrics: nil, views: ["v":label]),
            NSLayoutConstraint.constraints(withVisualFormat:
                "V:[v]-(100)-|",
                metrics: nil, views: ["v":label])
            ].flatMap {$0})
        label.attributedText = att
    }
    
    override func viewDidLayoutSubviews() {
        let s = NSLocalizedString("Greeting", comment: "Greeting") as NSString
        print(self.localLabel.bounds.width)
        self.localLabel.text = s.variantFittingPresentationWidth(Int(self.localLabel.bounds.width))
    }

}
