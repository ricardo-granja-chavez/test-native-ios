//
//  WebViewVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 16/08/21.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    @IBOutlet weak var sampleWebView: WKWebView!
    
    private var urlString: String = "" {
        didSet {
            let url = URL(string: urlString)!
            sampleWebView.load(URLRequest(url: url))
        }
    }
    private var backForwardGesture: Bool = false {
        didSet {
            sampleWebView.allowsBackForwardNavigationGestures = backForwardGesture
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = !backForwardGesture
        }
    }
    private var allowsLinkPreview: Bool = false {
        didSet {
            sampleWebView.allowsLinkPreview = allowsLinkPreview
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Web View"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(openSettings))
        
        urlString = "https://www.apple.com/mx"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    @objc func openSettings() {
        let vc = WebViewSettingsVC()
        let configure = WebViewSettingsViewModel(urlString: urlString,
                                                 backForwardGesture: backForwardGesture,
                                                 linkPreview: allowsLinkPreview)
        vc.configure(configure: configure)
        vc.delegate = self
        self.present(UINavigationController(rootViewController: vc), animated: true)
    }
}

extension WebViewVC: WebViewSettingsDelegate {
    func changeURL(_ urlString: String) {
        self.urlString = urlString
    }
    
    func changeBackForwardNavigationGestures(_ backForward: Bool) {
        self.backForwardGesture = backForward
    }
    
    func changeAllowsLinkPreview(_ allows: Bool) {
        self.allowsLinkPreview = allows
    }
    
    func close() {
        print("close")
    }
}
