//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    private var decimalAdded: Bool = false
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double in calcpresses")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let currentMethod = sender.currentTitle {
            
            
            if let result = calculator.calculate(symbol: currentMethod) {
                displayValue = result
            }
            
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            else{
                
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text! += numValue
            }
        }
    }
    
}

