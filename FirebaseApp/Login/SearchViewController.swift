//
//  SearchViewController.swift
//  FirebaseApp
//
//  Created by Daniel Lacayo on 5/28/18.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    var dataArray = Array(collegeDatabase().allColleges.values)
    var currentDataArray = Array(collegeDatabase().allColleges.values)
    //var resultArray = data
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SearchCell else{
            return UITableViewCell()
        }
        cell.nameLbl.text = currentDataArray[indexPath.row].name
        cell.imgView.image = UIImage(named: currentDataArray[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard !searchText.isEmpty else {
            currentDataArray = dataArray
            table.reloadData()
            return
            
        }
        currentDataArray = dataArray.filter({ collegeData -> Bool in
            collegeData.name.contains(searchText)
        })
        table.reloadData()
    }
    
    //func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        
    //}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
    }
    
}
