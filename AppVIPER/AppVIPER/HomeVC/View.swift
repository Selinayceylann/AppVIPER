//
//  View.swift
//  AppVIPER
//
//  Created by selinay ceylan on 16.03.2024.
//

import Foundation
import UIKit

protocol AnyView {
    
    var presenter : AnyPresenter? {get set}
    
    func update(with elements : [NameJSONElement])
    func update(with error : String)
    
}

class MyView : UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    var presenter: AnyPresenter?
    var elements : [NameJSONElement] = []
    var filteredElements = [NameJSONElement]()
    
    
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private let searchControllerr : UISearchController = {
        let search = UISearchController()
        search.searchBar.tintColor = .systemPink
        search.searchBar.placeholder = "Search"
        return search
    }()
    
    private let messageLabel : UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchControllerr.searchBar.delegate = self
        navigationItem.searchController = searchControllerr
        searchControllerr.searchResultsUpdater = self
        searchControllerr.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchControllerr.searchBar

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)
        searchControllerr.searchBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 50)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let text = searchControllerr.searchBar.text!

    }
        
    
    
    func update(with elements: [NameJSONElement]) {
        DispatchQueue.main.async {
            self.elements = elements
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        self.elements = []
            self.tableView.isHidden = true
            self.messageLabel.text = error
        self.messageLabel.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        var element : NameJSONElement
        if isFiltering() {
            element = filteredElements[indexPath.row]
        } else {
            element = elements[indexPath.row]
        }
        content.text = element.firstname
        content.secondaryText = element.email
        cell.contentConfiguration = content
        cell.backgroundColor = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredElements.count
        }
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedElement : NameJSONElement
        if isFiltering() {
            selectedElement = filteredElements[indexPath.row]
        } else {
            selectedElement = elements[indexPath.row]
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text?.lowercased() {
            filteredElements = elements.filter { $0.firstname.lowercased().hasPrefix(searchText.lowercased())
            }
            tableView.reloadData()
        }
    }
    
    func isFiltering() -> Bool {
            return searchControllerr.isActive && !isSearchBarEmpty()
        }
        
    func isSearchBarEmpty() -> Bool {
            return searchControllerr.searchBar.text?.isEmpty ?? true
        }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsView()
        detailsViewController.birthday = elements[indexPath.row].birthDate
        detailsViewController.email = elements[indexPath.row].email
        detailsViewController.name = elements[indexPath.row].firstname
        detailsViewController.website = elements[indexPath.row].website
        self.present(detailsViewController, animated: true, completion: nil)
    }
}
