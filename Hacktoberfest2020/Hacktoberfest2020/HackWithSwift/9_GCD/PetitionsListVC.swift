//
//  PetitionsListVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/11/2020.
//

import UIKit

class PetitionsListVC: UITableViewController {
    let cellId = "Cell"
    var petitions = [PetitionModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Petitions"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    
        fetchPetitions()
    }
    
    func fetchPetitions() {
        let devUrl = "https://www.hackingwithswift.com/samples/petitions-1.json"

        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string : devUrl) {
                if let data = try? Data(contentsOf: url) {
                    self.parse(data)
                }
            }
        }
       
    }
    
    func parse(_ data : Data) {
        let decoder = JSONDecoder()
        if let json = try? decoder.decode(PetitionsModel.self, from: data) {
            petitions =  json.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = petitions[indexPath.row].title
        return cell
    }


}
