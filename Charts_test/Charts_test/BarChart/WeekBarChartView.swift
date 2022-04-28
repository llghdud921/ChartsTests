//
//  WeekBarChartView.swift
//  Charts_test
//
//  Created by 이호영 on 2022/04/28.
//

import UIKit
import Charts

class WeekBarChartView: BarChartView {
    let days = ["Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func setUp() {
        doubleTapToZoomEnabled = false    // Disable tap-to-zoom
        rightAxis.enabled = false         // Remove right Axis
        legend.enabled = false            // Remove Legend
        
        // xAxis
        xAxis.labelPosition = .bottom
        xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        xAxis.removeAllLimitLines()
        xAxis.drawAxisLineEnabled = false

        // leftAxis
        leftAxis.enabled = false
        
        // Animation
        animate(yAxisDuration: 2.0)
        
        // Remove Grid
        xAxis.drawGridLinesEnabled = false
        leftAxis.drawGridLinesEnabled = false
    }
    
    func setBarChartData(yValues: [Double], label: String) {
        var dataEntries: [BarChartDataEntry] = []
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.multiplier = 1.0

        for i in 0..<yValues.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: label)
        chartDataSet.valueFormatter = ChartValueFormatter(numberFormatter: numberFormatter)
        chartDataSet.colors = [UIColor.orange]
        
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.barWidth = 0.5

        self.data = chartData
    }
}
