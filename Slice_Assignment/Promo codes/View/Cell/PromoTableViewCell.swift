//
//  PromoTableViewCell.swift
//  Slice_Assignment
//
//  Created by Venkatesh on 02/11/20.
//

import UIKit

class PromoTableViewCell: UITableViewCell {
    
    var promoCodedata: PromoCodeData?
    
    var promoCodeCellClicked: ((PromoCodeData?)->())?
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: PromoCodeData) {
        promoCodedata = data
        collectionView.reloadData()
    }

}

extension PromoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? PromoCodeDetailsCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let data = promoCodedata {
            cell.configureCell(data: data)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let view = promoCodeCellClicked {
            view(promoCodedata)
        }
    }
}


