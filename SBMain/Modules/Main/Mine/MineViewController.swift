//
//  MineViewController.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import UIKit
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

        if #available(iOS 13.0, *) {
//            NotificationCenter.default.addObserver(self, selector: #selector(updateNightSwitch), name: NSNotification.Name(rawValue: ThemeUpdateNotification), object: nil)
        }
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
    }

    private func setupWebView() {
        webView.uiDelegate = self
        let urlStr = NSLocalizedString("mine_url", comment: "")
        webView.load(URLRequest(url: URL(string: urlStr)!))
    }

    @objc func scanning() {

    }

    @objc func openSettings() {
        presenter?.showSettingsDetail()
    }

    @objc private func updateNightSwitch(notification: Notification) {
        //
        print("updateNightSwitch")
        if #available(iOS 13.0, *) {
            guard let themeDict = notification.userInfo as? [String: UIUserInterfaceStyle] else {
                return
            }
            let theme = themeDict["theme"]
            self.overrideUserInterfaceStyle = theme ?? .unspecified
        } else {
            // Fallback on earlier versions
        }
    }

}

extension MineViewController: WKUIDelegate {

}

// MARK: - HomePresenterToViewProtocol
extension MineViewController: MinePresenterToViewProtocol {}
