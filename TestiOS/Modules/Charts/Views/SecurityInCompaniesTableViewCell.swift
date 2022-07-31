//
//  SecurityInCompaniesTableViewCell.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//

import UIKit
import Charts

class SecurityInCompaniesTableViewCell: UITableViewCell {
    
    static let cellId = "securityCellId"
    
    let pieChart: PieChartView = {
        let pieChartView = PieChartView()
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        return pieChartView
    }()
    
    var piechartData: PieChartData? {
        didSet {
            guard let piechartData = piechartData else {
                return
            }
            pieChart.data = piechartData
        }
    }
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = K.Colors.titleColor
        label.numberOfLines = 0
        label.font = label.font.withSize(CGFloat(K.Numbers.titleFontSize))
        label.text = K.Strings.branchCleaningTitle
        label.textAlignment = .center
        return label
    }()
    
    lazy var contentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            pieChart
        ])
        stackView.axis = .vertical
        stackView.spacing = 18
        stackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Add views and constraints
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setupComponents() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            contentStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 18),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
            contentStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -18),
        ])
        
        super.updateConstraints()
    }
}
