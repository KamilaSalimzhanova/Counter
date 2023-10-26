//
//  ViewController.swift
//  Counter
//
//  Created by kamila on 24.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var counterLabel: UILabel!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: " + String(counter)
        counterLabel.adjustsFontSizeToFitWidth = true
        increaseButton.tintColor = .red
        increaseButton.backgroundColor = .gray
        decreaseButton.tintColor = .blue
        decreaseButton.backgroundColor = .gray
        clearButton.tintColor = .white
        clearButton.backgroundColor = .gray
        counterLabel.font = .systemFont(ofSize: 50)
        historyTextView.text = "История изменений:"
        historyTextView.isEditable = false
        historyTextView.scrollsToTop = true
        
    }
    
    private func displayCounter(){
        counterLabel.text = "Значение счётчика: " + String(counter)
    }
    
    private func getDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateAndTime = dateFormatter.string(from: Date())
        return dateAndTime
    }
    
    private func addToHistory(_ change: String){
        let timestamp = getDate()
        historyTextView.text += "\n[" + timestamp + change
        let bottom = NSMakeRange(historyTextView.text.count, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    @IBAction private func increaseButtonTap(_ sender: Any) {
        counter += 1
        displayCounter()
        addToHistory("]: значение изменено на +1")
    }
    
    @IBAction private func decreaseButtonTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            addToHistory("]: значение изменено на -1")
        } else {
            addToHistory("]:попытка уменьшить значение счётчика ниже 0")
        }
        displayCounter()
    }
    
    @IBAction private func clearButtonTap(_ sender: Any) {
        counter = 0
        displayCounter()
        addToHistory("]: значение сброшено")
    }
}

