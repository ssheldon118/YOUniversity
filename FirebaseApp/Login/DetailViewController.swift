//
//  DetailViewController.swift
//  FirebaseApp
//
//  Created by Daniel Lacayo on 5/29/18.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet var supsLbl: UILabel!
    @IBOutlet var populationLbl: UILabel!
    @IBOutlet var tuitionLbl: UILabel!
    @IBOutlet var stateLbl: UILabel!
    @IBOutlet var cityLbl: UILabel!
    @IBOutlet var actLbl: UILabel!
    @IBOutlet var collImg: UIImageView!
    @IBOutlet var collNameLbl: UILabel!
    @IBOutlet var acptLbl: UILabel!
    @IBOutlet var satLbl: UILabel!
    var getName = String()
    var getActLbl = String()
    var getAcptLbl = String()
    var getSatLbl = String()
    var getCollImg = UIImage()
    var getPopulationLbl = String()
    var getTuitionLbl = String()
    var getStateLbl = String()
    var getCityLbl = String()
    var getSupsLbl = Array<supDrafts>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collNameLbl.text! = getName
        actLbl.text! = getActLbl
        satLbl.text! = getSatLbl
        acptLbl.text! = getAcptLbl
        collImg.bounds = CGRect(x: 10, y: 94, width: 50, height: 50)
        collImg.image = getCollImg
        populationLbl.text! = getPopulationLbl
        tuitionLbl.text! = getTuitionLbl
        stateLbl.text! = getStateLbl
        cityLbl.text! = getCityLbl
        supsLbl.text! = getSupsLbl[0].prompt
        //collImg.frame.height = 150
    }
    
    
}
