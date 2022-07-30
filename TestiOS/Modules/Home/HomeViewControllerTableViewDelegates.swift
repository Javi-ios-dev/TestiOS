//
//  HomeViewControllerTableViewDelegates.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /**
         0: TextfieldTableViewcell
         1: Seflie cell
         2: Charts cell
         */
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.cellId, for: indexPath) as? TextFieldTableViewCell
            //            cell?.textField.delegate = self
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SelfieTableViewCell.cellId, for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.cellId, for: indexPath)
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."
            cell.contentConfiguration = contentConfiguration
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            print("selfie")
        case 2:
            showCharts()
        default: break
            
        }
    }
    
}
