//
//  HomeViewController.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import UIKit
import MBProgressHUD
import SkeletonView
import RAMAnimatedTabBarController

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var presenter: HomeViewToPresenterProtocol?
    let refreshControl = UIRefreshControl()

    // MARK: - Methods
    init() {
        super.init(nibName: "HomeViewController", bundle: .main)
        let homeTitle = NSLocalizedString("home", comment: "")
        let tabBarItem = RAMAnimatedTabBarItem(title: homeTitle, image: .icon(from: .tabHome, iconColor: .lightGray, imageSize: CGSize(width: 22, height: 22), ofSize: 22), selectedImage: .icon(from: .tabHomeSelected, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22))
        tabBarItem.animation = RAMBounceAnimation()
        self.tabBarItem = tabBarItem
        self.title = homeTitle
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.showAnimatedSkeleton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpRefreshControl()

        setUpTableView()

        presenter?.updateView(pullToRefresh: false)
    }

    private func setUpRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }

    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.isSkeletonable = true
        tableView.refreshControl = refreshControl

        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: .main), forCellReuseIdentifier: "HomeTableViewCell")
    }

    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        presenter?.updateView(pullToRefresh: true)
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

// MARK: - SkeletonTableViewDataSource
extension HomeViewController: SkeletonTableViewDataSource {
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

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "HomeTableViewCell"
    }

    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        let cell = skeletonView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {}

// MARK: - HomePresenterToViewProtocol
extension HomeViewController: HomePresenterToViewProtocol {

    func showSkeleton(_ pullToRefresh: Bool) {
        if pullToRefresh {

        } else {
            MBProgressHUD.showAdded(to: self.view, animated: true)
//            tableView.showAnimatedSkeleton(usingColor: .red)
        }
    }

    func showNews(_ pullToRefresh: Bool) {
        if pullToRefresh {
            refreshControl.endRefreshing()
        } else {
            MBProgressHUD.hide(for: self.view, animated: true)
//            tableView.hideSkeleton()
        }
        tableView.reloadData()
    }

    func showError(_ pullToRefresh: Bool) {
        if pullToRefresh {
            refreshControl.endRefreshing()
        } else {
            MBProgressHUD.hide(for: self.view, animated: true)
//            tableView.hideSkeleton()
        }
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
