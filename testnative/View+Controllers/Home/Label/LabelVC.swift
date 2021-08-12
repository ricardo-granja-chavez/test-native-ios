//
//  LabelVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class LabelVC: UIViewController {
    
    @IBOutlet weak var sampleTextLabel: UILabel!
    
    @IBOutlet weak var textTextField: UITextField!
    
    @IBOutlet weak var fontSizeTextField: UITextField!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    
    @IBOutlet weak var colorsCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var fontNamesPickerView: FontNamesPickerView!
    
    @IBOutlet weak var alignmentSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var linesTextField: UITextField!
    @IBOutlet weak var linesStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Label"
        
        sampleTextLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        sampleTextLabel.isUserInteractionEnabled = true
        
        fontSizeStepper.value = 17
        fontSizeStepper.minimumValue = 1
        fontSizeStepper.maximumValue = 100
        
        colorsCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        colorsCollectionView.delegate = colorsCollectionView
        colorsCollectionView.dataSource = colorsCollectionView
        colorsCollectionView.onTap = { (textColor) in
            self.sampleTextLabel.textColor = textColor
            self.colorsCollectionView.reloadData()
        }
        
        fontNamesPickerView.delegate = fontNamesPickerView
        fontNamesPickerView.dataSource = fontNamesPickerView
        fontNamesPickerView.getFontNames()
        fontNamesPickerView.getFont = { (fontName) in
            self.sampleTextLabel.font = UIFont(name: fontName, size: self.sampleTextLabel.font.pointSize)
        }
        
        alignmentSegmentedControl.selectedSegmentIndex = 1
        
        linesStepper.value = 1
        linesStepper.minimumValue = 0
        linesStepper.maximumValue = 100
    }
    
    @IBAction func textChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
        sampleTextLabel.text = text
    }
    
    
    @IBAction func fontSizeChange(_ sender: UIStepper) {
        sampleTextLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
        fontSizeTextField.text = "\(Int(sender.value))"
    }
    
    @IBAction func alignmentChange(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        switch index {
        case 0:
            sampleTextLabel.textAlignment = .left
        case 1:
            sampleTextLabel.textAlignment = .center
        case 2:
            sampleTextLabel.textAlignment = .right
        case 3:
            sampleTextLabel.textAlignment = .justified
        case 4:
            sampleTextLabel.textAlignment = .natural
        default:
            break
        }
    }
    
    @IBAction func linesChange(_ sender: UIStepper) {
        sampleTextLabel.numberOfLines = Int(sender.value)
        linesTextField.text = "\(Int(sender.value))"
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
