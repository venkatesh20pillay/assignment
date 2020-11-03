//
//  PromoCodePresenter.swift
//  Slice_Assignment
//
//  Created by Venkatesh on 03/11/20.
//

import Foundation

protocol PromoCodeView {
    func renderView(state: [PromoCodeData])
    func openDetailScreen(data: PromoCodeData?)
}

struct PromoCodeData {
    var voucherCode: String
    var voucherDesc: String
    var discountTitle: String
    var discountDesc: String
    var validTill: String
    var isExpiringSoon: Bool
    var discount: String
    var seller: String
    var shareData: String
}

class PromoCodePresenter {
    
    var promoCodeData: [PromoCodeData] = []
    var promoCodeView: PromoCodeView?
    
    init(view: PromoCodeView) {
        promoCodeView = view
    }
    
    func setData() {
        guard let view = promoCodeView else {
            return
        }
        promoCodeData.removeAll()
        promoCodeData.append(PromoCodeData(voucherCode: "SWIGGYFOOD", voucherDesc: "applicable only on the first order that you place using the slice card", discountTitle: "₹100 off", discountDesc: "your first order on Swiggy using the slice card comes with ₹100 off.", validTill: "valid till Mar 31, 2019", isExpiringSoon: true, discount: "50% OFF", seller: "Swiggy", shareData: "Hey, I am buying food using slice! Try using my invite code ABCD12345 to get credit."))
        promoCodeData.append(PromoCodeData(voucherCode: "BMS200", voucherDesc: "applicable only on the first order that you place using the slice card", discountTitle: "₹50 off", discountDesc: "your first order on Swiggy using the slice card comes with ₹100 off.", validTill: "valid till Jan 10, 2020", isExpiringSoon: true, discount: "50% OFF", seller: "bookmyshow", shareData: "Hey, I am buying food using slice! Try using my invite code ABCD12345 to get credit."))
        view.renderView(state: promoCodeData)
    }
    
    func openDetailScreen(data: PromoCodeData?) {
        guard let view = promoCodeView else {
            return
        }
        view.openDetailScreen(data: data)
    }
    
}
