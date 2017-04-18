//
//  ViewController.swift
//  simple-calc
//
//  Created by Sydnie Fenske on 4/17/17.
//  Copyright © 2017 Sydnie Fenske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberDisplayed: Double = 0
    var firstNumber: Double = 0
    var mathReady = false
    var operation = 0;
    var numList: [Double] = []
    var total: Double = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if(mathReady == true) {
            label.text = String(sender.tag - 1)
            numberDisplayed = Double(label.text!)!
            mathReady = false
        } else{
            label.text = label.text! + String(sender.tag-1)
            numberDisplayed = Double(label.text!)!
        }
    }
    
    
    @IBAction func basicActions(_ sender: UIButton) {
        if(label.text != "" && sender.tag != 11 && sender.tag != 16) {
            firstNumber = Double(label.text!)!
            operation = sender.tag
            mathReady = true
        }
        else if (sender.tag == 16) {
            if(operation == 12) {
                label.text = String(firstNumber / numberDisplayed)
            }
            else if(operation == 13) {
                label.text = String(firstNumber * numberDisplayed)
            }
            else if(operation == 14) {
                label.text = String(firstNumber - numberDisplayed)
            }
            else if(operation == 15) {
                label.text = String(firstNumber + numberDisplayed)
            } else if(operation == 17) {
                numList.append(numberDisplayed)
                label.text = String(numList.count)
            } else if(operation == 18) {
                numList.append(numberDisplayed)
                total += numberDisplayed
                label.text = String(total/Double(numList.count))
            } else if(operation == 19) {
                label.text = String(factorial(n: Int(numberDisplayed)))
            } else if(operation == 20) {
                label.text = String(firstNumber.truncatingRemainder(dividingBy: numberDisplayed))
            }
        }
        else if(sender.tag == 11){
            label.text = ""
            firstNumber = 0
            operation = 0
            numberDisplayed = 0
            numList = []
            total = 0
        }
    }
    
    @IBAction func extraFunctions(_ sender: UIButton) {
        if(label.text != "") {
            if(sender.tag == 19) {
                label.text = String(factorial(n: Int(numberDisplayed)))
            } else if sender.tag == 18 || sender.tag == 17 {
                numList.append(numberDisplayed)
                total += numberDisplayed
                mathReady = true
            }
            operation = sender.tag
        }
    }
    
    func factorial(n: Int) -> Int {
        return n == 0 ? 1 : n * factorial(n: n - 1)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

