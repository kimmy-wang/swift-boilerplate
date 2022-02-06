//
//  MineViewController.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import UIKit
import RAMAnimatedTabBarController

class MineViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var presenter: MineViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarItem = RAMAnimatedTabBarItem()
        self.tabBarItem.title = "Mine"
        self.tabBarItem.image = .icon(from: .TabMine, iconColor: .lightGray, imageSize: CGSize(width: 22, height: 22), ofSize: 22)
        self.tabBarItem.selectedImage = .icon(from: .TabMineSelected, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22)

        // Do any additional setup after loading the view.
        setUpTableView()
        
        presenter?.updateView()
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: .main), forCellReuseIdentifier: "HomeTableViewCell")
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

// MARK: - UITableViewDataSource
extension MineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNewsListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell
        let row = indexPath.row
        let news = presenter?.getNews(index: row)
        guard let title = news?.title, let author = news?.author, let description = news?.description else {
            return cell ?? UITableViewCell()
        }
        cell?.setCell(title: title, author: author, description: description)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension MineViewController: UITableViewDelegate {}

// MARK: - HomePresenterToViewProtocol
extension MineViewController: MinePresenterToViewProtocol {

    func showNews() {
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
