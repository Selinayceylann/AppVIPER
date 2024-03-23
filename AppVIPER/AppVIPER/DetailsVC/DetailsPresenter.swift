

import Foundation

protocol AnxPresenter {
    var router :AnxRouter? {get set}
    var interactor : AnxInteractor? {get set}
    var view : AnxView? {get set}
    
}

class DetailsPresenter : AnxPresenter {
    var router: (any AnxRouter)?
    var interactor: (any AnxInteractor)?
    var view: (any AnxView)?

    
    
}
