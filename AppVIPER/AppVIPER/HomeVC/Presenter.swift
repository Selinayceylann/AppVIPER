

import Foundation

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router :AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDownloadsWithView(result : Result<[NameJSONElement],Error>)
}

class MyPresenter : AnyPresenter {
    
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadElements()
        }
    }
    var view: AnyView?

    func interactorDownloadsWithView(result: Result<[NameJSONElement], Error>) {
        
        switch result {
        case .success(let elements):
            view?.update(with: elements)
        case .failure(let error):
            view?.update(with: "Try again later...")
        }
    }

    
}
