//
//  HomeViewController.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import UIKit
import MBProgressHUD
import KMYElasticPullToRefresh
import RAMAnimatedTabBarController

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var presenter: HomeViewToPresenterProtocol?
    let loadingView = KMYElasticPullToRefreshLoadingViewCircle()
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))

    // MARK: - Methods
    init() {
        super.init(nibName: "HomeViewController", bundle: Bundle(for: type(of: self)))
        let homeTitle = NSLocalizedString("home", comment: "")
        let tabBarItem = RAMAnimatedTabBarItem(title: homeTitle, image: .icon(from: .tabHome, iconColor: .lightGray, imageSize: CGSize(width: 22, height: 22), ofSize: 22), selectedImage: .icon(from: .tabHomeSelected, iconColor: .blue, imageSize: CGSize(width: 22, height: 22), ofSize: 22))
        tabBarItem.animation = RAMBounceAnimation()
        self.tabBarItem = tabBarItem
        self.title = homeTitle
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    deinit {
        tableView.kmy_removePullToRefresh()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTableView()

        presenter?.updateView(pullToRefresh: false, loadMore: false)
    }

    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.kmy_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.presenter?.updateView(pullToRefresh: true, loadMore: false)
        }, loadingView: loadingView)

        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: Bundle(for: type(of: self))), forCellReuseIdentifier: "HomeTableViewCell")
    }

    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        presenter?.updateView(pullToRefresh: true, loadMore: false)
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
        if row == (presenter?.getNewsListCount() ?? 0) - 1 {
            if (presenter?.getNewsListCount() ?? 0) < (presenter?.getCount() ?? 0) {
                tableView.tableFooterView = activityIndicator
                presenter?.updateView(pullToRefresh: false, loadMore: true)
            } else {
                let noMoreDataLabel = UILabel()
                let noMoreDataTitle = NSLocalizedString("no_more_data", comment: "")
                noMoreDataLabel.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
                noMoreDataLabel.text = noMoreDataTitle
                noMoreDataLabel.textAlignment = .center
                noMoreDataLabel.font = UIFont.systemFont(ofSize: 14)
                noMoreDataLabel.textColor = .lightGray
                tableView.tableFooterView = noMoreDataLabel
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
//                    self?.tableView.tableFooterView = nil
//                    self?.tableView.reloadData()
//                }
            }
        }
        let news = presenter?.getNews(index: row)
        guard let title = news?.title, let author = news?.author, let description = news?.description else {
            return cell ?? UITableViewCell()
        }
        cell?.setCell(title: title, author: author, description: description)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = presenter?.getNews(index: indexPath.row)
        presenter?.showNewsDetail(forNews: news!)
    }
}

// MARK: - HomePresenterToViewProtocol
extension HomeViewController: HomePresenterToViewProtocol {

    func showSkeleton(_ pullToRefresh: Bool, loadMore: Bool) {
        if loadMore {
            activityIndicator.startAnimating()
        } else {
            if pullToRefresh {
                tableView.kmy_startLoading()
            } else {
                MBProgressHUD.showAdded(to: self.view, animated: true)
            }
        }
    }

    func showNews(_ pullToRefresh: Bool, loadMore: Bool) {
        if loadMore {
            activityIndicator.stopAnimating()
        } else {
            if pullToRefresh {
                tableView.kmy_stopLoading()
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
        tableView.reloadData()
    }

    func showError(_ pullToRefresh: Bool, loadMore: Bool) {
        if loadMore {
            activityIndicator.stopAnimating()
        } else {
            if pullToRefresh {
                tableView.kmy_stopLoading()
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
