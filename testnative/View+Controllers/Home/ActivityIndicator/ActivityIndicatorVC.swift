//
//  ActivityIndicatorVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 01/10/21.
//

import UIKit

class ActivityIndicatorVC: UIViewController {

    @IBOutlet weak var sampleActivityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var styleActivityPickerView: ActivityIndicatorStylePickerView!
    
    @IBOutlet weak var colorActivityCollectionView: ColorsCollectionView!
    
    @IBOutlet weak var hideWhenStopeedSwitch: UISwitch!
    
    private var activityStyle: UIActivityIndicatorView.Style = .medium
    private var activityColor: UIColor = .gray
    private var activityHideWhenStopeed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleActivityIndicatorView.style = self.activityStyle
        styleActivityPickerView.delegate = styleActivityPickerView
        styleActivityPickerView.dataSource = styleActivityPickerView
        styleActivityPickerView.getStyle = { (style) in
            self.sampleActivityIndicatorView.style = style
        }
        
        sampleActivityIndicatorView.color = self.activityColor
        colorActivityCollectionView.register(UINib(nibName: ColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        colorActivityCollectionView.delegate = colorActivityCollectionView
        colorActivityCollectionView.dataSource = colorActivityCollectionView
        colorActivityCollectionView.selectedColor = activityColor
        colorActivityCollectionView.onTap = { (activityColor) in
            self.activityColor = activityColor
            self.sampleActivityIndicatorView.color = self.activityColor
            self.colorActivityCollectionView.reloadData()
        }
        
        sampleActivityIndicatorView.hidesWhenStopped = self.activityHideWhenStopeed
    }

    @IBAction func onOffActivityIndicatorAction(_ sender: UIButton) {
        let tag = sender.tag
        
        switch tag {
        case 98:
            sampleActivityIndicatorView.startAnimating()
        case 99:
            sampleActivityIndicatorView.stopAnimating()
        default:
            break
        }
    }
    
    @IBAction func hideWhenStopeedChange(_ sender: UISwitch) {
        self.activityHideWhenStopeed = sender.isOn
        sampleActivityIndicatorView.hidesWhenStopped = self.activityHideWhenStopeed
    }
}
