//
//  ChooseNationPopUp.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/29/20.
//

import UIKit

class ChooseNationPopUp: UIView {
    
    let nations : [[String : String]] = [["title" : "(+84) Việt Nam", "value" : "+84" , "flag" : "resources_images_flag_vietnam"]]
    
    var delegate : ChooseNationPopUpDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sizeToFit()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellPhoneCode")
        
        initView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let chooseNationLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Chọn quốc gia"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.isScrollEnabled = true
        table.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        return  table
    }()
    
    let separateView : UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    var separateView2 : UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let cancelBtn : UIButton = {
        let button = UIButton(type: .system)
        
        button.frame = CGRect(origin: .zero, size: CGSize(width: 70, height: 30))
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemOrange.cgColor
        button.layer.cornerRadius = 14
        
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = button.isSelected ? .orange : .white
        
        button.addTarget(self, action: #selector(pressCancelBtn), for: .touchUpInside)
        
        return button
        
    }()
    
    let backgroundView : UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        //let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let view = UIVisualEffectView(effect: blurEffect)
        view.alpha = 0.5
        return view
    }()
    
    let mainView : UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        
        view.backgroundColor = .white
        return view
    }()
    
    func initView() {
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(chooseNationLbl)
        chooseNationLbl.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(separateView)
        separateView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(cancelBtn)
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(separateView2)
        separateView2.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                                     backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                                     backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)])
        
        NSLayoutConstraint.activate([
            mainView.widthAnchor.constraint(equalToConstant: 300),
            mainView.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            mainView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
          
        NSLayoutConstraint.activate([chooseNationLbl.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
                                     chooseNationLbl.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
                                     chooseNationLbl.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([separateView.heightAnchor.constraint(equalToConstant: 0.5),
                                     separateView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0),
                                     separateView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
                                     separateView.topAnchor.constraint(equalTo: chooseNationLbl.bottomAnchor, constant: 10),
                                     separateView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -10)])
        
        tableView.invalidateIntrinsicContentSize()
        tableView.layoutIfNeeded()
        print("table height", tableView.contentSize.height)
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height),
            tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -5),
        ])
        
        NSLayoutConstraint.activate([
            separateView2.heightAnchor.constraint(equalToConstant: 0.5),
            separateView2.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            separateView2.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
            separateView2.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            cancelBtn.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            cancelBtn.topAnchor.constraint(equalTo: separateView2.bottomAnchor, constant: 10),
            cancelBtn.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
            cancelBtn.heightAnchor.constraint(equalToConstant: 30),
            cancelBtn.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    //Handler
    @objc func pressCancelBtn(){
        print("pressCancelButton do")
        delegate?.closeChooseNationPopUp()
    }
    
}

extension ChooseNationPopUp : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("nation count", nations.count)
        return nations.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPhoneCode", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = nations[indexPath.row]["title"]
        cell.imageView?.image = UIImage(named: nations[indexPath.row]["flag"]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.closeChooseNationPopUp()
    }
}
