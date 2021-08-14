//
//  IconImageCell.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 14/08/21.
//

import UIKit

class IconImageCell: UICollectionViewCell {

    static let identifier = "IconImageCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(image: UIImage?, selected: Bool) {
        iconImageView.image = image != nil ? image : nil
        iconImageView.tintColor = .systemBlue
        iconImageView.layer.cornerRadius = 5
        iconImageView.backgroundColor = selected ? .lightGray : .red
        print(self.contentView.frame)
    }
}
