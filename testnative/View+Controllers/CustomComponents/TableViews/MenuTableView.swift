//
//  MenuTableView.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class MenuTableView: UITableView {
    private let collection: [MenuViewModel] = [MenuViewModel(image: UIImage(systemName: "hand.tap.fill")!,
                                                             type: .button),
                                               MenuViewModel(image: UIImage(systemName: "textformat.alt")!,
                                                             type: .label),
                                               MenuViewModel(image: UIImage(systemName: "text.cursor")!,
                                                             type: .textField)]
    public var onTap: (MenuViewModel) -> Void = { (_) in}
}

extension MenuTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let data = collection[index]
        onTap(data)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MenuTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { collection.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
        let index = indexPath.row
        let data = collection[index]
        cell.configure(data: data)
        return cell
    }
    
}
