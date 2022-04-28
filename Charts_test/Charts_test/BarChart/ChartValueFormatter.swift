//
//  ChartValueFormatter.swift
//  Charts_test
//
//  Created by 이호영 on 2022/04/28.
//

import Foundation
import Charts

class ChartValueFormatter: NSObject, ValueFormatter {
    fileprivate var numberFormatter: NumberFormatter?

    convenience init(numberFormatter: NumberFormatter) {
        self.init()
        self.numberFormatter = numberFormatter
    }

    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        guard let numberFormatter = numberFormatter
            else {
                return ""
        }
        return numberFormatter.string(for: value)!
    }
}
