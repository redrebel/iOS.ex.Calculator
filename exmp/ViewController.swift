//
//  ViewController.swift
//  exmp
//
//  Created by 이정근 on 2018. 1. 10..
//  Copyright © 2018년 이정근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftInputField: UITextField!
    
    
    @IBOutlet weak var rightInputField: UITextField!
    
    
    @IBOutlet weak var opInputField: UITextField!
    
    
    func add(a: Int, b: Int) -> Int{
        return a + b
    }
    
    func subtract(a: Int, b: Int) -> Int{
        return a - b
    }
    
    func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
    
    func divide(a: Int, b: Int) -> Int {
        return a / b
    }
    
    func calcul(a: Int, op: Character, b: Int) -> Int{
        var functionToCall = add(a:b:)
        
        switch op{
        case "+" :
            functionToCall = add(a:b:)
        case "-" :
            functionToCall = subtract(a:b:)
        case "*" :
            functionToCall = multiply(a:b:)
        case "/" :
            functionToCall = divide(a:b:)
        default:
            print("not supported")
            return 0
        }
        
        let c = functionToCall(a, b)
        
        return c
    }
    
    func presentAlert (title: String, msg: String, okTitle: String = "확인"){
        let alert = UIAlertController(title: title, message: msg,                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        //        let cancelAction = UIAlertAction(title: "춰소", style: .cancel, handler: nil)
        //        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func showAlert(_ sender: Any) {
        let a = leftInputField.text!
        let b = rightInputField.text!
        let c = opInputField.text!
        
        let num1 = Int(a)!
        let num2 = Int(b)!
        let op = Character(c)
        
        
        var functionToCall = add(a:b:)
        
        switch op{
        case "+" :
            functionToCall = add(a:b:)
        case "-" :
            functionToCall = subtract(a:b:)
        case "*" :
            functionToCall = multiply(a:b:)
        case "/" :
            if num2 == 0 {
                presentAlert(title: "경고", msg: "dividing by 0 is not available")
                return
            }
            functionToCall = divide(a:b:)
        default:
            presentAlert(title: "경고", msg: "not supported")
            return
        }
        
        let result = functionToCall(num1, num2)

        let msg = String(num1) + "와 " + String(num2) + "의 " + String(op) + " 결과는 " + String(result) + " 입니다."
        presentAlert(title: "계산 결과", msg: msg)
        
        //presentAlert(title: "합계", msg: "\(result)")
        //presentAlert(title: "경고", msg: "경고 메시지")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        showAlert.setTitle("alt", for: .normal)
    }




}

