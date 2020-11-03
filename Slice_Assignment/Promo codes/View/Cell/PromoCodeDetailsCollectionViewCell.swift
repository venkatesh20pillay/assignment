//
//  PromoCodeDetailsCollectionViewCell.swift
//  Slice_Assignment
//
//  Created by Venkatesh on 03/11/20.
//

import UIKit

class PromoCodeDetailsCollectionViewCell: UICollectionViewCell {
    
    var collectionViewCellClicked: (()->())?
    
    @IBOutlet weak var discountLabel: UILabel! {
        didSet {
            discountLabel.backgroundColor = .red
            discountLabel.alpha = 0.7
            discountLabel.layer.cornerRadius = 6
        }
    }
    
    
    @IBOutlet weak var sellerImageView: UIImageView!
    
    func configureCell(data: PromoCodeData) {
        discountLabel.text = data.discountTitle
        if(data.seller == "bookmyshow") {
            sellerImageView.image = UIImage(named: "logo")
        }
        else if (data.seller == "Swiggy") {
            sellerImageView.image = UIImage(named: "swiggy_logo")
        }
    }
    
    
}
