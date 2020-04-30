//
//  TimeCircuitsViewController.swift
//  ios-outertime
//
//  Created by Iyin Raphael on 4/28/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import Foundation
import UIKit

class TimeCircuitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBOutlet weak var destTimeLabel: UILabel!
    @IBOutlet weak var presTimeLabel: UILabel!
    @IBOutlet weak var speedLabvel: UILabel!
    @IBOutlet weak var lastTimeDepLabel: UILabel!
    
    var currentSpeed = 0.0
    
    
    @IBAction func travelBackButton(_ sender: Any) {
        startTimer()
    }
    
    var dateFormater: DateFormatter {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM d, yyyy"
        dateFormat.timeZone = .current
        
        return dateFormat
    }
    
    func updateView() {
        let date = Date()
        presTimeLabel.text = dateFormater.string(from: date ).localizedUppercase
        speedLabvel.text = "\(currentSpeed) MPH"
        lastTimeDepLabel.text = "--- -- ----"
    }
    
    func startTimer() {
        let timer = Timer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed), userInfo: nil, repeats: false)
        timer.fire()
    
    }
    
    @objc func updateSpeed() {
        for _ in 1...88 {
            
        }
        if currentSpeed != 88 {
           currentSpeed += 1
            speedLabvel.text = "\(currentSpeed) MPH"
        } else {
            let date = Date()
            lastTimeDepLabel.text = dateFormater.string(from: date).localizedUppercase
            presTimeLabel.text = destTimeLabel.text
            currentSpeed = 0.0
        }
    }
}


extension TimeCircuitViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(_ date: Date) {
        destTimeLabel.text = dateFormater.string(from: date)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let destVC = segue.destination as? DatePickerViewController else {return}
            destVC.delegate = self
            
        }
    }
    
}
