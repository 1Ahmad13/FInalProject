//
//  CurrencyManager.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/12/21.
//

import Foundation

protocol CurrencyManagerDelegate {
    func updateCurrency(_ currencyManager: CurrencyManager, currency: CurrencyModel)
    func failError(error: Error)
}

struct CurrencyManager {
    let currencyURL = "https://v6.exchangerate-api.com/v6/82a46482d307a8c9e2ec3cfa/pair"
    
    var delegate: CurrencyManagerDelegate?
    
    func fetchRate(From: String, To: String) {
        let urlString = "\(currencyURL)/\(From)/\(To)"
        
        performRequest(urlString: urlString)
    }
    
    // Carry out 4-step networking
    func performRequest(urlString: String) {
        // step1. create a URL
        if let url = URL(string: urlString) {
            // step2. Create a URL session
            let session = URLSession(configuration: .default)
            // step3. Give URLSession a task
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let currency = self.parseJSON(safeData) {
                        self.delegate?.updateCurrency(self, currency: currency)
                    }
                    
                    //let dataString = String(data: safeData, encoding: .utf8)
                    //print(dataString)
                }
            }
            // step4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ currencyData: Data) -> CurrencyModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CurrencyData.self, from: currencyData)
            let exRate = decodeData.conversion_rate
    
            let currency = CurrencyModel(rate: exRate)
//            print(decodeData.conversion_rate)
            return currency
           
        } catch {
            delegate?.failError(error: error)
//            print(error)
            return nil
        }
    }
    
}
