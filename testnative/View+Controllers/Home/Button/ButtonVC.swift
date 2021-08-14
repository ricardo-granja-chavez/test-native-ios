//
//  ButtonVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 13/08/21.
//

import UIKit

class ButtonVC: UIViewController {

    @IBOutlet weak var viewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var sampleView: UIView!
    @IBOutlet weak var sampleButton: UIButton!
    
    @IBOutlet weak var sampleTextTextField: UITextField!
    
    @IBOutlet weak var fontNamesPickerView: FontNamesPickerView!
    
    @IBOutlet weak var fontSizeTextField: UITextField!
    @IBOutlet weak var fontSizeStepper: UIStepper!
    
    @IBOutlet weak var textColorCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var iconImagePickerView: IconImagePickerView!
    
    @IBOutlet weak var imageEdgeInsetsTopTextField: UITextField!
    @IBOutlet weak var imageEdgeInsetsTopStepper: UIStepper!
    
    @IBOutlet weak var imageEdgeInsetsLeftTextField: UITextField!
    @IBOutlet weak var imageEdgeInsetsLeftStepper: UIStepper!
    
    @IBOutlet weak var imageEdgeInsetsRightTextField: UITextField!
    @IBOutlet weak var imageEdgeInsetsRightStepper: UIStepper!
    
    @IBOutlet weak var imageEdgeInsetsBottomTextField: UITextField!
    @IBOutlet weak var imageEdgeInsetsBottomStepper: UIStepper!
    
    private let text: String = "Sample Text"
    private let fontName: String = "AcademyEngravedLetPlain"
    private let fontSize: CGFloat = 16
    private let textColor: UIColor = .blue
    private let shadowColor: UIColor = .clear
    private let image: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Button"
        
        sampleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        sampleView.isUserInteractionEnabled = true
        
        sampleButton.setTitle(text, for: .normal)
        
        sampleTextTextField.text = text
        
        sampleButton.titleLabel?.font = UIFont(name: fontName, size: fontSize)
        fontNamesPickerView.delegate = fontNamesPickerView
        fontNamesPickerView.dataSource = fontNamesPickerView
        fontNamesPickerView.initialFontName = fontName
        fontNamesPickerView.getFontNames()
        fontNamesPickerView.getFontName = { (fontName) in
            self.sampleButton.titleLabel?.font = UIFont(name: fontName, size: self.sampleButton.titleLabel!.font.pointSize)
        }
        
        fontSizeStepper.value = Double(fontSize)
        fontSizeStepper.minimumValue = 1
        fontSizeStepper.maximumValue = 100
        
        sampleButton.titleLabel?.textColor = textColor
        textColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        textColorCollectionView.delegate = textColorCollectionView
        textColorCollectionView.dataSource = textColorCollectionView
        textColorCollectionView.selectedColor = textColor
        textColorCollectionView.onTap = { (textColor) in
            self.sampleButton.titleLabel?.textColor = textColor
            self.sampleButton.imageView?.tintColor = textColor
            self.textColorCollectionView.reloadData()
        }
        
        sampleButton.setImage(image, for: .normal)
        iconImagePickerView.delegate = iconImagePickerView
        iconImagePickerView.dataSource = iconImagePickerView
        iconImagePickerView.getIcon = { (image) in
            self.sampleButton.setImage(image, for: .normal)
        }
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
    
    @IBAction func fontSizeChange(_ sender: UIStepper) {
        let value = sender.value
        sampleButton.titleLabel?.font = UIFont(name: sampleButton.titleLabel!.font!.fontName, size: CGFloat(value))
        fontSizeTextField.text = "\(Int(value))"
    }
    
    @IBAction func imageEdgeInsetsTopChange(_ sender: UIStepper) {
        let value = sender.value
        sampleButton.imageEdgeInsets.top = CGFloat(value)
        imageEdgeInsetsTopTextField.text = "\(Int(value))"
    }
    
    @IBAction func imageEdgeInsetsLeftChange(_ sender: UIStepper) {
        let value = sender.value
        sampleButton.imageEdgeInsets.left = CGFloat(value)
        imageEdgeInsetsLeftTextField.text = "\(Int(value))"
    }
    
    @IBAction func imageEdgeInsetsRightChange(_ sender: UIStepper) {
        let value = sender.value
        sampleButton.imageEdgeInsets.right = CGFloat(value)
        imageEdgeInsetsRightTextField.text = "\(Int(value))"
    }
    
    @IBAction func imageEdgeInsetsBottomChange(_ sender: UIStepper) {
        let value = sender.value
        sampleButton.imageEdgeInsets.bottom = CGFloat(value)
        imageEdgeInsetsBottomTextField.text = "\(Int(value))"
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
