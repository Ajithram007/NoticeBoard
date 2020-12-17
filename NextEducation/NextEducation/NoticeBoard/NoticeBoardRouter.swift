//
//  NoticeBoardRouter.swift
//  NextEducation
//
//  Created by Ajithram on 17/12/20.
//

import Foundation
import UIKit

class NoticeBoardRouter: NSObject, NoticeBoardRouterProtocol {
    class func createNoticeBoard(data: [NoticeBoardModel]?) -> UITableViewController {
        let view = NoticeBoardTableViewController()
        let presenter: NoticeBoardPresenterProtocol & NoticeBoardInteractorOutputProtocol = NoticeBoardPresenter()
        let router: NoticeBoardRouterProtocol = NoticeBoardRouter()
        let interactor: NoticeBoardInteractorInputProtocol & NoticeBoardRemoteDatamanagerOutputProtocol = NoticeBoardInteractor()
        let remoteDataManager: NoticeBoardRemoteDatamanagerInputProtocol = NoticeBoardRemoteDataManager()
        
        view.data = data
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        return view
    }
    
    func navigateToDetailNoticeView(view: NoticeBoardViewProtocol?, image: UIImage?, name: String?, content: String?) {
        if let view = view as? NoticeBoardTableViewController {
            let detailView = DetailedNoticeViewController()
            detailView.data = DetailViewModel.init(name: name, content: content, image: image)
            detailView.modalPresentationStyle = .overFullScreen
            view.present(detailView, animated: true, completion: nil)
        }
    }
}
