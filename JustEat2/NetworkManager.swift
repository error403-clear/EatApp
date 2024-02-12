//
//  NetworkManager.swift


import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    func requestForApi(request: String  ,completionHandler: ((Any)->())?) {
        print("Requesting api")
        var request = URLRequest(url: URL(string: request)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
            if let err = err {
                print("Received some error in api \(err.localizedDescription)")
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else {
                print("Getting some error on json Sericliaxation")
                return
            }
            print(jsonData)
            completionHandler?(jsonData)
            print("First Api is loaded")
        }.resume()
    }
}
    
