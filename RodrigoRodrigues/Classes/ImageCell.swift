//
//  ImageCell.swift
//  RodrigoRodrigues
//
//  Created by Rodrigo on 26/10/22.
//

import UIKit
import Kingfisher

class ImageCell: UICollectionViewCell {
    
    @IBOutlet var imgPicture: UIImageView!
    
    func loadUI(item: Image) {
        if let url = URL(string: item.link) {
            DispatchQueue.main.async {
                self.imgPicture.kf.setImage(with: url,
                                            options: [.loadDiskFileSynchronously,
                                                      .cacheOriginalImage,
                                                      .transition(.fade(0.25))])
            }
        }
    }
}
