//
//  StepperVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 02/10/21.
//

import UIKit

class StepperVC: UIViewController {
    
    @IBOutlet weak var sampleStepper: UIStepper!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var minimumPickerView: NumbersPickerView!
    @IBOutlet weak var maximumPickerView: NumbersPickerView!
    @IBOutlet weak var stepPickerView: NumbersPickerView!
    
    @IBOutlet weak var autorepeatSwitch: UISwitch!
    @IBOutlet weak var continuousSwitch: UISwitch!
    @IBOutlet weak var wrapSwitch: UISwitch!
    
    private var stepperValue: Double = 0
    private var stepperMinimum: Double = 0
    private var stepperMaximum: Double = 0
    private var stepperStep: Double = 1
    
    private var stepperAutorepeat: Bool = true
    private var stepperContinuous: Bool = true
    private var stepperWrap: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Stepper"
        
        sampleStepper.value = self.stepperValue
        valueLabel.text = "\(sampleStepper.value)"
        
        var minimumValues: [Double] = []
        for index in 1...50 {
            minimumValues.append(Double(index))
        }
        sampleStepper.minimumValue = self.stepperMinimum
        minimumPickerView.delegate = minimumPickerView
        minimumPickerView.dataSource = minimumPickerView
        minimumPickerView.collection = minimumValues
        minimumPickerView.getNumber = { (style) in
            self.sampleStepper.minimumValue = style
        }
        
        var maximumValues: [Double] = []
        for index in 1...50 {
            maximumValues.append(Double(index))
        }
        sampleStepper.maximumValue = self.stepperMaximum
        maximumPickerView.delegate = maximumPickerView
        maximumPickerView.dataSource = maximumPickerView
        maximumPickerView.collection = maximumValues
        maximumPickerView.getNumber = { (style) in
            self.sampleStepper.maximumValue = style
        }
        
        var stepValues: [Double] = []
        for index in 1...10 {
            stepValues.append(Double(index))
        }
        sampleStepper.stepValue = self.stepperStep
        stepPickerView.delegate = stepPickerView
        stepPickerView.dataSource = stepPickerView
        stepPickerView.collection = stepValues
        stepPickerView.getNumber = { (style) in
            self.sampleStepper.stepValue = style
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.stepperValue = sender.value
        sampleStepper.value = self.stepperValue
        valueLabel.text = "\(self.stepperValue)"
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        let value = sender.isOn
        
        switch sender {
        case autorepeatSwitch:
            self.stepperAutorepeat = value
            sampleStepper.autorepeat = self.stepperAutorepeat
        case continuousSwitch:
            self.stepperContinuous = value
            sampleStepper.isContinuous = self.stepperContinuous
        case wrapSwitch:
            self.stepperWrap = value
            sampleStepper.wraps = self.stepperWrap
        default:
            break
        }
    }
    
}
