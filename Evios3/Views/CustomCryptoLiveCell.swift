//
//  CustomCryptoLiveCell.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import UIKit

class CustomCryptoLiveCell: UITableViewCell {
    
    static let identifier = "CustomCryptoLiveCell"

    @IBOutlet var evolutionLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var infoButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var rankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(cryptoLive: CryptoLive){
        rankLabel.text? = cryptoLive.rank
        nameLabel.text = cryptoLive.name
        valueLabel.text = cryptoLive.value
        evolutionLabel.text = cryptoLive.evolution
        
    }
    
}
