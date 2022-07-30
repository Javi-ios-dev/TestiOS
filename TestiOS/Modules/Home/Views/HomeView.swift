//
//  HomeView.swift
//  TestiOS
//
//  Created by javier apaez on 29/07/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.cellId)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
