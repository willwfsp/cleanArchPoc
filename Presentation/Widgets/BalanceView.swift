//
//  BalanceView.swift
//  Presentation
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import UIKit

class BalanceView: UIView {
    @IBOutlet weak var balanceLabel: UILabel! {
        didSet {
            balanceLabel.text = ""
            balanceLabel.accessibilityLabel = "Saldo"
            balanceLabel.accessibilityValue = ""
        }
    }
    @IBOutlet weak var lisLabel: UILabel! {
        didSet {
            lisLabel.text = ""
            lisLabel.accessibilityLabel = "LIS"
            lisLabel.accessibilityValue = ""
        }
    }
    
    var viewModel: BalanceViewModel! {
        didSet {
            balanceLabel.text = viewModel.value
            lisLabel.text = viewModel.lis
            balanceLabel.accessibilityValue = viewModel.value
            lisLabel.accessibilityValue = viewModel.lis
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        guard let view = Bundle.main.loadNibNamed("BalanceView", owner: self, options: nil)?.first as? BalanceView else {
            return
        }
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
