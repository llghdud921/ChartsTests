//
//  ViewController.swift
//  Charts_test
//
//  Created by 이호영 on 2022/04/26.
//

import UIKit
import Charts
import SnapKit

class ViewController: UIViewController, ChartViewDelegate {
    let weekBarChartView = WeekBarChartView()
    
    let achievementRate = [20.0, 40.0, 60.0, 30.0, 23.0, 89.0, 50.0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(weekBarChartView)
        
        setupConstraints()
        weekBarChartView.delegate = self
        weekBarChartView.setBarChartData(yValues: achievementRate, label: "Achivement")
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {

        // 터치 제대로안됨
        print(entry)
        print(highlight)
    }
    
    private func setupConstraints() {
        weekBarChartView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
    }
}
