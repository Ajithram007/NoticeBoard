//
//  NoticeBoardPresenter.swift
//  NextEducation
//
//  Created by Ajithram on 17/12/20.
//

import Foundation
import UIKit

class NoticeBoardPresenter: NoticeBoardPresenterProtocol {
    weak var view: NoticeBoardViewProtocol?
    var router: NoticeBoardRouterProtocol?
    var interactor: NoticeBoardInteractorInputProtocol?
    
    func viewDidLoad() {
        view?.initialScreenSetUp()
    }
    
    func downLoadImage(from url: String, name: String?, content: String?) {
        view?.startAnimation()
        interactor?.downLoadImage(from: url, name: name, content: content)
    }
    
}

extension NoticeBoardPresenter: NoticeBoardInteractorOutputProtocol {
    func onApiCallSuccess(image: UIImage?, name: String?, content: String?) {
        view?.stopAnimation()
        router?.navigateToDetailNoticeView(view: view, image: image, name: name, content: content)
    }
    
    func onApiCallFailure() {
        view?.stopAnimation()
    }
}
