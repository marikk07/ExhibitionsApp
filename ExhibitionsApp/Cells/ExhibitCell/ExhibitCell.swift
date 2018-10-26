//
//  ExhibitCell.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import UIKit

protocol ExhibitCellDelegate {
    func updateSelectedExhibitWith(exhibit: Exhibit, cell: ExhibitCell)
}

class ExhibitCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    var imagesData: [String] = []
    var exhibit: Exhibit?
    var delegate: ExhibitCellDelegate?
    
    // MARK: Static
    static let nibName = "ExhibitCell"
    static let reuseIdentifier = "ExhibitCell"
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        let indexPath = IndexPath(item: exhibit?.selectedIndex ?? 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
    
    // MARK: - Private Methods
    private func registerNibs() {
        let nib = UINib(nibName: ExhibitCollectionCell.nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ExhibitCollectionCell.reuseIdentifier)
    }
    
    // MARK: - Public Methods
    func configureWith(_ exhibition: Exhibit) {
        exhibit = exhibition
        imagesData = exhibition.images
        titleLabel.text = exhibition.title
        collectionView.reloadData()
    }
    
}

extension ExhibitCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExhibitCollectionCell.reuseIdentifier, for: indexPath) as? ExhibitCollectionCell else
        { return UICollectionViewCell() }
        cell.configureWith(imagesData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let cell = collectionView.visibleCells.first {
            let index = collectionView.indexPath(for: cell)
            exhibit?.selectedIndex = index?.row
            if let exhibit = exhibit {
                self.delegate?.updateSelectedExhibitWith(exhibit: exhibit, cell: self)
            }
        }
    }
    
}
