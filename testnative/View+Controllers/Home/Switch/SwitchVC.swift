//
//  SwitchVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 15/08/21.
//

import UIKit

class SwitchVC: UIViewController {

    @IBOutlet weak var sampleSwitch: UISwitch!
    
    @IBOutlet weak var onTintColorCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var thumbTintColorCollectionView: ColorsCollectionView!
    
    private let onTintColor: UIColor = .gray
    private let thumbTintColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Switch"
        
        sampleSwitch.onTintColor = onTintColor
        onTintColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        onTintColorCollectionView.delegate = onTintColorCollectionView
        onTintColorCollectionView.dataSource = onTintColorCollectionView
        onTintColorCollectionView.selectedColor = onTintColor
        onTintColorCollectionView.onTap = { (onTintColor) in
            self.sampleSwitch.onTintColor = onTintColor
            self.onTintColorCollectionView.reloadData()
        }
        
        sampleSwitch.thumbTintColor = thumbTintColor
        thumbTintColorCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        thumbTintColorCollectionView.delegate = thumbTintColorCollectionView
        thumbTintColorCollectionView.dataSource = thumbTintColorCollectionView
        thumbTintColorCollectionView.selectedColor = thumbTintColor
        thumbTintColorCollectionView.onTap = { (thumbTintColor) in
            self.sampleSwitch.thumbTintColor = thumbTintColor
            self.thumbTintColorCollectionView.reloadData()
        }
    }

    @IBAction func changeStateAction(_ sender: UIButton) {
        sampleSwitch.setOn(!sampleSwitch.isOn, animated: true)
    }
}
