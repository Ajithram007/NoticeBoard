//
//  NoticeBoardInteractor.swift
//  NextEducation
//
//  Created by Ajithram on 17/12/20.
//

import Foundation
import UIKit

class NoticeBoardInteractor: NoticeBoardInteractorInputProtocol {
    var remoteDataManager: NoticeBoardRemoteDatamanagerInputProtocol?
    weak var presenter: NoticeBoardInteractorOutputProtocol?
    
    func downLoadImage(from url: String, name: String?, content: String?) {
        remoteDataManager?.downLoadImage(from: url, name: name, content: content)
    }
    
}

extension NoticeBoardInteractor: NoticeBoardRemoteDatamanagerOutputProtocol {
    func onApiCallSuccess(image: UIImage?, name: String?, content: String?) {
        presenter?.onApiCallSuccess(image: image, name: name, content: content)
    }
    
    func onApiCallFailure() {
        presenter?.onApiCallFailure()
    }
}
