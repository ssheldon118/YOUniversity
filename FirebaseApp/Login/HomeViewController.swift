//
//  HomeViewController.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-02.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeViewController:UIViewController {
    @IBOutlet var name: UITextField!
    @IBOutlet var satScores: UITextField!
    @IBOutlet var actScores: UITextField!
    @IBOutlet var recField: UITextField!
    @IBOutlet var essayCompleted: UISwitch!
    //var actScores = defaults.actScores
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = UserDefaults.standard.string(forKey:"name")
        satScores.text = UserDefaults.standard.string(forKey:"satScore")
        actScores.text = UserDefaults.standard.string(forKey:"actScore")
        recField.text = UserDefaults.standard.string(forKey:"recNumber")
        essayCompleted.isOn = (UserDefaults.standard.string(forKey:"essayCompleted") != nil)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        
        
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let name = name.text else { return }
        guard let satScore = satScores.text else { return }
        guard let actScore = actScores.text else { return }
        guard let recNumber = recField.text else { return }
        guard let essayCompleted = Optional(essayCompleted.isOn) else {return}
        
        
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(satScore, forKey: "satScore")
        UserDefaults.standard.set(actScore, forKey: "actScore")
        UserDefaults.standard.set(recNumber, forKey: "recNumber")
        UserDefaults.standard.set(essayCompleted, forKey: "essayCompleted")
    }
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "toMenu", sender: self)
        
        // self.dismiss(animated: true, completion: nil)
    }
}

