//
//  ActivityIndicatorStyleCollectionView.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 01/10/21.
//

import UIKit

class ActivityIndicatorStylePickerView: UIPickerView {
    private let collection: [UIActivityIndicatorView.Style] = [.medium, .large]
    public var getStyle: (UIActivityIndicatorView.Style) -> Void = { (_) in }
}

extension ActivityIndicatorStylePickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { collection.count }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch collection[row] {
        case .large:
            return "large"
        case .medium:
            return "medium"
        default:
            return nil
        }
    }
}

extension ActivityIndicatorStylePickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { getStyle(collection[row]) }
}
