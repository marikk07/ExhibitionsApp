//
//  ExhibitCollectionCell.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import UIKit
import SDWebImage

class ExhibitCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Static
    static let nibName = "ExhibitCollectionCell"
    static let reuseIdentifier = "ExhibitCollectionCell"
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public Methods
    func configureWith(_ imageData: String) {
        let placeHolder = UIImage(named: "empty_image")
        imageView.sd_setImage(with: URL(string: imageData), placeholderImage: placeHolder, options: .retryFailed, completed: nil)
    }
}
