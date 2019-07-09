//
//  ViewController.swift
//  Calculator
//
//  Created by mikewang on 2019/7/9.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

enum OperationType {
    case add
    case subtract
    case multiply
    case devide
    case none
}

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation: OperationType = .none
    var startNew = true

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    
    @IBAction func add(_ sender: UIButton) {
        resultLabel.text = "+"
        operation = .add
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        resultLabel.text = "-"
        operation = .subtract
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        resultLabel.text = "x"
        operation = .multiply
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func divide(_ sender: UIButton) {
        resultLabel.text = "/"
        operation = .devide
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        if performingMath {
            switch operation {
            case .add:
                numberOnScreen = previousNumber + numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            case .subtract:
                numberOnScreen = previousNumber - numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            case .multiply:
                numberOnScreen = previousNumber * numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            case .devide:
                numberOnScreen = getDevideResult()
                makeOKNumberString(from: numberOnScreen)
            case .none:
                resultLabel.text = "0"
            }
            performingMath = false
            startNew = true
        }
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if resultLabel.text != nil {
            if startNew {
                resultLabel.text = "\(inputNumber)"
                startNew = false
            } else {
                if resultLabel.text == "0" || isResultOperator() {
                    resultLabel.text = "\(inputNumber)"
                } else {
                    resultLabel.text! += "\(inputNumber)"
                }
            }
            numberOnScreen = Double(resultLabel.text!) ?? 0
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        resultLabel.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        operation = .none
        startNew = true
    }
    
    // MARK: - Other Method
    
    private func makeOKNumberString(from number: Double) {
        var okText: String
        if floor(number) == number {
            okText = "\(Int(number))"
        } else {
            okText = "\(number)"
        }
        if okText.count >= 10 {
            okText = String(okText.prefix(10))
        }
        resultLabel.text = okText
    }
    
    private func isResultOperator() -> Bool {
        return resultLabel.text == "+"
            || resultLabel.text == "-"
            || resultLabel.text == "*"
            || resultLabel.text == "/"
    }
    
    private func getDevideResult() -> Double {
        if numberOnScreen == 0 {
            return 0
        }
        
        return previousNumber / numberOnScreen
    }
    
}

