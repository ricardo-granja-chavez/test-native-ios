//
//  HomeVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var menuTableView: MenuTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Test Native"
        
        menuTableView.register(UINib(nibName: MenuCell.identifier, bundle: nil), forCellReuseIdentifier: MenuCell.identifier)
        menuTableView.delegate = menuTableView
        menuTableView.dataSource = menuTableView
        menuTableView.rowHeight = MenuCell.height
        menuTableView.onTap = { (item) in
            switch item.type {
            case .label:
                self.navigationController?.pushViewController(LabelVC(), animated: true)
            case .button:
                self.navigationController?.pushViewController(ButtonVC(), animated: true)
            case .textField:
                self.navigationController?.pushViewController(TextFieldVC(), animated: true)
            case .slider:
                self.navigationController?.pushViewController(SliderVC(), animated: true)
            }
        }
    }
}

enum MenuType: String {
    case button = "Button"
    case label = "Label"
    case textField = "Text Field"
    case slider = "Slider"
}
