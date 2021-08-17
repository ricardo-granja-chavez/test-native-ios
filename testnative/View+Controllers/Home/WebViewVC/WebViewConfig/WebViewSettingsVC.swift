//
//  WebViewSettingsVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 17/08/21.
//

import UIKit

protocol WebViewSettingsDelegate: AnyObject {
    func close()
    func changeURL(_ urlString: String)
    func changeBackForwardNavigationGestures(_ backForward: Bool)
    func changeAllowsLinkPreview(_ allows: Bool)
}

class WebViewSettingsVC: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var backForwardGestureSwitch: UISwitch!
    @IBOutlet weak var linkPreviewSwitch: UISwitch!
    
    weak var delegate: WebViewSettingsDelegate?
    private var configure: WebViewSettingsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissView))
        
        urlTextField.text = configure.urlString
        backForwardGestureSwitch.isOn = configure.backForwardGesture
        linkPreviewSwitch.isOn = configure.linkPreview
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let text: String = urlTextField.text else {
            delegate?.close()
            return
        }
        delegate?.changeURL(text)
        dismissView()
    }
    
    @IBAction func backForwardGestureChange(_ sender: UISwitch) {
        let isOn = sender.isOn
        delegate?.changeBackForwardNavigationGestures(isOn)
    }
    
    @IBAction func linkPreviewChange(_ sender: UISwitch) {
        let isOn = sender.isOn
        delegate?.changeAllowsLinkPreview(isOn)
    }
    
    func configure(configure: WebViewSettingsViewModel) {
        self.configure = configure
    }
    
    @objc func dismissView() {
        delegate?.close()
        self.dismiss(animated: true)
    }
}
