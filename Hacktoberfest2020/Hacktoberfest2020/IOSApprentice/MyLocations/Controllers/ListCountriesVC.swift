//
//  ListCountriesVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 21/12/2020.
//

import UIKit

class SearchResultsVC :UIViewController , UISearchResultsUpdating{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard searchController.isActive else { return  }
        if let t = searchController.searchBar.text, !t.isEmpty {
            print("You are searching for",t)
        }
    }
}

class MySearchResultsVC : UISearchController{
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

class ListCountriesVC: UITableViewController , UISearchBarDelegate{
    
    private var data = [RegionModel]()
    let cellId = "cellId"
    let headerId = "headerId"
    //var sc : UISearchController?
    var searcher : UISearchController!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshBtn = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(doRefresh))
        navigationItem.rightBarButtonItem = refreshBtn
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerId)
        
        tableView.backgroundColor = .yellow
        tableView.backgroundView = {
            let v = UIView()
            v.backgroundColor = .red
            return v
        }()
        
        tableView.sectionIndexColor = .white
        tableView.sectionIndexBackgroundColor = .red
        tableView.sectionIndexTrackingBackgroundColor = .yellow
        
        tableView.separatorEffect = UIBlurEffect(style: .extraLight)
        
        //tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        
        //Search
//        let vc2 = SearchResultsVC()
//        let sc = UISearchController(searchResultsController: vc2)
//        self.sc = sc
//        sc.searchResultsUpdater = vc2
//        let sb = sc.searchBar
//        self.tableView.addSubview(sb)
        
//        let src = SearchResultsDataVC()
//        let searcher = MySearchResultsVC(searchResultsController: src)
//        self.searcher = searcher
//        searcher.searchResultsUpdater = src
//        let b = searcher.searchBar
//        b.scopeButtonTitles = ["A","B"]
//        //b.sizeToFit()
//        //searcher.automaticallyShowsScopeBar = false
//        b.autocapitalizationType = .none
//        self.tableView.tableHeaderView = b
//        b.delegate = src
        
        let searcher = MySearchResultsVC(searchResultsController: nil)
        self.searcher = searcher
        searcher.obscuresBackgroundDuringPresentation = false
        searcher.searchResultsUpdater = self
        searcher.delegate = self
        
        let sb = searcher.searchBar
        sb.autocapitalizationType = .none
        self.tableView.tableHeaderView  = sb
        
        data = initData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //return 1
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        // #warning Incomplete implementation, return the number of rows
        return data[section].countries?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
//        cell.textLabel?.text = data[indexPath.section].countries![indexPath.row].country
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //print(cell.contentView.constraints)
        if cell.contentView.constraints.count == 0 {
            cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                cell.contentView.topAnchor.constraint(equalTo: cell.textLabel!.topAnchor, constant:-20),
                cell.contentView.bottomAnchor.constraint(equalTo: cell.textLabel!.bottomAnchor, constant:20),
                cell.contentView.leadingAnchor.constraint(equalTo: cell.textLabel!.leadingAnchor, constant:-10),
                cell.contentView.trailingAnchor.constraint(equalTo: cell.textLabel!.trailingAnchor, constant:10),
            ])
        }

        cell.textLabel?.numberOfLines = 5
        cell.textLabel?.text = data[indexPath.section].countries![indexPath.row].country
        return cell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        //cell.textLabel?.text = data[indexPath.section].countries![indexPath.row].country
