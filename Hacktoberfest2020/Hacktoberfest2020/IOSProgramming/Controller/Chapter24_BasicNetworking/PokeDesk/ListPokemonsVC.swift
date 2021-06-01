//
//  ListPokemonsVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 30/01/2021.
//

import UIKit

class ListPokemonsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pokeApi : PokeApi = {
        return PokeApi()
    }()
    let pokemonApi: PokemonApi = {
        return PokemonApi()
    }()
    let cellId = "cellId"
    let loadingCellId = "loadingCellId"
    var pokemonList = [PokemonModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomNavigationButton()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PokemonCell", bundle: nil), forCellReuseIdentifier: cellId)
        let tableViewLoadingCellNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: loadingCellId)
        
        showSpinner(onView: self.view)

        self.pokemonApi.fetchPokemonList(from: 0, to: 100){
            (response) in
            switch response {
                case let .success(data):
                    print("run")
                    for (index, item)  in data.enumerated() {
                        let pokeId = self.pokemonList.count + 1
                        let pokemonModel = PokemonModel(pokemonName: item.name, pokemonImage: nil, pokemonID: pokeId)
                        self.pokemonList.append(pokemonModel)
                        self.pokemonApi.fetchPokemonThumbnail(pokemonName: item.name){
                            response in
                            switch response {
                                case let .success(image):
                                    self.pokemonList[pokeId - 1].pokemonImage = image
                            case .failure(_):
                                break;
                            }
                        }
                    }
                    
                    break
                case .failure(_):
                    self.pokemonList = []
                    break
            }
            self.removeSpinner()
            self.tableView.reloadData()
        }
    }

}

extension ListPokemonsVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return pokemonList.count
        }else if section == 1 {
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PokemonCell
            let pokemonData = pokemonList[indexPath.row]
            cell.pokemonName.text = pokemonData.pokemonName
            cell.pokemonImage.image = pokemonData.pokemonImage
            
            return cell
        } else if pokemonList.count == 0 {
            return UITableViewCell()
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: loadingCellId, for: indexPath) as! LoadingCell
            cell.rotate()
            return cell
        }
    }
}

extension ListPokemonsVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolling")
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        print("offsetY", offsetY)
        print("contentHeight", contentHeight)
        print("frame height", scrollView.frame.height)
        if offsetY > contentHeight - scrollView.frame.height {
            //To do
            //Fetching
        }
    }
}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView: UIView) {
        let spinnerView = UIView(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        DispatchQueue.main.async {
            let loadingImage: UIImageView = {
                let imageView = UIImageView(image: UIImage(named: "pokeball"))
                let rotationAnimation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
                rotationAnimation.toValue = NSNumber(value: .pi * 2.0)
                rotationAnimation.duration = 0.5
                rotationAnimation.isCumulative = true
                rotationAnimation.repeatCount = .infinity
                imageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
                imageView.frame = CGRect(x: 0, y: 0, width: 050, height: 50)
                imageView.center = spinnerView.center
                imageView.alpha = 0.7
                return imageView
            }()
            
            spinnerView.addSubview(loadingImage)
            onView.addSubview(spinnerView)
        }
      vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}


extension UIViewController {
    func setupCustomNavigationButton() {
        self.navigationController?.navigationBar.backgroundColor = .blue
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "arrow"), for: .normal)
        backBtn.layer.shadowColor = UIColor.red.cgColor
       // backBtn.layer.shadowOffset = .zero
        
        let leftNavBarBtn = UIBarButtonItem(customView: backBtn)
        let currWidth = leftNavBarBtn.customView?.widthAnchor.constraint(equalToConstant: 35)
        currWidth?.isActive = true
        let currHeight = leftNavBarBtn.customView?.heightAnchor.constraint(equalToConstant: 35)
        currHeight?.isActive = true
        self.navigationItem.leftBarButtonItem = leftNavBarBtn
    }
}
