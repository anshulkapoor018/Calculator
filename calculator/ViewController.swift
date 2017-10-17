//
//  ViewController.swift
//  calculator
//
//  Created by Anshul Kapoor on 17/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    
    //Outlets
    @IBOutlet weak var labels: UILabel!
    
    //Actions

    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true{
            labels.text = String(sender.tag - 1)
            numberOnScreen = Double(labels.text!)!
            performingMath = false
        }
        else {
            labels.text = labels.text! + String(sender.tag - 1)
            numberOnScreen = Double(labels.text!)!
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if labels.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double(labels.text!)!
            //Divide
            if sender.tag == 12{
                labels.text = "/"
            }
            //Multiply
            else if sender.tag == 13{
                labels.text = "*"
            }
            //Subtract
            else if sender.tag == 14{
                labels.text = "-"
            }
            //Addition
            else if sender.tag == 15{
                labels.text = "+"
            }
            operation = sender.tag
            performingMath = true
        } else if  sender.tag == 16 {
            if self.operation == 12 {
                labels.text = String(previousNumber / numberOnScreen)

            }
            if self.operation == 13 {
                labels.text = String(previousNumber * numberOnScreen)

            }
            if self.operation == 14 {
                labels.text = String(previousNumber - numberOnScreen)

            }
            if self.operation == 15 {
                labels.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11{
            labels.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

