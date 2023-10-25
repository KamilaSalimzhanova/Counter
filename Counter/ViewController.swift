//
//  ViewController.swift
//  Counter
//
//  Created by kamila on 24.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var historyChanges: UITextView!
    @IBOutlet weak var clearButtom: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    //@IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var counterText: UILabel!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterText.text = "Значение счётчика: " + String(counter)
        counterText.adjustsFontSizeToFitWidth = true
        increaseButton.tintColor = .red
        increaseButton.backgroundColor = .gray
        decreaseButton.tintColor = .blue
        decreaseButton.backgroundColor = .gray
        clearButtom.tintColor = .white
        clearButtom.backgroundColor = .gray
        //changeButton.setTitle("Увеличить", for: .normal)
        //changeButton.titleLabel?.font = .systemFont(ofSize: 30)
        counterText.font = .systemFont(ofSize: 50)
        historyChanges.text = "История изменений:"
        historyChanges.isEditable = false
        
        //let date = dateFormatter.date(from: "01/16/2023")
        //dateFormatter.string(from: Date())
    }
    
    @IBAction func increaseButtonTap(_ sender: Any) {
        counter += 1
        displayCounter()
        historyChanges.text += "\n[" + getDate() + "]: значение изменено на +1"
    }
    
    @IBAction func descreaseButtonTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            historyChanges.text += "\n[" + getDate() + "]: значение изменено на -1"
        } else {
            historyChanges.text += "\n[" + getDate() + "]:попытка уменьшить значение счётчика ниже 0"
        }
        displayCounter()
    }
    
    @IBAction func clearButtonTap(_ sender: Any) {
        counter = 0
        displayCounter()
        historyChanges.text += "\n[" + getDate() + "]: значение сброшено"
    }
    
    private func displayCounter(){
        counterText.text = "Значение счётчика: " + String(counter)
    }
    
    private func getDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateAndTime = dateFormatter.string(from: Date())
        return dateAndTime
    }
    /*@IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        counterText.text = "Значение счётчика: " + String(counter)
    }*/
}

