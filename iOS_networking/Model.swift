//
//  Model.swift
//  iOS_networking
//
//  Created by M. A. Alim Mukul on 18.09.22.
//

import Foundation

class Model: ObservableObject {
    
    @Published var fact = ""
    
    init() {
        
        getRemoteData()
    }
    
    func getRemoteData() {
        
        let urlString = "http://numbersapi.com/random/trivia"
        
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let data = data {
                    
                    if let stringData = String(data: data, encoding: .utf8) {
                        
                        DispatchQueue.main.async {
                            
                            self.fact = stringData
                        }
                    }
                }
            }
            .resume()
        }
        
    }
}
