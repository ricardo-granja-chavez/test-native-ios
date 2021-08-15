//
//  SliderVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 14/08/21.
//

import UIKit

class SliderVC: UIViewController {
    
    @IBOutlet weak var sampleSlider: UISlider!
    
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var valueStepper: UIStepper!
    
    @IBOutlet weak var minimumTextField: UITextField!
    @IBOutlet weak var minimumStepper: UIStepper!
    
    @IBOutlet weak var maximumTextField: UITextField!
    @IBOutlet weak var maximumStepper: UIStepper!
    
    @IBOutlet weak var minImagePickerView: IconImagePickerView!
    
    @IBOutlet weak var maxImagePickerView: IconImagePickerView!
    
    @IBOutlet weak var minColorCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var maxColorCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var thumbColorCollectionView: ColorsCollectionView!
    
    private let value: Float = 0.5
    private let minimumValue: Float = 0
    private let maximumValue: Float = 1
    private let minimumValueImage: UIImage = UIImage()
    private let maximumValueImage: UIImage = UIImage()
    private let minimumTrackTintColor: UIColor = .systemBlue
    private let maximumTrackTintColor: UIColor = .gray
    private let thumbTintColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Slider"
        
        sampleSlider.value = value
        valueStepper.value = Double(value)
        valueStepper.minimumValue = 0
        valueStepper.maximumValue = 1
        valueStepper.stepValue = 0.1
        
        sampleSlider.minimumValue = minimumValue
        minimumStepper.value = Double(minimumValue)
        minimumStepper.minimumValue = 0
        minimumStepper.maximumValue = 99
        minimumStepper.stepValue = 1
        
        sampleSlider.maximumValue = maximumValue
        maximumStepper.value = Double(maximumValue)
        maximumStepper.minimumValue = 1
        maximumStepper.maximumValue = 100
        maximumStepper.stepValue = 1
        
        sampleSlider.minimumValueImage = minimumValueImage
        minImagePickerView.delegate = minImagePickerView
        minImagePickerView.dataSource = minImagePickerView
        minImagePickerView.getIcon = { (minimumValueImage) in
            self.sampleSlider.minimumValueImage = minimumValueImage
        }
        
        sampleSlider.maximumValueImage = maximumValueImage
        maxImagePickerView.delegate = maxImagePickerView
        maxImagePickerView.dataSource = maxImagePickerView
        maxImagePickerView.getIcon = { (maximumValueImage) in
            self.sampleSlider.maximumValueImage = maximumValueImage
        }
        
        sampleSlider.minimumTrackTintColor = minimumTrackTintColor
        minColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        minColorCollectionView.delegate = minColorCollectionView
        minColorCollectionView.dataSource = minColorCollectionView
        minColorCollectionView.selectedColor = minimumTrackTintColor
        minColorCollectionView.onTap = { (minimumTrackTintColor) in
            self.sampleSlider.minimumTrackTintColor = minimumTrackTintColor
            self.minColorCollectionView.reloadData()
        }
        
        sampleSlider.maximumTrackTintColor = maximumTrackTintColor
        maxColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        maxColorCollectionView.delegate = maxColorCollectionView
        maxColorCollectionView.dataSource = maxColorCollectionView
        maxColorCollectionView.selectedColor = maximumTrackTintColor
        maxColorCollectionView.onTap = { (maximumTrackTintColor) in
            self.sampleSlider.maximumTrackTintColor = maximumTrackTintColor
            self.maxColorCollectionView.reloadData()
        }
        
        sampleSlider.thumbTintColor = thumbTintColor
        thumbColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        thumbColorCollectionView.delegate = thumbColorCollectionView
        thumbColorCollectionView.dataSource = thumbColorCollectionView
        thumbColorCollectionView.selectedColor = thumbTintColor
        thumbColorCollectionView.onTap = { (thumbTintColor) in
            self.sampleSlider.thumbTintColor = thumbTintColor
            self.thumbColorCollectionView.reloadData()
        }
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        let value: Double = Double(sender.value)
        valueTextField.text = String(format: "%.1f", value)
    }
    
    @IBAction func valueChange(_ sender: UIStepper) {
        let value = Float(sender.value)
        sampleSlider.value = value
        valueStepper.value = Double(value)
        valueTextField.text = String(format: "%.1f", value)
    }
    
    @IBAction func minimumChange(_ sender: UIStepper) {
        let value: Float = Float(sender.value)
        let sliderValue: Float = sampleSlider.value
        let maximum: Float = sampleSlider.maximumValue
        
        if value < maximum {
            sampleSlider.minimumValue = value
            valueStepper.maximumValue = Double(value)
            minimumTextField.text = "\(Int(value))"
        } else {
            minimumStepper.value = Double(value - 1)
        }
        if Double(sliderValue) < minimumStepper.value {
            sampleSlider.value = Float(minimumStepper.value)
            valueStepper.value = Double(minimumStepper.value)
            valueTextField.text = String(format: "%.1f", minimumStepper.value)
        }
    }
    
    @IBAction func maximumChange(_ sender: UIStepper) {
        let value: Float = Float(sender.value)
        let sliderValue: Float = sampleSlider.value
        let minimum: Float = sampleSlider.minimumValue
        
        if value > minimum {
            sampleSlider.maximumValue = value
            valueStepper.maximumValue = Double(value)
            maximumTextField.text = "\(Int(value))"
        } else {
            maximumStepper.maximumValue = Double(value + 1)
        }
        
        if Double(sliderValue) > maximumStepper.value {
            sampleSlider.value = Float(maximumStepper.value)
            valueStepper.value = Double(sampleSlider.value)
            valueTextField.text = String(format: "%.1f", sampleSlider.value)
        }
        
    }
}
