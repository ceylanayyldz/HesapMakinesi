//
//  ViewController.swift
//  HesapMakinesi1
//
//  Created by Ceylan Ayyildiz on 25.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTextField: UITextField!
    var currentInput: String = ""
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var currentOperator: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        let stackView1 = UIStackView()
        
        stackView1.alignment = .fill
        
        
        
        appearance.backgroundColor = UIColor(named: "arkaPlanRengi")
        navigationController?.navigationBar.standardAppearance = appearance
        
        navigationController?.navigationBar.compactAppearance = appearance
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        

    }
    
    @IBAction func acButton(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentOperator = nil
        currentInput = ""
        labelTextField.text = "0"
    }
    
    @IBAction func yediButton(_ sender: UIButton) {
        currentInput += "7"
        labelTextField.text = currentInput
    }
    
    @IBAction func dortButton(_ sender: UIButton) {
        currentInput += "4"
        labelTextField.text = currentInput

    }
    
    @IBAction func birButton(_ sender: UIButton) {
        currentInput += "1"
        labelTextField.text = currentInput
    }
    
    @IBAction func negatifButton(_ sender: UIButton) {
    }
    
    @IBAction func sekizButton(_ sender: UIButton) {
        currentInput += "8"
        labelTextField.text = currentInput
    }
    
    @IBAction func besButton(_ sender: UIButton) {
        currentInput += "5"
        labelTextField.text = currentInput
    }
    
    @IBAction func ikiButton(_ sender: UIButton) {
        currentInput += "2"
        labelTextField.text = currentInput
    }
    
    @IBAction func sifirButton(_ sender: UIButton) {
        currentInput += "0"
        labelTextField.text = currentInput
    }
    
    @IBAction func yuzdelikButton(_ sender: UIButton) {
        if let value = Double(currentInput) {
            let percentage = value / 100
            currentInput = String(percentage)
            labelTextField.text = currentInput
        }
    }
    
    @IBAction func dokuzButton(_ sender: UIButton) {
        currentInput += "9"
        labelTextField.text = currentInput
    }
    @IBAction func altiButton(_ sender: UIButton) {
        currentInput += "6"
        labelTextField.text = currentInput
    }
    
    @IBAction func ucButton(_ sender: UIButton) {
        currentInput += "3"
        labelTextField.text = currentInput
    }
    
    @IBAction func virgulButton(_ sender: UIButton) {
        if !currentInput.contains(".") {
               currentInput += "."
               labelTextField.text = currentInput
           }
        
    }
    
    @IBAction func bolmeButton(_ sender: UIButton) {
        currentInput += "/"
        labelTextField.text = currentInput
    }
    
    @IBAction func carpmaButton(_ sender: UIButton) {
        currentInput += "*"
        labelTextField.text = currentInput
    }
    
    @IBAction func eksiButton(_ sender: UIButton) {
        guard let lastChar = currentInput.last else { return }
        if "+-*/".contains(lastChar) {
            return
        }
        currentInput += "-"
        labelTextField.text = currentInput
    }
    
    @IBAction func toplamaButton(_ sender: UIButton) {
        currentInput += "+"
        labelTextField.text = currentInput
    }
    
    @IBAction func esittirButton(_ sender: UIButton) {
        guard let expression = labelTextField.text else { return }
        
        if expression.contains("+") {
            let components = expression.components(separatedBy: "+")
            if components.count == 2,
               let first = Double(components[0]),
               let second = Double(components[1]) {
                let result = first + second
                labelTextField.text = String(result)
                currentInput = String(result)
            }
        } else if expression.contains("-") {
            let components = expression.components(separatedBy: "-")
            if components.count == 2,
               let first = Double(components[0]),
               let second = Double(components[1]) {
                let result = first - second
                labelTextField.text = String(result)
                currentInput = String(result)
            }
        } else if expression.contains("*") {
            let components = expression.components(separatedBy: "*")
            if components.count == 2,
               let first = Double(components[0]),
               let second = Double(components[1]) {
                let result = first * second
                labelTextField.text = String(result)
                currentInput = String(result)
            }
        } else if expression.contains("/") {
            let components = expression.components(separatedBy: "/")
            if components.count == 2,
               let first = Double(components[0]),
               let second = Double(components[1]) {
                if second != 0 {
                    let result = first / second
                    labelTextField.text = String(result)
                    currentInput = String(result)
                } else {
                    labelTextField.text = "Hata"
                    currentInput = ""
                }
            }
        }

        firstOperand = 0
        secondOperand = 0
        currentOperator = nil
    }
}

