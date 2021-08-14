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
    @IBOutlet weak var diagonalLineImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(color: UIColor, selected: Bool) {
        meshView.backgroundColor = selected ? .lightGray : .clear
        meshView.layer.cornerRadius = 5
        
        colorView.backgroundColor = color
        colorView.layer.cornerRadius = colorView.frame.height / 2
        diagonalLineImageView.isHidden = true
        
        if color == .white || color == .yellow {
            colorView.layer.borderWidth = 0.5
            colorView.layer.borderColor = UIColor.black.cgColor
        } else if color == .black {
            colorView.layer.borderWidth = 0.5
            colorView.layer.borderColor = UIColor.gray.cgColor
        } else if color == .clear {
            colorView.layer.borderWidth = 0.5
            colorView.layer.borderColor = UIColor.gray.cgColor
            diagonalLineImageView.isHidden = false
        } else {
            colorView.layer.borderWidth = 0
            colorView.layer.borderColor = nil
        }
    }
}
