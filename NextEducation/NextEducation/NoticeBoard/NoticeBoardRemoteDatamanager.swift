//
//  NoticeBoardRemoteDatamanager.swift
//  NextEducation
//
//  Created by Ajithram on 17/12/20.
//

import Foundation
import UIKit

class NoticeBoardRemoteDataManager: NoticeBoardRemoteDatamanagerInputProtocol {
    weak var remoteRequestHandler: NoticeBoardRemoteDatamanagerOutputProtocol?
    
    func downLoadImage(from url: String, name: String?, content: String?) {
        guard let imageURL = URL(string: url) else {
            remoteRequestHandler?.onApiCallFailure()
            return
        }
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {
                self.remoteRequestHandler?.onApiCallFailure()
                return
            }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.remoteRequestHandler?.onApiCallSuccess(image: image, name: name, content: content)
            }
        }
    }
    
}
