//
//  ViewController.swift
//  Assignment1_Gr30
//
//  Created by Sriskandarajah Sayanthan on 2022-09-26.
//  @author Group30
// Group member1 Sriskandarajah Sayanthan(St No: 301279325)
// Group member1 Lathiya Rutvik(St No: )
// Group member1 Chetankumar Narendrakumar(St No: )

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var display: UILabel!
    
    //MARK: Other Attributes
    var number_1: String = ""
    var number_2: String = ""
    var result = ""
    var temp: String = ""
    var activeOperation: String = ""
    var lastNumberEntryActivated: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    //MARKS: IBAction
    @IBAction func ClearBtn(_ sender: UIButton) {
        ResetValues()
        display.text = "0"
    }
    
    
    @IBAction func NumbersBtn(_ sender: UIButton) {
        let buttonText = sender.titleLabel!.text!
        
        
        
        if (!lastNumberEntryActivated){
            
            if(buttonText == "."){
                if(!number_1.contains(".")){
                    number_1 += "."
                }
            }
            else{
                number_1 += buttonText
            }
            
            display.text = number_1
        }
        else{
            if(buttonText == "."){
                if(!number_2.contains(".")){
                    number_2 += "."
                }
            }
            else{
                number_2 += buttonText
            }
            
            display.text = temp+number_2
        }
    }
    
    @IBAction func Backspace(_ sender: UIButton) {
        
        if(!lastNumberEntryActivated){
            if (number_1.count > 0){
                number_1 = String(number_1.prefix(number_1.count - 1))
                display.text = number_1
            }
        }
        else{
            if (number_2.count > 0){
                number_2 = String(number_2.prefix(number_2.count - 1))
                display.text = number_2
            }
        }
        
    }
    
    @IBAction func OperationsBtn(_ sender: UIButton) {
        let buttonText = sender.titleLabel!.text!
        
        activeOperation = buttonText
        temp = number_1 + activeOperation
        lastNumberEntryActivated = true
        display.text = temp
    }
    
    @IBAction func DisplayResult(_ sender: UIButton) {
        switch(activeOperation){
        case "+":
            result = String(Double(number_1)! + Double(number_2)!)
            display.text = result
        case "-":
            result = String(Double(number_1)! - Double(number_2)!)
            display.text = result
        case "/":
            result = String(Double(number_1)! / Double(number_2)!)
            display.text = result
        case "x":
            result = String(Double(number_1)! * Double(number_2)!)
            display.text = result
        case "%":
            result = String(Int(number_1)! % Int(number_2)!)
            display.text = result
        default:
            if(activeOperation.count>0){
                result = String(Double(number_1)! + Double(number_2)!)
                display.text = result
            }
            
        }
        
        number_1 = result
        lastNumberEntryActivated = true
        number_2 = ""
    }
    
    
    
    
    func ResetValues(){
        display.text = ""
        lastNumberEntryActivated = false
        number_1 = ""
        number_2 = ""
        activeOperation = ""
    }
}

