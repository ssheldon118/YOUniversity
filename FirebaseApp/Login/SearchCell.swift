//
//  SearchCell.swift
//  FirebaseApp
//
//  Created by Daniel Lacayo on 5/28/18.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit

protocol favoriteDelegate {
    func addtoFavorite(name: String)
    func removeFromFavorite(name: String)
}

class SearchCell: UITableViewCell {

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    var delegate: favoriteDelegate?
    
    @IBOutlet var actLbl: UILabel!
    @IBOutlet var satLbl: UILabel!
    @IBOutlet var acptLbl: UILabel!
    //let path = index
    
    
    @IBAction func toggleFavorite(_ sender: Any) {
        if favoriteButton.titleLabel?.text! == "Add to Favorites"{
            delegate?.addtoFavorite(name: nameLbl.text!)
            favoriteButton.setTitle("Remove from Favorites", for: .normal)
        }else{
            delegate?.removeFromFavorite(name: nameLbl.text!)
            favoriteButton.setTitle("Add to Favorites", for: .normal)
        }
    }
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //favoriteButton.titleLabel?.text? = "Add to Favorites"
        favoriteButton.setTitle("Add to Favorites", for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
