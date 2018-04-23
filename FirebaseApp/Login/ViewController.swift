//
//  ViewController.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-02.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit
import paper_onboarding
import Firebase

class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {

    @IBOutlet var onboardingView: onboardingView!
    
    //@IBOutlet var letsGoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func onboardingItemsCount() -> Int {
        return 5
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(hex: "81BEC7")
        let backgroundColorTwo = UIColor(hex: "EFC849")
        let backgroundColorThree = UIColor(hex: "EA5364")
        let backgroundColorFour = UIColor(hex: "EFEBDE")
        let backgroundColorFive = UIColor(hex: "72B8FF")


//EA5364
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)
       // #literalImage(#imageLiteral(resourceName: "calander"))#imageLiteral(resourceName: "calander")#imageLiteral(resourceName: "calander")
       // var image: UIImage? = nil
        var image: UIImage = UIImage()
        return [
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "firebaselogo") ,
                               title: "YOUniversity",
                               description: "a college planning app.",
                               pageIcon: image,
                               color: backgroundColorOne,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont!,
                               descriptionFont: descriptionFont!),
            
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "calander"),
                               title: "Plan.",
                               description: "organize from the beginning to end of the college process- import test dates, application and essay deadlines, interviews and more.",
                               pageIcon: image,
                               color: backgroundColorTwo,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont!,
                               descriptionFont: descriptionFont!),
            
            OnboardingItemInfo(informationImage:#imageLiteral(resourceName: "book"),
                               title: "Learn.",
                               description: "find resources to help study for standardized exams, write essays, and manage applications.",
                               pageIcon: image,
                               color: backgroundColorFour,
                               titleColor: UIColor.lightGray,
                               descriptionColor: UIColor.lightGray,
                               titleFont: titleFont!,
                               descriptionFont: descriptionFont!),
            
            OnboardingItemInfo(informationImage:#imageLiteral(resourceName: "search"),
                               title: "Search.",
                               description: "use our complex search algorithm to help find a school based upon your prefrences.",
                               pageIcon: image,
                               color: backgroundColorThree,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont!,
                               descriptionFont: descriptionFont!),
            
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "rocket"),
                               title: "Get Started!",
                               description: "",
                               pageIcon: image,
                               color: backgroundColorFive,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont!,
                               descriptionFont: descriptionFont!)
            ][index]
    }
    
    func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
           
            if index != 4{
                UIView.animate(withDuration: 0.4, animations: {
                    self.loginButton.alpha = 0
                    self.signupButton.alpha = 0
                 //   self.loginButton.isHighlighted = false
                   // self.loginButton.layer.backgroundColor = UIColor(hex: "81BEC7").cgColor
                   // self.loginButton.layer.borderColor = UIColor(hex: "81BEC7").cgColor
                   // self.loginButton.highlightedColor = UIColor.white
                })
            }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 4{
            UIView.animate(withDuration: 0.4, animations: {
                self.loginButton.alpha = 1
                self.signupButton.alpha = 1
            })
        }
    }
    
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }


}

