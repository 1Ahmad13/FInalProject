//
//  CurrencyViewController.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/12/21.
//

import UIKit

class CurrencyViewController: UIViewController, CurrencyManagerDelegate, UITextFieldDelegate {

    var currencyManager = CurrencyManager()
    
    @IBOutlet weak var Field1: UITextField!
    @IBOutlet weak var Field2: UITextField!
    @IBOutlet weak var rate: UILabel!
    
    @IBOutlet weak var amountField1: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyManager.delegate = self
        Field1.delegate = self
        Field2.delegate = self
        amountField1.delegate = self
    }
    
    @IBAction func convertButtonPress(_ sender: UIButton) {
        if let from = Field1.text, let to = Field2.text {
            currencyManager.fetchRate(From: from, To: to)
        }
    }
    
    @IBAction func calculateButtonPress(_ sender: UIButton) {
        if let num1 = Double(rate.text!), let num2 = Double(amountField1.text!) {
//            print(num1 * num2)
            totalLabel.text = "Total: \(String(format: "%.3f", num1 * num2))"
         }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Field1.endEditing(false)
        Field2.endEditing(true)
        amountField1.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let from = Field1.text, let to = Field2.text {
            currencyManager.fetchRate(From: from, To: to)
        }
        
        if let num1 = Double(rate.text!), let num2 = Double(amountField1.text!) {
            totalLabel.text = "Total: \(String(format: "%.3f", num1 * num2))"
         }
    }
    
    func updateCurrency(_ currencyManager: CurrencyManager, currency: CurrencyModel) {
        DispatchQueue.main.async {
            self.rate.text = currency.currencyString
        }
    }
    
    func failError(error: Error) {
        print(error)
    }
    
    
    @IBAction func home2(_ sender: UIButton) {
        self.performSegue(withIdentifier: "currencyToHome", sender: self)
    }
    
    @IBAction func currency2(_ sender: UIButton) {
    
    }
    
    @IBAction func game2(_ sender: UIButton) {
        self.performSegue(withIdentifier: "currencyToGame", sender: self)
    }
    
    @IBAction func crypto2(_ sender: UIButton) {
        self.performSegue(withIdentifier: "currencyToCrypto", sender: self)
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
