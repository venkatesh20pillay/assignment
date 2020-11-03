//
//  PromoCodeDetailPresenter.swift
//  Slice_Assignment
//
//  Created by Venkatesh on 03/11/20.
//

import Foundation

protocol PromoCodeDetailView {
    func renderView(data: PromoCodeData?)
}

class PromoCodeDetailPresenter {
    
    var promoCodeDetailView: PromoCodeDetailView?
    var promoCodeData: PromoCodeData?
    
    init(view: PromoCodeDetailView, data: PromoCodeData?) {
        promoCodeDetailView = view
        promoCodeData = data
        setupData()
    }
    
    
    func setupData() {
        guard let view = promoCodeDetailView else {
            return
        }
        view.renderView(data: promoCodeData)
    }
}
