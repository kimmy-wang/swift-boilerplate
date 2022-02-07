//
//  HomeViewController.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var presenter: HomeViewToPresenterProtocol?
    
    // MARK: - Methods
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = "Home"
        self.tabBarItem.image = .icon(from: .TabHome, iconColor: .lightGray, imageSize: CGSize(width: 22, height: 22), ofSize: 22)
        self.tabBarItem.selectedImage = .icon(from: .TabHomeSelected, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
extension HomeViewController: UITableViewDataSource {
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
extension HomeViewController: UITableViewDelegate {}

// MARK: - HomePresenterToViewProtocol
extension HomeViewController: HomePresenterToViewProtocol {

    func showNews() {
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
