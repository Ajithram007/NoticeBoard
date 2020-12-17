//
//  NoticeListTableViewCell.swift
//  NextEducation
//
//  Created by Ajithram on 16/12/20.
//

import UIKit

class NoticeListTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    
    var data: NoticeBoardModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.baseView.layer.cornerRadius = 12.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func attributeCellData(data: NoticeBoardModel?) {
        if let noticeListData = data {
            titleLabel.text = noticeListData.title
            dateAndTimeLabel.text = noticeListData.dateWithTime
            self.data = noticeListData
        }
    }
    
    
}
