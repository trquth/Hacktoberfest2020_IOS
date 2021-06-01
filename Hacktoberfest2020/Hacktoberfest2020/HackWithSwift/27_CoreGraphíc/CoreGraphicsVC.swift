//
//  CoreGraphicsVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 20/11/2020.
//

import UIKit

enum Sharp {
    case rectangle
    case circle
    case checker_board
    case rotate_square
    case lines
    case image_with_text
}

class CoreGraphicsVC: UIViewController {
    var selectedSharpType : Sharp = .image_with_text
    
    let imageResultView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let drawSomethingBtn : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemOrange.cgColor
        button.layer.cornerRadius = 5
        
        button.backgroundColor = UIColor.systemOrange
        
        button.setAttributedTitle(NSAttributedString(string: "DRAW", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
        ]), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(draw), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        view.addSubview(drawSomethingBtn)
        view.addSubview(imageResultView)
        
        NSLayoutConstraint.activate([
            imageResultView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageResultView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            drawSomethingBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            drawSomethingBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

    //MARK: - Handler
    
    func drawRectangle(){
        print("RECTANGLE")
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 300))
        let img = renderer.image{ ctx in
            print("To do")
            let rectangle = CGRect(x: 0, y: 0, width: 150, height: 150)
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.red.cgColor)
            ctx.cgContext.setLineWidth(1)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        }
        imageResultView.backgroundColor = .lightGray
        imageResultView.image = img
    }
    
    func drawCircle() {
        print("CIRCLE")
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 300))
        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 150, height: 150).insetBy(dx: 10, dy: 10)
            
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.red.cgColor)
            ctx.cgContext.setLineWidth(1)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        }
        
        imageResultView.backgroundColor = .lightGray
        imageResultView.image = img
    }
    
    func drawCheckerBoard() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            
            for row in 0 ..< 8 {
                for col in 0 ..< 8 {
                    if (row + col) % 2 == 0 {
                        ctx.cgContext.fill(CGRect(x: col * 25, y: row * 25, width: 25, height: 25))
                    }
                }
            }
        }
          
        imageResultView.backgroundColor = .white
        imageResultView.image = img
    }
    
    func drawRotateSquare() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img = renderer.image{ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)
            let rotations = 16
            let amount = Double.pi / Double(rotations)
            
            for _ in 0 ..< rotations {
                ctx.cgContext.rotate(by: CGFloat(amount))
                ctx.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
            }
            
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        
        imageResultView.backgroundColor = .white
        imageResultView.image = img
    }
    
    func drawLines() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

        let img = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)

            var first = true
            var length: CGFloat = 256

            for _ in 0 ..< 256 {
                ctx.cgContext.rotate(by: .pi / 2)

                if first {
                    ctx.cgContext.move(to: CGPoint(x: length, y: 50))
                    first = false
                } else {
                    ctx.cgContext.addLine(to: CGPoint(x: length, y: 50))
                }

                length *= 0.99
            }

            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }

        imageResultView.backgroundColor = .white
        imageResultView.image = img
    }
    
    func drawImageWithText() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img = renderer.image{ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),NSAttributedString.Key.paragraphStyle : paragraphStyle]
            let string = "The best-laid schemes o'\nmice an' men gang aft agley"
                    let attributedString = NSAttributedString(string: string, attributes: attrs)
            attributedString.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)
            let insideImage = #imageLiteral(resourceName: "image_album")
            insideImage.draw(at: CGPoint(x: 0, y: 150))
        }
        
        imageResultView.backgroundColor = .white
        imageResultView.image = img
    }
    
    @objc func draw(_ sender : Any ){
        print("DRAW IT")
        switch selectedSharpType {
        case .rectangle :
            drawRectangle();
            break
        case .circle :
            drawCircle()
            break
        case .checker_board:
            drawCheckerBoard()
            break
        case .rotate_square:
            drawRotateSquare()
            break
        case .lines:
            drawLines()
            break
        case .image_with_text:
            drawImageWithText()
            break
        default:
            print("Don't do")
            break
        }
    }
}
