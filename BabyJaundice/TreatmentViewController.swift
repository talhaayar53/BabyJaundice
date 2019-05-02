//
//  TreatmentViewController.swift
//  Baby - Jaundice
//
//  Created by TALHA AYAR on 11.10.2018.
//  Copyright © 2018 TALHA AYAR. All rights reserved.
//

import UIKit

class TreatmentViewController: UIViewController {
    @IBOutlet weak var treatmentSecondView: UIView!
    @IBOutlet weak var treatmentFirstView: UIView!
    @IBOutlet weak var latestLabel: UILabel!
    @IBOutlet weak var previousLabel: UILabel!
    @IBOutlet weak var trendLabel: UILabel!
    @IBOutlet weak var latestResultLabel: UILabel!
    @IBOutlet weak var previousResultLabel: UILabel!
    @IBOutlet weak var trendResultLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var previous = Float()
    var gestation = 0
    var latest = Float()
    var trend = Float()
    var dateofBirth = ""
    var latestDate = ""
    var previousDate = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        UINavigationBar.appearance().isTranslucent = true
        layers()
       labels()
        
    }
    
////////////////////////////////////////////////////LAYERS///////////////////////////////////////////////////////

    func layers() {
        treatmentFirstView.layer.shadowColor = UIColor.lightGray.cgColor
        treatmentFirstView.layer.shadowOpacity = 1
        treatmentFirstView.layer.shadowOffset = CGSize.zero
        treatmentFirstView.layer.shadowRadius = 4
        treatmentFirstView.layer.cornerRadius = 15
        
        treatmentSecondView.layer.shadowColor = UIColor.lightGray.cgColor
        treatmentSecondView.layer.shadowOpacity = 1
        treatmentSecondView.layer.shadowOffset = CGSize.zero
        treatmentSecondView.layer.shadowRadius = 4
        treatmentSecondView.layer.cornerRadius = 15
    }
    func labels() {
        
        latestResultLabel.text = ""
        previousResultLabel.text = ""
        trend = Float((latest - previous) / previous * 100)
        trendResultLabel.text = "%\(String(trend))"
        previousLabel.text = ""
        trendLabel.text = ""
        resultLabel.text = "Go to doctor."
        latestLabel.text = ""
    }
}
