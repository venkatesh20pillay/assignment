//
//  PromoCodeDetailViewController.swift
//  Slice_Assignment
//
//  Created by Venkatesh on 03/11/20.
//

import UIKit

class PromoCodeDetailViewController: UIViewController {
    
    var promoCodeData: PromoCodeData?
    var presenter: PromoCodeDetailPresenter?
    
    
    @IBOutlet weak var sellerLogog: UIImageView!
    
    @IBOutlet weak var discountDescription: UILabel! {
        didSet {
            discountDescription.textColor = .white
        }
    }
    @IBOutlet weak var shareImagView: UIImageView! {
        didSet {
            shareImagView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(shareTapped))
            shareImagView.addGestureRecognizer(tap)
        }
    }
    
    @IBOutlet weak var brandName: UILabel!
    
    @IBOutlet weak var offerDescription: UILabel!
    
    @IBOutlet weak var expiryTime: UILabel!
    
    @IBOutlet weak var copyImageView: UIImageView! {
        didSet {
            copyImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(copyTapped))
            copyImageView.addGestureRecognizer(tap)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        // Do any additional setup after loading the view.
    }
    
    func setupPresenter() {
        presenter = PromoCodeDetailPresenter(view: self, data: promoCodeData)
    }
    
    func setupData() {
        if let data = promoCodeData {
            if(data.seller == "bookmyshow") {
                sellerLogog.image = UIImage(named: "logo")
            }
            else if (data.seller == "Swiggy") {
                sellerLogog.image = UIImage(named: "swiggy_logo")
            }
            discountDescription.text = data.discountDesc
            brandName.text = data.seller
            offerDescription.text = data.voucherDesc
            expiryTime.text = data.validTill
        }
    }
    
    @objc func copyTapped() {
        UIPasteboard.general.string = brandName.text
    }
    
    @objc func shareTapped() {
        let items = [URL(string: "https://www.apple.com")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
}

extension PromoCodeDetailViewController: PromoCodeDetailView {
    func renderView(data: PromoCodeData?) {
        promoCodeData = data
        setupData()
    }
}
