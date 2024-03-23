//
//  DetailsView.swift
//  AppVIPER
//
//  Created by selinay ceylan on 19.03.2024.
//

import Foundation
import UIKit

protocol AnxView {
    var presenter : AnxPresenter? {get set}
}

class DetailsView : UIViewController, AnxView {
    var presenter: (any AnxPresenter)?
    
    var name : String = ""
    var email : String = ""
    var birthday : String = ""
    var website : String = ""
    
    private let NameLabel : UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Name:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let EmailLabel : UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Email:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let BirtdayLabel : UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Birthday:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let WebsiteLabel : UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Website:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(NameLabel)
        view.addSubview(EmailLabel)
        view.addSubview(BirtdayLabel)
        view.addSubview(WebsiteLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NameLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 200, width: 200, height: 50)
        EmailLabel.frame = CGRect(x: view.frame.width / 2 - 150, y: view.frame.height / 2 - 150, width: 300, height: 50)
        BirtdayLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 100, width: 200, height: 50)
        WebsiteLabel.frame = CGRect(x: view.frame.width / 2 - 150, y: view.frame.height / 2 - 50, width: 300, height: 50)
        
        NameLabel.text = name
        EmailLabel.text = email
        BirtdayLabel.text = birthday
        WebsiteLabel.text = website
    }
    
}
