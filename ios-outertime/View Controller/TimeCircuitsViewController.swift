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
    
    @IBAction func setDestinationButton(_ sender: Any) {
    }
    
    @IBAction func travelBackButton(_ sender: Any) {
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
    }
}
