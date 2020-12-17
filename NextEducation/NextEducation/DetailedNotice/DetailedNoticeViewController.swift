//
//  DetailedNoticeViewController.swift
//  NextEducation
//
//  Created by Ajithram on 16/12/20.
//

import UIKit

struct DetailViewModel {
    var name: String?
    var content: String?
    var image: UIImage?
}

class DetailedNoticeViewController: UIViewController {

    @IBOutlet weak var noticeView: UIView!
    @IBOutlet weak var noticeImage: UIImageView!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var noticeContent: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    var data: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentingViewController?.view.alpha = 0.5
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.view.alpha = 1.0
    }
    
    func initialSetup() {
        self.view.backgroundColor = .clear
        noticeView.layer.cornerRadius = 12.0
        attributeNoticeView()
    }
    
    func attributeNoticeView() {
        noticeImage.image = data?.image
        teacherName.text = data?.name
        noticeContent.text = data?.content
    }
    
    @IBAction func didTapDismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
