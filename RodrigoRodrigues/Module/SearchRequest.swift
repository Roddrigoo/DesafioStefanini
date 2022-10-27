//
//  SearchRequest.swift
//  RodrigoRodrigues
//
//  Created by Rodrigo on 26/10/22.
//

import Foundation

class SearchRequest {
    
    func loadData(text: String, completion: @escaping (_ items: [Gallery]?) -> Void) {
        
        var request = URLRequest(url: URL(string: Constants.apiURL + text)!)
        request.addValue("Client-ID \(Constants.clientID)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            
            DispatchQueue.main.async {
                
                if let data = data {
                    do {
                        let object = try JSONDecoder().decode(Galleries.self, from: data)
                        completion(object.data)
                    }catch{
                        print(error)
                    }
                }else{
                    completion(nil)
                }
            }
        }.resume()
    }
}
