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
        let cell = tableView.dequeueReusableCell(withIdentifier: PieChartTableViewCell.cellId, for: indexPath) as! PieChartTableViewCell
        if indexPath.row == 0 {
            cell.piechartData = cleaningChartData
        } else {
            cell.piechartData = securityChartData
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
}
