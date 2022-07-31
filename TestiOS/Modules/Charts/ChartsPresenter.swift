//
//  ChartsPresenter.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Charts

protocol ChartsPresentationLogic {
    func PresentCharts(response: Charts.ChartsData.Response)
}

class ChartsPresenter: ChartsPresentationLogic {
    weak var viewController: ChartsDisplayLogic?

    // MARK: Parse and calc respnse from ChartsInteractor and send simple view model to ChartsViewController to be displayed

    func PresentCharts(response: Charts.ChartsData.Response) {
        
        // cleaning chart
        let reportData = response.charts.reporte
        var cleaningChartEntries = [PieChartDataEntry]()
        var cleaningColors = [UIColor]()
        for report in reportData {
            let dataEntrie = PieChartDataEntry(value: Double(report.cantidad)!, label: report.valor)
            cleaningChartEntries.append(dataEntrie)
            cleaningColors.append(UIColor.random())
        }
        let cleaningChartDataSet = PieChartDataSet(entries: cleaningChartEntries, label: "")
        cleaningChartDataSet.colors = cleaningColors
        let cleaningChartData = PieChartData(dataSet: cleaningChartDataSet)
        
        
        // security chart
        let securityData = response.charts.empresas
        var securityChartEntries = [PieChartDataEntry]()
        var securityColors = [UIColor]()
        for security in securityData {
            let securityChartEntrie = PieChartDataEntry(value: Double(security.porcentaje), label: security.nombre)
            securityChartEntries.append(securityChartEntrie)
            securityColors.append(UIColor.random())
        }
        let securityChartDataSet = PieChartDataSet(entries: securityChartEntries, label: "")
        securityChartDataSet.colors = securityColors
        let securityChartData = PieChartData(dataSet: securityChartDataSet)
        
        let cleaningChartValues = PieChartValues(title: K.Strings.branchCleaningTitle, piechart: cleaningChartData)
        let securityChartValue = PieChartValues(title: K.Strings.securityCellTitle, piechart: securityChartData)
        
        let viewModel = Charts.ChartsData.ViewModel(cleaningChartData: cleaningChartValues, securityChartData: securityChartValue)
        viewController?.displayCharts(viewModel: viewModel)
    }
}
