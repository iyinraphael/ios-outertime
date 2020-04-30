//
//  DatePickerViewController.swift
//  ios-outertime
//
//  Created by Iyin Raphael on 4/28/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import Foundation
import UIKit

protocol DatePickerDelegate {
    
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.destinationDateWasChosen(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
