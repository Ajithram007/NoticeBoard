//
//  NoticeBoardModel.swift
//  NextEducation
//
//  Created by Ajithram on 16/12/20.
//

import Foundation

struct NoticeBoardModel: Decodable {
    var title: String?
    var dateWithTime: String?
    var imgUrl: String?
    var noticeText: String?
    var teacherName: String?
}
