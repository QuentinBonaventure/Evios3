//
//  CustomCryptoCell.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import UIKit
import AlamofireImage

class CustomCryptoCell: UITableViewCell {
    
    static let identifier = "CustomCryptoCell"

    @IBOutlet var logoCrypto: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(crypto: Crypto){
        nameLabel.text = crypto.name
        if let imageUrl = crypto.icon,
           let url = URL(string: imageUrl){
            logoCrypto.af.setImage(withURL: url)
        }else{
            logoCrypto.isHidden = true
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        logoCrypto.af.cancelImageRequest()
        logoCrypto.image = nil
        logoCrypto.isHidden = false
    }
    
}
