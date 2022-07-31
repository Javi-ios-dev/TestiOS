//
//  ChartsView.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//

import Foundation
import ARKit

class ChartsView: UIView {
    
    let collectionView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(PieChartTableViewCell.self, forCellReuseIdentifier: PieChartTableViewCell.cellId)
        tableView.separatorStyle = .none
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // add views and constraints
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        backgroundColor = .white
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
