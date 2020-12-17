//
//  NoticeBoardTableViewController.swift
//  NextEducation
//
//  Created by Ajithram on 16/12/20.
//

import UIKit

class NoticeBoardTableViewController: UITableViewController, NoticeBoardViewProtocol {
    var presenter: NoticeBoardPresenterProtocol?
    var data: [NoticeBoardModel]?
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createActivityIndicator()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        activityIndicator.removeFromSuperview()
    }
    
    func initialScreenSetUp() {
        self.view.backgroundColor = .lightGray
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: "NoticeListTableViewCell", bundle: nil), forCellReuseIdentifier: "NoticeListTableViewCell")
    }

}


extension NoticeBoardTableViewController {
    func createActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 100, y: 0, width: 30, height: 30))
        activityIndicator.style = .medium
        activityIndicator.center = self.view.center
        activityIndicator.isHidden = true
        self.view.addSubview(activityIndicator)
    }
    
    func startAnimation(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    
    func stopAnimation(){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
}

extension NoticeBoardTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let searchResultCell = tableView.dequeueReusableCell(withIdentifier: "NoticeListTableViewCell") as? NoticeListTableViewCell {
                searchResultCell.attributeCellData(data: data?[indexPath.row])
                return searchResultCell
            }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let noticeListCell = tableView.cellForRow(at: indexPath) as? NoticeListTableViewCell {
            presenter?.downLoadImage(from: noticeListCell.data?.imgUrl ?? "", name: noticeListCell.data?.teacherName, content: noticeListCell.data?.noticeText)
        }
    }
}
