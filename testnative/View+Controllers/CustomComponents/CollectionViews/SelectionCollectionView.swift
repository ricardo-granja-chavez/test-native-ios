//
//  SelectionCollectionView.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 13/08/21.
//

import UIKit

class SelectionCollectionView: UICollectionView {
    public var collection: [String] = []
    public var onTap: (Int) -> Void = { (_) in }
    public var selectedItem: Int = 0
    public var height: CGFloat {
        get { CGFloat((collection.count + 1) / 2) * SelectionCell.height }
    }
}

extension SelectionCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH / 2, height: SelectionCell.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { 0 }
}

extension SelectionCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        selectedItem = index
        onTap(selectedItem)
    }
}

extension SelectionCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collection.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectionCell.identifier, for: indexPath) as! SelectionCell
        let index = indexPath.item
        let data = collection[index]
        cell.configure(item: data, selected: selectedItem == index)
        return cell
    }
}
