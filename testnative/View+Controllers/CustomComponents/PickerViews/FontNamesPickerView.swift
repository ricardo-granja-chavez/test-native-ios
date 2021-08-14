//
//  FontNamesPickerView.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class FontNamesPickerView: UIPickerView {
    private var collection: [String] = []
    
    public var initialFontName: String = ""
    public var getFontName: (String) -> Void = { (_) in }
    
    func getFontNames() {
        UIFont.familyNames.forEach { (family) in
            UIFont.fontNames(forFamilyName: family).forEach { (font) in
                collection.append(font)
            }
        }
    }
}

extension FontNamesPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { collection.count }
}

extension FontNamesPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        guard let pickerLabel: UILabel = (view as? UILabel) else {
            let pickerLabel = UILabel()
            pickerLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            pickerLabel.textAlignment = .center
            pickerLabel.text = collection[row]
            pickerLabel.textColor = .label
            return pickerLabel
        }
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let data = collection[row]
        getFontName(data)
    }
}
