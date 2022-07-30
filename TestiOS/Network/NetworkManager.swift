//
//  NetworkManager.swift
//  TestiOS
//
//  Created by javier apaez on 29/07/22.
//

import Foundation
enum Errors: Error {
        case urlInvalid
        case dataIsNil
    }

class NetworkManager {
    static let shared = NetworkManager()
    private var baseURL = "https://s3.amazonaws.com/dev.structure.files/examen/ios/test.json"
    
    private init() {}
    
    func getCharts(completionHandler: @escaping(Result<Graficas, Error>)-> Void) {
        
        let url = URL(string: baseURL)!
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            DispatchQueue.main.async {
                
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let decodedData = try jsonDecoder.decode(Graficas.self, from: data)
                        completionHandler(.success(decodedData))
                    } catch {
                        completionHandler(.failure(error))
                    }
                }
            }
        }
        dataTask.resume()
    }
}
