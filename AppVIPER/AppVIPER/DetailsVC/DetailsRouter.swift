//
//  DetailsRouter.swift
//  AppVIPER
//
//  Created by selinay ceylan on 19.03.2024.
//

import Foundation

protocol AnxRouter {
    static func details() -> AnxRouter
}

class DetailsRouter : AnxRouter {
    static func details() -> any AnxRouter {
        let router = DetailsRouter()
        
        var view : AnxView = DetailsView()
        var presenter : AnxPresenter = DetailsPresenter()
        var interactor : AnxInteractor = DetailsInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return router
    }
    
    
}
