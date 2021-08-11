//
//  MenuCell.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class MenuCell: UITableViewCell {

    static let identifier: String = "MenuCell"
    static let height: CGFloat = 50
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: MenuViewModel) {
        iconImageView.image = data.image
        titleLabel.text = data.type.rawValue
    }
}
