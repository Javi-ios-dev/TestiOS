//
//  SelfieTableViewCell.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//

import UIKit

class SelfieTableViewCell: UITableViewCell {

    static let cellId = "SelfieTableViewCellId"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08)
        selectedBackgroundView = view
    }

}
