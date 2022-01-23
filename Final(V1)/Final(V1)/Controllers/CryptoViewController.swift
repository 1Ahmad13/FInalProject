//
//  CryptoViewController.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/12/21.
//

import UIKit

class CryptoViewController: UIViewController, CryptoManagerDelegate, UITextFieldDelegate  {

    var cryptoManager = CryptoManager()
    
    @IBOutlet weak var cryptoImageView: UIImageView!
    @IBOutlet weak var cryptoSearchField: UITextField!
    @IBOutlet weak var cryptoPriceLabel: UILabel!
    @IBOutlet weak var openPriceLabel: UILabel!
    @IBOutlet weak var highPriceLabel: UILabel!
    @IBOutlet weak var lowPriceLabel: UILabel!
    @IBOutlet weak var closePriceLabel: UILabel!
    @IBOutlet weak var volumePriceLabel: UILabel!
    @IBOutlet weak var allTimeHighPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cryptoManager.delegate = self
        cryptoSearchField.delegate = self
    }
    
    @IBAction func searchBPressed(_ sender: UIButton) {
        if cryptoSearchField.text == "BTC" || cryptoSearchField.text == "BITCOIN"{
            cryptoImageView.image = #imageLiteral(resourceName: "Untitled design-18")
        } else if cryptoSearchField.text == "ETH" {
            cryptoImageView.image = #imageLiteral(resourceName: "Untitled design-19")
        } else if cryptoSearchField.text == "DOGE" {
            cryptoImageView.image = #imageLiteral(resourceName: "Qj5kbHr7-dogecoin-price-skyrockets-325-crypto-fueled-by-elon-tweets-and-redditors")
        } else if cryptoSearchField.text == "SHIB" {
            cryptoImageView.image = #imageLiteral(resourceName: "Shiba_Inu_coin_logo")
        }
        
        if let crypto = cryptoSearchField.text {
            cryptoManager.fetchPrice(Crypto: crypto)
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cryptoSearchField.endEditing(false)
        if cryptoSearchField.text == "BTC" || cryptoSearchField.text == "BITCOIN"{
            cryptoImageView.image = #imageLiteral(resourceName: "Untitled design-18")
        } else if cryptoSearchField.text == "ETH" {
            cryptoImageView.image = #imageLiteral(resourceName: "Untitled design-19")
        } else if cryptoSearchField.text == "DOGE" {
            cryptoImageView.image = #imageLiteral(resourceName: "Qj5kbHr7-dogecoin-price-skyrockets-325-crypto-fueled-by-elon-tweets-and-redditors")
        } else if cryptoSearchField.text == "SHIB" {
            cryptoImageView.image = #imageLiteral(resourceName: "Shiba_Inu_coin_logo")
        }
        
        if let crypto = cryptoSearchField.text {
            cryptoManager.fetchPrice(Crypto: crypto)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if cryptoSearchField.text == "BTC" || cryptoSearchField.text == "BITCOIN"{
            cryptoImageView.image = #imageLiteral(resourceName: "Untitled design-18")
        } else if cryptoSearchField.text == "ETH" {
            cryptoImageView.image = #imageLiteral(resourceName: "Untitled design-19")
        } else if cryptoSearchField.text == "DOGE" {
            cryptoImageView.image = #imageLiteral(resourceName: "Qj5kbHr7-dogecoin-price-skyrockets-325-crypto-fueled-by-elon-tweets-and-redditors")
        } else if cryptoSearchField.text == "SHIB" {
            cryptoImageView.image = #imageLiteral(resourceName: "Shiba_Inu_coin_logo")
        } else {
            cryptoImageView.image = #imageLiteral(resourceName: "Untitled design-20")
        }
        
        if let crypto = cryptoSearchField.text {
            cryptoManager.fetchPrice(Crypto: crypto)
        }
    }
    
    func updateCrypto(_ cryptoManager: CryptoManager, crypto: CryptoModel) {
        DispatchQueue.main.async {
            self.cryptoPriceLabel.text = "Price: $\(crypto.cryptoString)"
            self.openPriceLabel.text = "Open: $\(crypto.openString)"
            self.highPriceLabel.text = "High: $\(crypto.highString)"
            self.lowPriceLabel.text = "Low: $\(crypto.lowString)"
            self.closePriceLabel.text = "Close: $\(crypto.closeString)"
            self.volumePriceLabel.text = "Volume: $\(crypto.volumeString)"
            self.allTimeHighPriceLabel.text = "All Time High: $\(crypto.allTimeString)"
        }
    }
    
    func failError(error: Error) {
        print(error)
    }
    
    
    @IBAction func home4(_ sender: UIButton) {
        self.performSegue(withIdentifier: "cryptoToHome", sender: self)
    }
    
    
    @IBAction func currency4(_ sender: UIButton) {
        self.performSegue(withIdentifier: "cryptoToCurrency", sender: self)
    }
    
    
    @IBAction func game4(_ sender: UIButton) {
        self.performSegue(withIdentifier: "cryptoToGame", sender: self)
    }
    
    
    @IBAction func crypto4(_ sender: UIButton) {
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
