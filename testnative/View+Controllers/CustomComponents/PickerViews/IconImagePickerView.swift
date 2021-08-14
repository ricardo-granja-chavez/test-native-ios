//
//  IconImagePickerView.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 14/08/21.
//

import UIKit

class IconImagePickerView: UIPickerView {
    private let collection: [UIImage?] = [UIImage(),UIImage(systemName: "pencil"),UIImage( systemName: "scribble"),
                                          UIImage( systemName: "highlighter"),UIImage(systemName: "lasso"), UIImage( systemName: "trash"),
                                          UIImage( systemName: "folder"),UIImage(systemName: "esim"), UIImage( systemName: "sdcard"),
                                          UIImage( systemName: "touchid"),UIImage(systemName: "bonjour"), UIImage( systemName: "atom"),
                                          UIImage( systemName: "scalemass"),UIImage(systemName: "headphones"), UIImage( systemName: "gift"),
                                          UIImage( systemName: "appclip"),UIImage(systemName: "airplane"), UIImage( systemName: "studentdesk"),
                                          UIImage( systemName: "hourglass"),UIImage(systemName: "banknote"), UIImage( systemName: "paragraphsign"),
                                          UIImage( systemName: "purchased"),UIImage(systemName: "perspective"), UIImage( systemName: "aspectratio"),
                                          UIImage( systemName: "skew"),UIImage(systemName: "grid"), UIImage( systemName: "burn"),
                                          UIImage( systemName: "lightbulb"),UIImage(systemName: "character"), UIImage( systemName: "abc"),
                                          UIImage( systemName: "textformat"),UIImage(systemName: "bold"), UIImage( systemName: "italic"),
                                          UIImage( systemName: "underline"),UIImage(systemName: "strikethrough"), UIImage( systemName: "shadow"),
                                          UIImage( systemName: "fx"),UIImage(systemName: "k"), UIImage( systemName: "sum"),
                                          UIImage( systemName: "percent"),UIImage(systemName: "function"), UIImage( systemName: "fn"),
                                          UIImage( systemName: "info"),UIImage(systemName: "at"), UIImage( systemName: "plus"),
                                          UIImage( systemName: "minus"),UIImage(systemName: "plusminus"), UIImage( systemName: "multiply"),
                                          UIImage( systemName: "divide"),UIImage(systemName: "equal"), UIImage( systemName: "lessthan"),
                                          UIImage( systemName: "greaterthan"),UIImage(systemName: "curlybraces"), UIImage( systemName: "number"),
                                          UIImage( systemName: "xmark"),UIImage(systemName: "control"), UIImage( systemName: "projective")]
    
    public var getIcon: (UIImage?) -> Void = { (_) in }
}

extension IconImagePickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { collection.count }
}

extension IconImagePickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var myImageView = UIImageView()
        let data = collection[row]
        myImageView = UIImageView(image: data)
        return myImageView
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let data = collection[row]
        getIcon(data)
    }
}
