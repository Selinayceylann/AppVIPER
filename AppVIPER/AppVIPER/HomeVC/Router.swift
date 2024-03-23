
import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry : EntryPoint? {get set}
    static func starting() -> AnyRouter
}

class MyRouter : AnyRouter {
    var entry : EntryPoint?
    static func starting() -> AnyRouter {
        
        let router = MyRouter()
        
        var view : AnyView = MyView()
        var presenter : AnyPresenter = MyPresenter()
        var interactor : AnyInteractor = MyInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    

    
}
