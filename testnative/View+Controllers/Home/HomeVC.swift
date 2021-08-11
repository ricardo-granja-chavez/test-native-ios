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
        menuTableView.collection = [MenuViewModel(image: UIImage(systemName: "textformat.alt")!,
                                                  type: .label)]
        menuTableView.onTap = { (item) in
            switch item.type {
            case .label:
                break
            }
        }
    }

}