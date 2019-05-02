//
//  HomeViewController.swift
//  Baby - Jaundice
//
//  Created by TALHA AYAR on 11.10.2018.
//  Copyright © 2018 TALHA AYAR. All rights reserved.
//

import UIKit
import LGSideMenuController
import SCLAlertView
import FlatUIKit


class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var fixtwoLabel: UILabel!
    @IBOutlet weak var fixoneLabel: UILabel!
    @IBOutlet weak var gestationLabel: UILabel!
    @IBOutlet weak var dateofbirthLabel: UILabel!
    @IBOutlet weak var chooseGestationLabel: UILabel!
    @IBOutlet weak var chooseDateofBirthLabel: UILabel!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var currentBilrubinTextField: UITextField!
    @IBOutlet weak var chooseBilrubinDateLabel: UILabel!
    @IBOutlet weak var previousBilrubinTextField: UITextField!
    @IBOutlet weak var choosePreviousDateLabel: UILabel!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var seeResultsLabel: UILabel!
    @IBOutlet weak var clearLabel: UILabel!
    var current = ""
    var previous = ""
    var selectedGestation = ""
    var currentBilrubindate = ""
    var dateofBirth = ""
    var previousBilrubindate = ""
    

    var gestation = [27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44]
    var dateView = UIDatePicker()
    var Jaundice = Results()
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tapGesture()
        layers()
        openScreen()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
   
    @IBAction func seeResultsButton(_ sender: Any) {
       
            performSegue(withIdentifier: "toTreatment", sender: nil)
        
       
    }
    
    @IBAction func clearButton(_ sender: Any) {
        choosePreviousDateLabel.text = "Choose Date"
        chooseBilrubinDateLabel.text = "Choose Date"
        chooseDateofBirthLabel.text = "Choose Date"
        chooseGestationLabel.text = "Week"
        previousBilrubinTextField.text = ""
        currentBilrubinTextField.text = ""
    }
    
    @IBAction func sideMenuButton(_ sender: Any) {
      
    }
    
    
    
    func openScreen() {
        choosePreviousDateLabel.text = "Choose Date"
        chooseBilrubinDateLabel.text = "Choose Date"
        chooseDateofBirthLabel.text = "Choose Date"
        chooseGestationLabel.text = "Week"
        previousBilrubinTextField.text = ""
        currentBilrubinTextField.text = ""
    }
    
    
    ///////////////LAYERS///////////////////
   
    func layers() {
        let color = UIColor(red:0.46, green:0.65, blue:0.94, alpha:0.3)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
         UINavigationBar.appearance().isTranslucent = true
        
        
        homeView.layer.shadowColor = color.cgColor
        homeView.layer.shadowOpacity = 1
        homeView.layer.shadowOffset = CGSize.zero
        homeView.layer.shadowRadius = 15
        homeView.layer.cornerRadius = 15
       
        firstView.layer.shadowColor = color.cgColor
        firstView.layer.shadowOpacity = 1
        firstView.layer.shadowOffset = CGSize.zero
        firstView.layer.shadowRadius = 20
        firstView.layer.cornerRadius = 15
        
        thirdView.layer.shadowColor = color.cgColor
        thirdView.layer.shadowOpacity = 1
        thirdView.layer.shadowOffset = CGSize.zero
        thirdView.layer.shadowRadius = 240
        thirdView.layer.cornerRadius = 15
       
        chooseGestationLabel.layer.shadowColor = UIColor.lightGray.cgColor
        chooseGestationLabel.layer.shadowOpacity = 1
        chooseGestationLabel.layer.shadowOffset = CGSize.zero
        chooseGestationLabel.layer.shadowRadius = 4
        chooseGestationLabel.layer.cornerRadius = 15
        chooseGestationLabel.layer.masksToBounds = true
        
        
        
        
        chooseBilrubinDateLabel.layer.shadowColor = UIColor.lightGray.cgColor
        chooseBilrubinDateLabel.layer.shadowOpacity = 1
        chooseBilrubinDateLabel.layer.shadowOffset = CGSize.zero
        chooseBilrubinDateLabel.layer.shadowRadius = 4
        chooseBilrubinDateLabel.layer.cornerRadius = 5
   //    chooseBilrubinDateLabel.layer.masksToBounds = true
        
        choosePreviousDateLabel.layer.shadowColor = UIColor.lightGray.cgColor
        choosePreviousDateLabel.layer.shadowOpacity = 1
        choosePreviousDateLabel.layer.shadowOffset = CGSize.zero
        choosePreviousDateLabel.layer.shadowRadius = 4
        choosePreviousDateLabel.layer.cornerRadius = 5
       // choosePreviousDateLabel.layer.masksToBounds = true
        
        previousBilrubinTextField.layer.shadowColor = UIColor.lightGray.cgColor
        previousBilrubinTextField.layer.shadowOpacity = 1
        previousBilrubinTextField.layer.shadowOffset = CGSize.zero
        previousBilrubinTextField.layer.shadowRadius = 4
        previousBilrubinTextField.layer.cornerRadius = 5
       // previousBilrubinTextField.layer.masksToBounds = true
        
        currentBilrubinTextField.layer.shadowColor = UIColor.lightGray.cgColor
        currentBilrubinTextField.layer.shadowOpacity = 1
        currentBilrubinTextField.layer.shadowOffset = CGSize.zero
        currentBilrubinTextField.layer.shadowRadius = 4
        currentBilrubinTextField.layer.cornerRadius = 5
        
        myButton.layer.shadowColor = UIColor.red.cgColor
        
        myButton.layer.shadowHeight = 3.0f;
        myButton.cornerRadius = 6.0f;
        myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        
    }
    
    /////////////////////////////////////////TAP GESTURE//////////////////////////////////////////////////////////
    func tapGesture() {
        chooseGestationLabel.isUserInteractionEnabled = true
        chooseDateofBirthLabel.isUserInteractionEnabled = true
        chooseBilrubinDateLabel.isUserInteractionEnabled = true
        choosePreviousDateLabel.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.selectGestation))
        let gestureRecognizertwo = UITapGestureRecognizer(target: self, action: #selector( HomeViewController.chooseDateofBirth))
        let gestureRecognizerthree = UITapGestureRecognizer(target: self, action: #selector( HomeViewController.chooseBilrubinDate))
        let gestureRecognizerfour = UITapGestureRecognizer(target: self, action: #selector( HomeViewController.choosePreviousDate))
        
        
        chooseGestationLabel.addGestureRecognizer(gestureRecognizer)
        chooseDateofBirthLabel.addGestureRecognizer(gestureRecognizertwo)
        chooseBilrubinDateLabel.addGestureRecognizer(gestureRecognizerthree)
        choosePreviousDateLabel.addGestureRecognizer(gestureRecognizerfour)
    }
    
    @objc func selectGestation() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: "Choose gestation", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
    
    @objc func chooseDateofBirth() {
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250, height: 300)
        
        dateView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        vc.view.addSubview(dateView)
        let alertController = UIAlertController(title: "Date", message: "Select your date", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: { action in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            let selectedDate = dateFormatter.string(from: self.dateView.date)
            self.chooseDateofBirthLabel.text = selectedDate
            self.dateofBirth = selectedDate
            
        });
        alertController.setValue(vc, forKey: "contentViewController")
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func chooseBilrubinDate() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250, height: 300)
        dateView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        vc.view.addSubview(dateView)
        let alertController = UIAlertController(title: "Date", message: "Select your date", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: { action in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, h:mm a"
            let selectedDate = dateFormatter.string(from: self.dateView.date)
            self.chooseBilrubinDateLabel.text = selectedDate
            self.currentBilrubindate = selectedDate
        });
        alertController.setValue(vc, forKey: "contentViewController")
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
}
    
    @objc func choosePreviousDate() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250, height: 300)
        dateView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        vc.view.addSubview(dateView)
        let alertController = UIAlertController(title: "Date", message: "Select your date", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: { action in
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, h:mm a"
        let selectedDate = dateFormatter.string(from: self.dateView.date)
        self.choosePreviousDateLabel.text = selectedDate
            self.previousBilrubindate = selectedDate
        });
        alertController.setValue(vc, forKey: "contentViewController")
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
}
            
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return gestation.count
}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(gestation[row])
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.chooseGestationLabel.text = "\(String(gestation[row])) week"
       selectedGestation = String(gestation[row])
        print("Talha")
       
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTreatment" {
            let destinationVC = segue.destination as! TreatmentViewController
            
            
            destinationVC.latest = Float(Int(self.currentBilrubinTextField.text!)!)
            destinationVC.previous = Float(Int(self.previousBilrubinTextField.text!)!)
            destinationVC.gestation = Int(selectedGestation)!
            destinationVC.latestDate = self.currentBilrubindate
            destinationVC.previousDate = self.previousBilrubindate
            destinationVC.dateofBirth = self.dateofBirth
        }
       
    }
   
    


}
