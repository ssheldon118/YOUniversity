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

extension UIButton{
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        //flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
}

class SearchCell: UITableViewCell {

    
   
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if (highlighted) {
            self.cellView.alpha = 0.5
        } else {
            self.cellView.alpha = 1
        }
    }
    @IBOutlet var cellView: UIView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var unfavoriteButton: UIButton!
    var delegate: favoriteDelegate?
    
    @IBOutlet var actLbl: UILabel!
    @IBOutlet var satLbl: UILabel!
    @IBOutlet var acptLbl: UILabel!
    //let path = index
    
    
    
    
    @IBAction func makeFavorite(_ sender: Any) {
        delegate?.addtoFavorite(name: nameLbl.text!)
        (sender as! UIButton).flash()
        
    }
    
    @IBAction func makeUnfavorite(_ sender: Any) {
        delegate?.removeFromFavorite(name: nameLbl.text!)
        (sender as! UIButton).flash()
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //favoriteButton.titleLabel?.text? = "Add to Favorites"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
