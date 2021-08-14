//
//  TextFieldVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 13/08/21.
//

import UIKit

class TextFieldVC: UIViewController {
    
    @IBOutlet weak var viewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var sampleView: UIView!
    @IBOutlet weak var sampleTextField: UITextField!
    
    @IBOutlet weak var textColorCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var fontNamesPickerView: FontNamesPickerView!
    
    @IBOutlet weak var fontSizeTextField: UITextField!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    
    @IBOutlet weak var textAlignmentCollectionView: SelectionCollectionView!
    @IBOutlet weak var textAlignmentCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var placeholderTextField: UITextField!
    
    @IBOutlet weak var borderStyleCollectionView: SelectionCollectionView!
    @IBOutlet weak var borderStyleCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var clearButtonCollectionView: SelectionCollectionView!
    @IBOutlet weak var clearButtonCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var autocapitalizationCollectionView: SelectionCollectionView!
    @IBOutlet weak var autocapitalizationCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var autocorrectionCollectionView: SelectionCollectionView!
    @IBOutlet weak var autocorrectionCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var keyboardTypeCollectionView: SelectionCollectionView!
    @IBOutlet weak var keyboardTypeCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var secureTextEntrySwitch: UISwitch!
    
    private let text: String = "Sample Text"
    private let textColor: UIColor = .blue
    private let fontName: String = "AcademyEngravedLetPlain"
    private let fontSize: CGFloat = 16
    private let textAlignment: NSTextAlignment = .left
    private let placeholder: String = "Placeholder Text"
    private let borderStyle: UITextField.BorderStyle = .roundedRect
    private let clearButtonMode: UITextField.ViewMode = .never
    private let autocapitalizationType: UITextAutocapitalizationType = .none
    private let autocorrectionType: UITextAutocorrectionType = .default
    private let keyboardType: UIKeyboardType = .default
    private let isSecureTextEntry: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Text Field"
        
        sampleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        sampleView.isUserInteractionEnabled = true
        
        sampleTextField.text = text
        
        sampleTextField.textColor = textColor
        textColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        textColorCollectionView.delegate = textColorCollectionView
        textColorCollectionView.dataSource = textColorCollectionView
        textColorCollectionView.selectedColor = textColor
        textColorCollectionView.onTap = { (textColor) in
            self.sampleTextField.textColor = textColor
            self.textColorCollectionView.reloadData()
        }
        
        sampleTextField.font = UIFont(name: fontName, size: sampleTextField.font!.pointSize)
        fontNamesPickerView.delegate = fontNamesPickerView
        fontNamesPickerView.dataSource = fontNamesPickerView
        fontNamesPickerView.initialFontName = fontName
        fontNamesPickerView.getFontNames()
        fontNamesPickerView.getFontName = { (fontName) in
            self.sampleTextField.font = UIFont(name: fontName, size: self.sampleTextField.font!.pointSize)
        }
        
        sampleTextField.font = UIFont(name: sampleTextField.font!.fontName, size: fontSize)
        fontSizeStepper.value = Double(fontSize)
        fontSizeStepper.minimumValue = 1
        fontSizeStepper.maximumValue = 100
        
