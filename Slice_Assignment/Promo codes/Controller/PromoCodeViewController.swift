//
//  ViewController.swift
//  Slice_Assignment
//
//  Created by Venkatesh on 01/11/20.
//

import UIKit

class PromoCodeViewController: UIViewController {
    
    var presenter: PromoCodePresenter?
    var currentState: [PromoCodeData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationCapturesStatusBarAppearance = false
        tableView.reloadData()
        setPresenter()
    }
    
    func setPresenter() {
        presenter = PromoCodePresenter(view: self)
        presenter?.setData()
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
}

extension PromoCodeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentState.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PromoTableViewCell", for: indexPath) as? PromoTableViewCell else {
            return UITableViewCell()
        }
        
        let data = currentState[indexPath.row]
        
        cell.configureCell(data: data)
        cell.promoCodeCellClicked = { [weak self] data in
            self?.presenter?.openDetailScreen(data: data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

extension PromoCodeViewController: PromoCodeView {
    func renderView(state: [PromoCodeData]) {
        currentState = state
        tableView.reloadData()
    }
    
    func openDetailScreen(data: PromoCodeData?) {
        PromoCodeModuleHelper.openPromoCodeDetailScreen(navigationController: navigationController, data: data)
    }
}
