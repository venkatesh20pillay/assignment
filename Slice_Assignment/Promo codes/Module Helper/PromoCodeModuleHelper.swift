//
//  PromoCodeModuleHelper.swift
//  Slice_Assignment
//
//  Created by Venkatesh on 03/11/20.
//

import Foundation
import UIKit

class PromoCodeModuleHelper {
    
    static func openPromoCodeDetailScreen(navigationController: UINavigationController?, data: PromoCodeData?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "PromoCodeDetailViewController") as! PromoCodeDetailViewController
        initialViewController.promoCodeData = data
        navigationController?.pushViewController(initialViewController, animated: true)
    }
}
