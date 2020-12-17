//
//  NoticeBoardProtocols.swift
//  NextEducation
//
//  Created by Ajithram on 17/12/20.
//

import Foundation
import UIKit

protocol NoticeBoardViewProtocol: class {
    var presenter: NoticeBoardPresenterProtocol? { get set }
    
    func initialScreenSetUp()
    func startAnimation()
    func stopAnimation()
}

protocol NoticeBoardPresenterProtocol: class {
    var view: NoticeBoardViewProtocol? { get set }
    var router: NoticeBoardRouterProtocol? { get set }
    var interactor: NoticeBoardInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func downLoadImage(from url: String, name: String?, content: String?)
}

protocol NoticeBoardRouterProtocol: class {
    func navigateToDetailNoticeView(view: NoticeBoardViewProtocol?, image: UIImage?, name: String?, content: String?)
}

protocol NoticeBoardInteractorInputProtocol: class {
    var remoteDataManager: NoticeBoardRemoteDatamanagerInputProtocol? { get set }
    var presenter: NoticeBoardInteractorOutputProtocol? { get set }
    
    func downLoadImage(from url: String, name: String?, content: String?)
}

protocol NoticeBoardRemoteDatamanagerInputProtocol: class {
    var remoteRequestHandler: NoticeBoardRemoteDatamanagerOutputProtocol? { get set }
    
    func downLoadImage(from url: String, name: String?, content: String?)
}

protocol NoticeBoardRemoteDatamanagerOutputProtocol: class {
    func onApiCallSuccess(image: UIImage?, name: String?, content: String?)
    func onApiCallFailure()
}

protocol NoticeBoardInteractorOutputProtocol: class {
    func onApiCallSuccess(image: UIImage?, name: String?, content: String?)
    func onApiCallFailure()
}
