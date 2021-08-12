//
//  FontNamesPickerView.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class FontNamesPickerView: UIPickerView {
    private var collection: [String] = []
    
    public var getFont: (String) -> Void = { (_) in }
    
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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = collection[row]
        getFont(data)
        return data
    }
}

extension FontNamesPickerView: UIPickerViewDelegate { }
