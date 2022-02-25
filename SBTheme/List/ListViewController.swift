//
//  ListViewController.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/25.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(SwitchNightCell())
    }

}
