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

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, favoriteDelegate{
    
    
    
    
    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var dataArray = Array(collegeDatabase().allColleges.values)
    var currentDataArray = Array(collegeDatabase().allColleges.values)
    //var resultArray = data
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SearchCell else{
            return UITableViewCell()
        }
        cell.nameLbl.text = currentDataArray[indexPath.row].name
        cell.acptLbl.text = String(currentDataArray[indexPath.row].accept)
        cell.actLbl.text = "\(String(currentDataArray[indexPath.row].actLow))-\(String(currentDataArray[indexPath.row].actHigh))"
        cell.satLbl.text = "\(String(currentDataArray[indexPath.row].satLow))-\(String(currentDataArray[indexPath.row].satHigh))"
        cell.imgView.image = UIImage(named: currentDataArray[indexPath.row].name)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //Search Bar
    private func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        currentDataArray = dataArray.filter({collegeData -> Bool in
            switch searchBar.selectedScopeButtonIndex{
            case 0:
                if searchText.isEmpty {return true}
                return collegeData.name.contains(searchText)
            case 1:
                if searchText.isEmpty {return collegeData.fav == .yes}
                return collegeData.name.contains(searchText) && collegeData.fav == .yes
            default:
                return false
            }
            
        })
        table.reloadData()
//        guard !searchText.isEmpty else {
//            currentDataArray = dataArray
//            table.reloadData()
//            return
//
//        }
//        currentDataArray = dataArray.filter({ collegeData -> Bool in
//            collegeData.name.contains(searchText)
//        })
//        table.reloadData()
    }
    //for multiple scopes
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        switch selectedScope {
        case 0:
            currentDataArray = dataArray
            //break
        case 1:
            print("YES")
            currentDataArray = dataArray.filter({collegeData -> Bool in
                collegeData.fav == favorite.yes
                
            })
        default:
            break
        }
        table.reloadData()
    }
    
    //Favorite Button
    func addtoFavorite(name: String) {
        for x in 0..<dataArray.count{
            if name == dataArray[x].name{
                dataArray[x].fav = .yes
                return
            }
        }
        //table.reloadData()
        return
    }
    
    func removeFromFavorite(name: String) {
        for x in 0..<dataArray.count{
            //print(x)
            if name == dataArray[x].name{
                
                dataArray[x].fav = .no
                return
            }
        }
        table.reloadData()
        return
    }
    
    // send information to detail view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //let DVC = Storyboard.instantiateInitialViewController()! as! DetailViewController
        DVC.getName = currentDataArray[indexPath.row].name
        DVC.getAcptLbl = String(currentDataArray[indexPath.row].accept)
        DVC.getActLbl = "\(String(currentDataArray[indexPath.row].actLow))-\(String(currentDataArray[indexPath.row].actHigh))"
        DVC.getSatLbl = "\(String(currentDataArray[indexPath.row].satLow))-\(String(currentDataArray[indexPath.row].satHigh))"
        //cell.imgView.image = UIImage(named: currentDataArray[indexPath.row].name)
        DVC.getCollImg = UIImage(named: currentDataArray[indexPath.row].name)!
        
        self.navigationController?.pushViewController(DVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
    }
    
}
