//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Sushrut Shastri on 2017-04-25.
//  Copyright © 2017 Sushrut Shastri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstNumberText = ""
    var secondNumberText = ""
    var operation = ""
    var isFirstNumber = true
    var calculating = false
    var clear = true
    //var middleOfTheString = false
    
    @IBOutlet weak var display: UILabel!
    
   
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if clear {
            display.text = ""
            clear = false
        }
        let currentText = display.text!
        let txtLabel = sender.titleLabel?.text
        if let text = txtLabel {
            switch text {
                //when operators are pressed
            case "+", "x", "/", "-":
                if calculating {
                    return
                }
                    operation = text
                    isFirstNumber = false
                    calculating = true
                    display.text = "\(currentText) \(operation) "
             
                break
                //when = is pressed
            case "=":
                
                    isFirstNumber = true
                    calculating = false
                    clear = true
                    //run calculate and display result
                    let result = calculate()
                    display.text = "\(result)"
                break
                //when Clear pressed
            case "c":
                display.text = "0"
                
                //when numbers pressed
            default:
                //to get numbers for operations
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                display.text = "\(currentText)\(text)"
               
                break;
            }
        }
        
    }
    //function to perform operations
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch operation {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "x":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }

}

