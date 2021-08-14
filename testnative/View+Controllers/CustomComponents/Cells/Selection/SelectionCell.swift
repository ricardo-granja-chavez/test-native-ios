//
//  SelectionCell.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 13/08/21.
//

import UIKit

class SelectionCell: UICollectionViewCell {

    static let identifier = "SelectionCell"
    static let height: CGFloat = 50
    
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var selectedtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(item: String, selected: Bool) {
        selectedView.layer.cornerRadius = selectedView.frame.height / 2
        selectedView.layer.borderWidth = selected ? 0 : 2
        selectedView.layer.borderColor = selected ? UIColor.clear.cgColor : UIColor.systemBlue.cgColor
        selectedView.backgroundColor = selected ? .systemBlue : .clear
        
        selectedtitleLabel.text = item
    }
}
