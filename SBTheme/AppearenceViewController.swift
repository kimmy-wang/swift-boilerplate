//
//  DarkModeViewController.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/19.
//

import UIKit
import SnapKit

open class AppearenceViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: AppearenceViewToPresenterProtocol?
    var tableView: UITableView?;
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView = UITableView(frame: UIScreen.main.bounds)
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        label.text = "Label"
        label.textColor = .red
        tableView?.backgroundColor = .red
        self.view.backgroundColor = .white
//        self.view.addSubview(label)
        self.view.addSubview(tableView!)
        tableView!.snp.makeConstraints{ (make) -> Void in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
        }
    }

}

// MARK: - AppearencePresenterToViewProtocol
extension AppearenceViewController: AppearencePresenterToViewProtocol {}
