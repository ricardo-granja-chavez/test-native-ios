//
//  LabelVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class LabelVC: UIViewController {
    
    @IBOutlet weak var sampleTextLabel: UILabel!
    
    @IBOutlet weak var sampleTextTextField: UITextField!
    
    @IBOutlet weak var fontSizeTextField: UITextField!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    
    @IBOutlet weak var textColorCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var fontNamesPickerView: FontNamesPickerView!
    
    @IBOutlet weak var alignmentSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var linesTextField: UITextField!
    @IBOutlet weak var linesStepper: UIStepper!
    
    @IBOutlet weak var shadowColorCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var shadowOffsetWidthTextField: UITextField!
    @IBOutlet weak var shadowOffsetWidthStepper: UIStepper!
    
    @IBOutlet weak var shadowOffsetHeightTextField: UITextField!
    @IBOutlet weak var shadowOffsetHeightStepper: UIStepper!
    
    @IBOutlet weak var backgroundColorCollectionView: ColorsCollectionView!
    
    private let text = "Sample Text"
    private let fontSize: CGFloat = 17
    private let textColor: UIColor = .blue
    private let fontName: String = "AcademyEngravedLetPlain"
    private let textAlignment: NSTextAlignment = .center
    private let numberOfLines: Int = 1
    private let shadowColor: UIColor = .black
    private let shadowOffsetWidth: CGFloat = 0
    private let shadowOffsetHeight: CGFloat = -1
    private let backgroundColor: UIColor = .clear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Label"
        
        sampleTextLabel.text = text
        sampleTextLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        sampleTextLabel.isUserInteractionEnabled = true
        sampleTextTextField.text = text
        
        sampleTextLabel.font = UIFont(name: sampleTextLabel.font.fontName, size: fontSize)
        fontSizeStepper.value = Double(fontSize)
        fontSizeStepper.minimumValue = 1
        fontSizeStepper.maximumValue = 100
        
        sampleTextLabel.textColor = textColor
        textColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        textColorCollectionView.delegate = textColorCollectionView
        textColorCollectionView.dataSource = textColorCollectionView
        textColorCollectionView.selectedColor = textColor
        textColorCollectionView.onTap = { (textColor) in
            self.sampleTextLabel.textColor = textColor
            self.textColorCollectionView.reloadData()
        }
        
        sampleTextLabel.font = UIFont(name: fontName, size: sampleTextLabel.font.pointSize)
        fontNamesPickerView.delegate = fontNamesPickerView
        fontNamesPickerView.dataSource = fontNamesPickerView
        fontNamesPickerView.initialFontName = fontName
        fontNamesPickerView.getFontNames()
        fontNamesPickerView.getFontName = { (fontName) in
            self.sampleTextLabel.font = UIFont(name: fontName, size: self.sampleTextLabel.font.pointSize)
        }
        
        sampleTextLabel.textAlignment = textAlignment
        alignmentSegmentedControl.selectedSegmentIndex = 1
        
        sampleTextLabel.numberOfLines = numberOfLines
        linesStepper.value = Double(numberOfLines)
        linesStepper.minimumValue = 0
        linesStepper.maximumValue = 100
        
        sampleTextLabel.shadowColor = shadowColor
        shadowColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        shadowColorCollectionView.delegate = shadowColorCollectionView
        shadowColorCollectionView.dataSource = shadowColorCollectionView
        shadowColorCollectionView.selectedColor = shadowColor
        shadowColorCollectionView.onTap = { (shadowColor) in
            self.sampleTextLabel.shadowColor = shadowColor
            self.shadowColorCollectionView.reloadData()
        }
        
        shadowOffsetWidthTextField.text = "\(Int(shadowOffsetWidth))"
        sampleTextLabel.shadowOffset.width = shadowOffsetWidth
        shadowOffsetWidthStepper.value = Double(sampleTextLabel.shadowOffset.width)
        shadowOffsetWidthStepper.minimumValue = -50
        shadowOffsetWidthStepper.maximumValue = 50
        
        shadowOffsetHeightTextField.text = "\(Int(shadowOffsetHeight))"
        sampleTextLabel.shadowOffset.height = shadowOffsetHeight
        shadowOffsetHeightStepper.value = Double(sampleTextLabel.shadowOffset.width)
        shadowOffsetHeightStepper.minimumValue = -50
        shadowOffsetHeightStepper.maximumValue = 50
        
        sampleTextLabel.backgroundColor = backgroundColor
        backgroundColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        backgroundColorCollectionView.delegate = backgroundColorCollectionView
        backgroundColorCollectionView.dataSource = backgroundColorCollectionView
        backgroundColorCollectionView.selectedColor = backgroundColor
        backgroundColorCollectionView.onTap = { (backgroundColor) in
            self.sampleTextLabel.backgroundColor = backgroundColor
            self.backgroundColorCollectionView.reloadData()
        }
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
    
    @IBAction func shadowWidthChange(_ sender: UIStepper) {
        sampleTextLabel.shadowOffset.width = CGFloat(sender.value)
        shadowOffsetWidthTextField.text = "\(Int(sender.value))"
    }
    
    @IBAction func shadowHeightWidthChange(_ sender: UIStepper) {
        sampleTextLabel.shadowOffset.height = CGFloat(sender.value)
        shadowOffsetHeightTextField.text = "\(Int(sender.value))"
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
