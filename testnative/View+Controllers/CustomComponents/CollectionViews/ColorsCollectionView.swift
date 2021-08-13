//
//  ColorsCollectionView.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class ColorsCollectionView: UICollectionView {
    private let collection: [UIColor] =  [.clear, .black, .blue, .brown, .cyan, .gray,
                                  .green, .magenta, .orange, .purple, .red,
                                  .systemBlue, .systemGreen, .systemIndigo, .systemOrange, .systemPink,
                                  .systemPurple, .systemRed, .systemTeal, .systemYellow, .white, .yellow]
    public var selectedColor: UIColor = .black
    
    public var onTap: (UIColor) -> Void = { (_) in }
}

extension ColorsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}

extension ColorsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        let color = collection[index]
        selectedColor = color
        onTap(selectedColor)
    }
}

extension ColorsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collection.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.identifier, for: indexPath) as! ColorCell
        let index = indexPath.item
        let color = collection[index]
        cell.configure(color: color, selected: selectedColor == color)
        return cell
    }
    
    
}
