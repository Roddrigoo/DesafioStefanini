//
//  SearchPresenter.swift
//  RodrigoRodrigues
//
//  Created by Rodrigo on 26/10/22.
//

import Foundation

protocol SearchPresenterDelegate {
    func dataLoaded()
}

class SearchPresenter {
    
    var images: [Image] = []
    var delegate: SearchPresenterDelegate?

    func loadData(text: String) {
        
        if text.isEmpty {
            return
        }
        
        images.removeAll()
        
        SearchRequest().loadData(text: text) { items in
            
            if let array = items {
                for item in array {
                    if let images = item.images {
                        self.images.append(contentsOf: images)
                    }
                }
            }
            self.delegate?.dataLoaded()
        }
    }
}
