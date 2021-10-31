//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Yaroslav Monastyrev on 29.10.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBAction func findDayButtonTapped(_ sender: Any) {
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else { return }
        
        guard (1...31).contains(Int(day)!) && (1...12).contains(Int(month)!) && Int(year)! > 0 else {
            dayLabel.text = "Sorry, not available format"
            return
        }
            
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekDay = dateFormatter.string(from: date)
        
        dayLabel.text = weekDay
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

