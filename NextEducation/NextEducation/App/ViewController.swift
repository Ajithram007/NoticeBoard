//
//  ViewController.swift
//  NextEducation
//
//  Created by Ajithram on 16/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapNoticeButton(_ sender: UIButton) {
        testData()
//       makeApiService()
    }
    
    func apiSuccess(model: [NoticeBoardModel]?) {
        let noticeBoardView = NoticeBoardRouter.createNoticeBoard(data: model)
        self.navigationController?.pushViewController(noticeBoardView, animated: true)
    }
    
}

extension ViewController {
    func testData() {
        let data = Data(getData().utf8)
        if let noticeBoardData = try? JSONDecoder().decode([NoticeBoardModel].self, from: data){
            self.apiSuccess(model: noticeBoardData)
        }
    }
    
    func getData() -> String {
        return """
            [
               {
                  "title":"Annual day celebration",
                  "dateWithTime":"26th November 10:00AM - 3:00PM",
                  "imgUrl":"https://picsum.photos/300/300",
                  "noticeText":"We are planning for a massive celebration this year….",
                  "teacherName":"Ajithram"
               },
               {
                  "title":"Sports day celebration",
                  "dateWithTime":"30th November 10:00AM - 3:00PM",
                  "imgUrl":"https://picsum.photos/300/300",
                  "noticeText":"We are planning for a massive celebration this year….",
                  "teacherName":"Ajithram"
               },
               {
                  "title":"Parents Teachers meeting",
                  "dateWithTime":"26th October 10:00AM - 3:00PM",
                  "imgUrl":"https://picsum.photos/300/300",
                  "noticeText":"We are planning for a massive celebration this year….",
                  "teacherName":"Ajithram"
               },
               {
                  "title":"Fun Friday ",
                  "dateWithTime":"20th November 10:00AM - 3:00PM",
                  "imgUrl":"https://picsum.photos/300/300",
                  "noticeText":"We are planning for a massive celebration this year….",
                  "teacherName":"Ajithram"
               },
               {
                  "title":"Annual day celebration",
                  "dateWithTime":"26th November 10:00AM - 3:00PM",
                  "imgUrl":"https://picsum.photos/300/300",
                  "noticeText":"We are planning for a massive celebration this year….",
                  "teacherName":"Ajithram"
               },
               {
                  "title":"Annual day celebration",
                  "dateWithTime":"26th November 10:00AM - 3:00PM",
                  "imgUrl":"https://picsum.photos/300/300",
                  "noticeText":"We are planning for a massive celebration this year….",
                  "teacherName":"Ajithram"
               },
               {
                  "title":"Annual day celebration",
                  "dateWithTime":"26th November 10:00AM - 3:00PM",
                  "imgUrl":"https://picsum.photos/300/300",
                  "noticeText":"We are planning for a massive celebration this year….",
                  "teacherName":"Ajithram"
               }
            ]
"""
    }
}



extension ViewController {
    func makeApiService(url: String) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let mydata = data {
                print(mydata)
                if let noticeBoardData = try? JSONDecoder().decode([NoticeBoardModel].self, from: mydata){
                    DispatchQueue.main.async {
                        self.apiSuccess(model: noticeBoardData)
                    }
                    return
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
