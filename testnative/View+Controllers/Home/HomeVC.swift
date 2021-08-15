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
            case .Button:
                self.navigationController?.pushViewController(ButtonVC(), animated: true)
            case .Label:
                self.navigationController?.pushViewController(LabelVC(), animated: true)
            case .Slider:
                self.navigationController?.pushViewController(SliderVC(), animated: true)
            case .Switch:
                self.navigationController?.pushViewController(SwitchVC(), animated: true)
            case .TextField:
                self.navigationController?.pushViewController(TextFieldVC(), animated: true)
            }
        }
    }
}

enum MenuType: String {
    case Button = "Button"
    case Label = "Label"
    case TextField = "Text Field"
    case Slider = "Slider"
    case Switch = "Switch"
}
