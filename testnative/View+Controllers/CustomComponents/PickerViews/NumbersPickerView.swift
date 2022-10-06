//
//  NumbersPickerView.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 03/10/21.
//

import UIKit

class NumbersPickerView: UIPickerView {
    public var collection: [Double] = []
    public var getNumber: (Double) -> Void = { (_) in }
}

extension NumbersPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { collection.count }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { String(collection[row]) }
}

extension NumbersPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { getNumber(collection[row]) }
}
