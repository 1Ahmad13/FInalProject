//
//  CryptoManager.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/14/21.
//

import Foundation

protocol CryptoManagerDelegate {
    func updateCrypto(_ cryptoManager: CryptoManager, crypto: CryptoModel)
    func failError(error: Error)
}

struct CryptoManager {
    let cryptoURL = "https://data.messari.io/api/v1/assets/"
    
    var delegate: CryptoManagerDelegate?
    
    func fetchPrice(Crypto: String) {
        let urlString = "\(cryptoURL)\(Crypto)/metrics"
    
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {

        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let crypto = self.parseJSON(safeData) {
                        self.delegate?.updateCrypto(self, crypto: crypto)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ cryptoData: Data) -> CryptoModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CryptoData.self, from: cryptoData)
            let exRate = decodeData.data.market_data.price_usd
            let open1 = decodeData.data.market_data.ohlcv_last_24_hour.open
            let high1 = decodeData.data.market_data.ohlcv_last_24_hour.high
            let low1 = decodeData.data.market_data.ohlcv_last_24_hour.low
            let close1 = decodeData.data.market_data.ohlcv_last_24_hour.close
            let volume1 = decodeData.data.market_data.ohlcv_last_24_hour.volume
            let allTimeHigh = decodeData.data.all_time_high.price
                
            let crypto = CryptoModel(price: exRate, open: open1, high: high1, low: low1, close: close1, volume: volume1, allTime: allTimeHigh)
            return crypto
           
        } catch {
            delegate?.failError(error: error)
            return nil
        }
    }
    
}
