//
//  ViewController.swift
//  Counter
//
//  Created by kamila on 24.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var counterText: UILabel!
    @IBOutlet weak var nameInBackground: UILabel!
    
    private var counter: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterText.text = "Значение счётчика: " + String(counter)
        counterText.adjustsFontSizeToFitWidth = true
        changeButton.setTitle("Увеличить", for: .normal)
        changeButton.titleLabel?.font = .systemFont(ofSize: 30)
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        counterText.text = "Значение счётчика: " + String(counter)
    }
}