        sampleTextField.textAlignment = textAlignment
        textAlignmentCollectionView.register(UINib(nibName: SelectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: SelectionCell.identifier)
        textAlignmentCollectionView.delegate = textAlignmentCollectionView
        textAlignmentCollectionView.dataSource = textAlignmentCollectionView
        textAlignmentCollectionView.collection = ["Left", "Center", "Right", "Justified", "Natural"]
        textAlignmentCollectionView.selectedItem = 0 // Left
        textAlignmentCollectionView.onTap = { (item) in
            switch item {
            case 0:
                self.sampleTextField.textAlignment = .left
            case 1:
                self.sampleTextField.textAlignment = .center
            case 2:
                self.sampleTextField.textAlignment = .right
            case 3:
                self.sampleTextField.textAlignment = .justified
            case 4:
                self.sampleTextField.textAlignment = .natural
            default:
                break
            }
            self.textAlignmentCollectionView.reloadData()
        }
        textAlignmentCollectionViewHeight.constant = textAlignmentCollectionView.height
        
        sampleTextField.placeholder = placeholder
        
        sampleTextField.borderStyle = borderStyle
        borderStyleCollectionView.register(UINib(nibName: SelectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: SelectionCell.identifier)
        borderStyleCollectionView.delegate = borderStyleCollectionView
        borderStyleCollectionView.dataSource = borderStyleCollectionView
        borderStyleCollectionView.collection = ["None", "Line", "Bezel", "Rounded Rect"]
        borderStyleCollectionView.selectedItem = 3 // Rounded Rect
        borderStyleCollectionView.onTap = { (item) in
            switch item {
            case 0:
                self.sampleTextField.borderStyle = .none
            case 1:
                self.sampleTextField.borderStyle = .line
            case 2:
                self.sampleTextField.borderStyle = .bezel
            case 3:
                self.sampleTextField.borderStyle = .roundedRect
            default:
                break
            }
            self.borderStyleCollectionView.reloadData()
        }
        borderStyleCollectionViewHeight.constant = borderStyleCollectionView.height
        
        sampleTextField.clearButtonMode = clearButtonMode
        clearButtonCollectionView.register(UINib(nibName: SelectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: SelectionCell.identifier)
        clearButtonCollectionView.delegate = clearButtonCollectionView
        clearButtonCollectionView.dataSource = clearButtonCollectionView
        clearButtonCollectionView.collection = ["Never", "While Editing", "Unless Editing", "Always"]
        clearButtonCollectionView.selectedItem = 0 // Never
        clearButtonCollectionView.onTap = { (item) in
            self.dismissKeyboard()
            switch item {
            case 0:
                self.sampleTextField.clearButtonMode = .never
            case 1:
                self.sampleTextField.clearButtonMode = .whileEditing
            case 2:
                self.sampleTextField.clearButtonMode = .unlessEditing
            case 3:
                self.sampleTextField.clearButtonMode = .always
            default:
                break
            }
            self.sampleTextField.becomeFirstResponder()
            self.clearButtonCollectionView.reloadData()
        }
        clearButtonCollectionViewHeight.constant = clearButtonCollectionView.height
        
        sampleTextField.autocapitalizationType = autocapitalizationType
        autocapitalizationCollectionView.register(UINib(nibName: SelectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: SelectionCell.identifier)
        autocapitalizationCollectionView.delegate = autocapitalizationCollectionView
        autocapitalizationCollectionView.dataSource = autocapitalizationCollectionView
        autocapitalizationCollectionView.collection = ["Default", "No", "Yes"]
        autocapitalizationCollectionView.selectedItem = 0 // Default
        autocapitalizationCollectionView.onTap = { (item) in
            self.dismissKeyboard()
            switch item {
            case 0:
                self.sampleTextField.autocapitalizationType = .none
            case 1:
                self.sampleTextField.autocapitalizationType = .words
            case 2:
                self.sampleTextField.autocapitalizationType = .sentences
            case 3:
                self.sampleTextField.autocapitalizationType = .allCharacters
            default:
                break
            }
            self.sampleTextField.becomeFirstResponder()
            self.autocapitalizationCollectionView.reloadData()
        }
        autocapitalizationCollectionViewHeight.constant = autocapitalizationCollectionView.height
        
        sampleTextField.autocorrectionType = autocorrectionType
        autocorrectionCollectionView.register(UINib(nibName: SelectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: SelectionCell.identifier)
        autocorrectionCollectionView.delegate = autocorrectionCollectionView
        autocorrectionCollectionView.dataSource = autocorrectionCollectionView
        autocorrectionCollectionView.collection = ["Default", "No", "Yes"]
        autocorrectionCollectionView.selectedItem = 0 // Default
        autocorrectionCollectionView.onTap = { (item) in
            self.dismissKeyboard()
            switch item {
            case 0:
                self.sampleTextField.autocorrectionType = .default
            case 1:
                self.sampleTextField.autocorrectionType = .no
            case 2:
                self.sampleTextField.autocorrectionType = .yes
            default:
                break
            }
            self.sampleTextField.becomeFirstResponder()
            self.keyboardTypeCollectionView.reloadData()
        }
        autocorrectionCollectionViewHeight.constant = autocorrectionCollectionView.height
        
        sampleTextField.keyboardType = keyboardType
        keyboardTypeCollectionView.register(UINib(nibName: SelectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: SelectionCell.identifier)
        keyboardTypeCollectionView.delegate = keyboardTypeCollectionView
        keyboardTypeCollectionView.dataSource = keyboardTypeCollectionView
        keyboardTypeCollectionView.collection = ["Default", "ASCII Capable", "Numbers And Punctuation",
                                                 "URL", "Number Pad", "Phone Pad", "Name Phone Pad",
                                                 "Email Address", "Decimal Pad", "Twitter", "Web Search",
                                                 "ASCII Capable Number Pad"]
        keyboardTypeCollectionView.selectedItem = 0 // Default
        keyboardTypeCollectionView.onTap = { (item) in
            self.dismissKeyboard()
            switch item {
            case 0:
                self.sampleTextField.keyboardType = .default
            case 1:
                self.sampleTextField.keyboardType = .asciiCapable
            case 2:
                self.sampleTextField.keyboardType = .numbersAndPunctuation
            case 3:
                self.sampleTextField.keyboardType = .URL
            case 4:
                self.sampleTextField.keyboardType = .numberPad
            case 5:
                self.sampleTextField.keyboardType = .phonePad
            case 6:
                self.sampleTextField.keyboardType = .namePhonePad
            case 7:
                self.sampleTextField.keyboardType = .emailAddress
            case 8:
                self.sampleTextField.keyboardType = .decimalPad
            case 9:
                self.sampleTextField.keyboardType = .twitter
            case 10:
                self.sampleTextField.keyboardType = .webSearch
            case 11:
                self.sampleTextField.keyboardType = .asciiCapableNumberPad
            default:
                break
            }
            self.sampleTextField.becomeFirstResponder()
            self.keyboardTypeCollectionView.reloadData()
        }
        keyboardTypeCollectionViewHeight.constant = keyboardTypeCollectionView.height
        
        sampleTextField.isSecureTextEntry = isSecureTextEntry
        secureTextEntrySwitch.isOn = isSecureTextEntry
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func placeholderChange(_ sender: UITextField) {
        guard let placeholder = sender.placeholder else { return }
        sampleTextField.placeholder = placeholder
    }
    
    @IBAction func fontSizeChange(_ sender: UIStepper) {
        let value = sender.value
        sampleTextField.font = UIFont(name: sampleTextField.font!.fontName, size: CGFloat(value))
        fontSizeTextField.text = "\(Int(value))"
    }
    
    @IBAction func secureTextEntryChange(_ sender: UISwitch) {
        let isOn = sender.isOn
        sampleTextField.isSecureTextEntry = isOn
        secureTextEntrySwitch.isOn = isOn
        
    }
    
    @objc func keyboardWillAppear(notification: NSNotification?) {
        guard let keyboardFrame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return}
        viewBottom.constant = keyboardFrame.cgRectValue.height
    }
    
    @objc func keyboardWillDisappear(notification: NSNotification?) {
        UIView.animate(withDuration: 1) {
            self.viewBottom.constant = .zero
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
