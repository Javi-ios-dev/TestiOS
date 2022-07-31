//
//  ChartsViewControllerTableViewDelegates.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//

import Foundation
import UIKit

extension ChartsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BranchCleaningPercentageTableViewCell.cellId, for: indexPath) as! BranchCleaningPercentageTableViewCell
            cell.piechartData = cleaningChartData
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SecurityInCompaniesTableViewCell.cellId, for: indexPath) as! SecurityInCompaniesTableViewCell
            cell.piechartData = securityChartData
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
}
