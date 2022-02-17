//
//  MineViewController.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import UIKit
import SBFonts
import WebKit
import RAMAnimatedTabBarController

class MineViewController: UIViewController {

    // MARK: - Properties
    var presenter: MineViewToPresenterProtocol?
    var webView: WKWebView!

    // MARK: - Methods
    init() {
        super.init(nibName: nil, bundle: .main)
        let mineTitle = NSLocalizedString("mine", comment: "")
        let tabBarItem = RAMAnimatedTabBarItem(title: mineTitle, image: .icon(from: .tabMine, iconColor: .lightGray, imageSize: CGSize(width: 22, height: 22), ofSize: 22), selectedImage: .icon(from: .tabMineSelected, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22))
        tabBarItem.animation = RAMBounceAnimation()
        self.tabBarItem = tabBarItem
        self.title = mineTitle
        let scanningButtonItem = UIBarButtonItem(image: .icon(from: .scanning, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22), style: .plain, target: self, action: #selector(scanning))
        let settingsButtonItem = UIBarButtonItem(image: .icon(from: .settings, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22), style: .plain, target: self, action: #selector(openSettings))
        self.navigationItem.rightBarButtonItems = [scanningButtonItem, settingsButtonItem]
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func loadView() {
        let webViewConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupWebView()

//        presenter?.updateView()
    }

    private func setupWebView() {
        webView.uiDelegate = self
        let urlStr = NSLocalizedString("mine_url", comment: "")
        webView.load(URLRequest(url: URL(string: urlStr)!))
    }

    @objc func scanning() {

    }

    @objc func openSettings() {
        self.navigationController?.pushViewController(SettingsViewController(), animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MineViewController: WKUIDelegate {

}

// MARK: - HomePresenterToViewProtocol
extension MineViewController: MinePresenterToViewProtocol {

    func showNews() {

    }

    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
