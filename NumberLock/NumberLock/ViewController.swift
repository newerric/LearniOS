//
//  ViewController.swift
//  NumberLock
//
//  Created by mikewang on 2019/5/11.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    // 1 - 100 make a random number
    var answer = getAnswer()
    var minNumber = 1
    var maxNumber = 100
    var isOver = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBOutlet weak var messageLabel: UILabel!    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false {
            print(answer)
            
            // take input text out
            let inputText = inputTextField.text!
            
            // clear input text out
            inputTextField.text = ""
            
            let inputNumber = Int(inputText)
            
            if inputNumber == nil {
                // wrong input
                messageLabel.text = "No input! Guess a number between \(minNumber) - \(maxNumber)"
            } else { // 慣例 coding style 要留空白
                checkAnswer(number: inputNumber!)                
            }
        } else { // 慣例 coding style 要留空白
            Replay()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // push the keeyboard up
        inputTextField.becomeFirstResponder()
    }
    
    // func or 變數命名開頭均小寫
    // 關於 static 或許是 iOS 圈子比較少用，不過和這邊的 final class 是相同的東西，其實都可以使用，改一下讓你也可以知道一下這種用法，如果還不知道的話
    // final 就是不可以再被 override
    private final class func getAnswer() -> Int {
        return GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    }
    
    private func Replay() {
        // game is over
        minNumber = 1
        maxNumber = 100
        messageLabel.text = "Guess a number between \(minNumber) ~ \(maxNumber)"
        answer = ViewController.getAnswer()
        isOver = false
        background.image = UIImage(named: "BG")
    }
    
    // 沒有要回值的話，就直接不寫
    // func 命名首字小寫
    private func checkAnswer(number:Int) {
        // input ok
        if number > maxNumber {
            print("Too large! Guess a number between \(minNumber) - \(maxNumber)")
        }else if number < minNumber {
            print("Too small Guess a number between \(minNumber) - \(maxNumber)")
        } else if number == answer {
            // Bingo! right answer
            messageLabel.text = "You are right, Press [Guess] to play."
            isOver = true
            background.image = UIImage(named: "Finish")
        } else {
            // wrong answer
            if number > answer {
                // larger than answer
                maxNumber = number
            } else {
                minNumber = number
            }
            
            messageLabel.text = "Try again! Guess a number between \(minNumber) ~ \(maxNumber)"
        }
    }
    
}

