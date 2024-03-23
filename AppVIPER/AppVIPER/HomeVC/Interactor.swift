//
//  Interactor.swift
//  AppVIPER
//
//  Created by selinay ceylan on 16.03.2024.
//

import Foundation

protocol AnyInteractor {
    
    var presenter : AnyPresenter? {get set}
    
    func downloadElements()
    
}

class MyInteractor :AnyInteractor {
    
    var presenter: AnyPresenter?
    
    func downloadElements() {
        guard let url = URL(string: "https://jsonplaceholder.org/users") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , error == nil else {
                self.presenter?.interactorDownloadsWithView(result: .failure(NetworkError.NetworkFailed))
                return
            }
            
            do {
                let elements = try JSONDecoder().decode([NameJSONElement].self, from: data)
                self.presenter?.interactorDownloadsWithView(result: .success(elements))
            } catch {
                self.presenter?.interactorDownloadsWithView(result: .failure(NetworkError.ParsingFailed))
            }
        }
        task.resume()
    }

}
