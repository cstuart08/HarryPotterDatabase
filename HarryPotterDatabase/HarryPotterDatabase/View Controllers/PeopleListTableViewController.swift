//
//  PeopleListTableViewController.swift
//  HarryPotterDatabase
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit

class PeopleListTableViewController: UITableViewController, UISearchBarDelegate {
    
    var people: [People] = []
    
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        PeopleController.fetchPeople() { (people) in
            DispatchQueue.main.async {
                let ppp = people.sorted() { $0.name < $1.name }
                self.people = ppp
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        let name = people[indexPath.row]
        cell.textLabel?.text = name.name
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
