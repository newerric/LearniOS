//
//  ViewController.swift
//  PrimeNumber
//
//  Created by mikewang on 2019/5/12.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabe: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // @IBAction => Interface Builder Action
    @IBAction func doThePrimeTest(_ sender: UIButton) {
        /* before refactor
        // 1. Take out the number string from the inputTextField
        if let inputText = inputTextField.text{
            // 2. Convert the number to Int
            if let inputNumber = Int(inputText){
                // 3. Using the checkPrime function to get result
                // Using the resultLabal to show result
                
                // step1
                //resultLabe.text = checkPrime(withNumber: inputNumber)
                //resultLabe.isHidden = false
                
                // step2
                //checkPrime(withNumber: inputNumber, andCompletionHandler: {
                //    (result:String) in
                //    self.resultLabe.text = result
                //    self.resultLabe.isHidden = false
                //})
                
                // step3 closure
                checkPrime(withNumber: inputNumber) {
                    self.resultLabe.text = $0
                    self.resultLabe.isHidden = false
                }
            }
        }*/
        
        // 1. Take out the number string from the inputTextField
        // 2. Convert the number to Int
        if let inputText = inputTextField.text, let inputNumber = Int(inputText){
            // 3. Using the checkPrime function to get result
            // Using the resultLabal to show result
            // step3 closure
            checkPrime(withNumber: inputNumber) {
                self.resultLabe.text = $0
                self.resultLabe.isHidden = false
            }
        }
        
        inputTextField.text = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // push the keyboard up
        inputTextField.becomeFirstResponder()
    }
    
    // prime number
    func checkPrime(withNumber testNumber:Int)->String{
        var isPrime:Bool? = true
        if testNumber <= 0{
            isPrime = nil
        }else if testNumber == 1{
            isPrime = false
        }else{
            for i in 2..<testNumber{
                if testNumber % i == 0{
                    // input number is not prime
                    isPrime = false
                    break
                }
            }
        }
        
        if isPrime == true{
            return "\(testNumber) is prime"
        }else if isPrime == false{
            return "\(testNumber) is not prime"
        }else{
            return "reenter"
        }
    }
    
    func checkPrime(withNumber number:Int, andCompletionHandler handler:(String)->()){
        handler(checkPrime(withNumber: number))
    }

}

