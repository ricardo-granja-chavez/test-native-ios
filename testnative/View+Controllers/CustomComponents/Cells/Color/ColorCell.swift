//
//  ColorCell.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    static let identifier: String = "ColorCell"
    static let height: CGFloat = 50
    
    @IBOutlet weak var meshView: UIView!
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        meshView.layer.cornerRadius = 5
        colorView.layer.cornerRadius = colorView.frame.height / 2
    }
    
    func configure(color: UIColor, selected: Bool) {
        meshView.backgroundColor = selected ? .lightGray : .clear
        colorView.backgroundColor = color
        
        if color == .white || color == .yellow {
            colorView.layer.borderWidth = 0.5
            colorView.layer.borderColor = UIColor.black.cgColor
        } else {
            colorView.layer.borderWidth = 0
            colorView.layer.borderColor = nil
        }
    }
}
