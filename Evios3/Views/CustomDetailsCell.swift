//
//  CustomDetailsCell.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import UIKit

class CustomDetailsCell: UITableViewCell {
    
    static let identifier = "CustomDetailsCell"

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCrypto(historic: Historic){
        valueLabel.text = historic.priceUsd
        dateLabel.text = historic.date
    }
    
}