//        cell.textLabel?.numberOfLines = 10
//        cell.textLabel?.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
//        return cell
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].region
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        let header = UITableViewHeaderFooterView(reuseIdentifier: "header")
////        header.textLabel?.attributedText = NSAttributedString(string: data[section].region ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
////
////        let redView = UIView()
////        redView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
////        header.backgroundView = redView
////
////        let blueView = UIView()
////        blueView.backgroundColor = UIColor.blue
////        blueView.translatesAutoresizingMaskIntoConstraints = false
////        header.contentView.addSubview(blueView)
////        NSLayoutConstraint.activate([
////            blueView.leadingAnchor.constraint(equalTo: header.contentView.leadingAnchor, constant: 0),
////            blueView.trailingAnchor.constraint(equalTo: header.contentView.trailingAnchor, constant: 0),
////            blueView.topAnchor.constraint(equalTo: header.contentView.topAnchor, constant: 0),
////            blueView.bottomAnchor.constraint(equalTo: header.contentView.bottomAnchor, constant: 0),
////        ])
////
//////        let b = UIButton(type:.system)
//////        b.setTitle("Howdy", for:.normal)
//////        b.sizeToFit()
//////        header.contentView.addSubview(b)
////
////        return header
////        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId)!
////        let redView = UIView()
////        redView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
////        redView.translatesAutoresizingMaskIntoConstraints = false
////
////        NSLayoutConstraint.activate([
////            redView.leadingAnchor.constraint(equalTo: header.contentView.leadingAnchor, constant: 0),
////            redView.trailingAnchor.constraint(equalTo: header.contentView.trailingAnchor, constant: 0),
////            redView.topAnchor.constraint(equalTo: header.contentView.topAnchor, constant: 0),
////            redView.bottomAnchor.constraint(equalTo: header.contentView.bottomAnchor, constant: 0),
////        ])
//
////        let titleLbl = UILabel()
////        titleLbl.attributedText = NSAttributedString(string: data[section].region ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.cgColor])
////        titleLbl.translatesAutoresizingMaskIntoConstraints = false
////
////        header.contentView.addSubview(titleLbl)
////
////        NSLayoutConstraint.activate([
////            titleLbl.centerYAnchor.constraint(equalTo: header.contentView.centerYAnchor),
////            titleLbl.centerXAnchor.constraint(equalTo: header.contentView.centerXAnchor)
////        ])
//
//       // return header
//        let h = tableView.dequeueReusableHeaderFooterView(withIdentifier:headerId)!
//                if h.viewWithTag(1) == nil {
//                    print("configuring a new header view") // only called about 8 times
//
//                    h.backgroundView = UIView()
//                    h.backgroundView?.backgroundColor = .black
//                    let lab = UILabel()
//                    lab.tag = 1
//                    lab.font = UIFont(name:"Georgia-Bold", size:22)
//                    lab.textColor = .green
//                    lab.backgroundColor = .clear
//                    h.contentView.addSubview(lab)
//                    let v = UIImageView()
//                    v.tag = 2
//                    v.backgroundColor = .black
//                    v.image = UIImage(named:"us_flag_small.gif")
//                    h.contentView.addSubview(v)
//                    lab.translatesAutoresizingMaskIntoConstraints = false
//                    v.translatesAutoresizingMaskIntoConstraints = false
//                    NSLayoutConstraint.activate([
//                        NSLayoutConstraint.constraints(withVisualFormat:"H:|-5-[lab(25)]-10-[v(40)]",
//                            metrics:nil, views:["v":v, "lab":lab]),
//                        NSLayoutConstraint.constraints(withVisualFormat:"V:|-10-[v]-10-|",
//                            metrics:nil, views:["v":v]),
//                        NSLayoutConstraint.constraints(withVisualFormat:"V:|[lab]|",
//                            metrics:nil, views:["lab":lab])
//                        ].flatMap {$0})
//                }
//                let lab = h.contentView.viewWithTag(1) as! UILabel
//                lab.text = data[section].region ?? ""
//                // print(h.backgroundView?.backgroundColor)
//                return h
//   }
    
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return ["A", "B"]
//        //return data.map{$0.region ?? ""}
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("Run heightForRowAt")
        return UITableView.automaticDimension
    }

   // MARK: - Method
    @objc func doRefresh(){
        tableView.reloadData()
    }
    
    func initData() -> [RegionModel] {
        var data = [RegionModel]()
        
        var test = RegionModel()
        test.region = "What is Lorem Ipsum? What is Lorem Ipsum? What is Lorem Ipsum?"
        test.countries = [
            CountryModel(country: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")]
        data.append(test)
        
        var southeastAsiaRegion = RegionModel()
        southeastAsiaRegion.region = "Southeast Asia"
        southeastAsiaRegion.countries = [
            CountryModel(country: "Brunei"),
            CountryModel(country: "Indonesia"),
            CountryModel(country: "Cambodia"),
            CountryModel(country: "Laos"),
            CountryModel(country: "Myanmar"),
            CountryModel(country: "Malaysia"),
            CountryModel(country: "Philippines"),
            CountryModel(country: "Singapore"),
            CountryModel(country: "Thailand"),
            CountryModel(country: "East Timor"),
            CountryModel(country: "Vietnam")]
        data.append(southeastAsiaRegion)
        
        var northAmericaRegion = RegionModel()
        northAmericaRegion.region = "North America"
        northAmericaRegion.countries = [
            CountryModel(country: "Bermuda"),
            CountryModel(country: "Canada"),
            CountryModel(country: "Greenland"),
            CountryModel(country: "Saint Pierre and Miquelon"),
            CountryModel(country: "United States")]
        
        data.append(northAmericaRegion)
        
        return data
    }
}

extension ListCountriesVC : UISearchControllerDelegate {
    
}

extension ListCountriesVC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("run updateSearchResults", searchController.searchBar.text!)
        
    }
    
    
}
