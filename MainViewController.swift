//
//  ViewController.swift
//  timeLogger
//
//  Created by William W on 28/5/19.
//  Copyright © 2019 William W. All rights reserved.
//

import UIKit
import Charts

class MainViewController: UIViewController {

    @IBOutlet weak var currentDate: UINavigationItem!
    @IBOutlet weak var chartView: PieChartView!
    
    @IBOutlet weak var sleepStepper: UIStepper!
    @IBOutlet weak var eatStepper: UIStepper!
    @IBOutlet weak var studyStepper: UIStepper!
    @IBOutlet weak var workStepper: UIStepper!
    @IBOutlet weak var playStepper: UIStepper!
    
    var sleepEntry  = PieChartDataEntry(value: 0)
    var eatEntry    = PieChartDataEntry(value: 0)
    var workEntry   = PieChartDataEntry(value: 0)
    var playEntry   = PieChartDataEntry(value: 0)
    var studyEntry  = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIView()
        setDate()
        
        chartView.chartDescription?.text = "Log your time to start your day!"
        chartView.sizeToFit()
        
        sleepEntry.value = sleepStepper.value
        sleepEntry.label = "Sleep"
    
        
        eatEntry.value = eatStepper.value
        eatEntry.label = "Eat"
        
        workEntry.value = workStepper.value
        workEntry.label = "Work"
        
        playEntry.value = playStepper.value
        playEntry.label = "Play"
        
        studyEntry.value = studyStepper.value
        studyEntry.label = "Study"
        
        numberOfDownloadsDataEntries = [sleepEntry, eatEntry, playEntry, workEntry, studyEntry]
        
        updateChartData()
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named:"sleepColor"), UIColor(named:"eatColor"), UIColor(named:"playColor"), UIColor(named:"workColor"), UIColor(named:"studyColor")]
        
        chartDataSet.colors = colors as! [NSUIColor]
        chartView.data = chartData
    }
    
   
    @IBAction func sleepChanged(_ sender: UIStepper) {
        sleepEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func eatChanged(_ sender: UIStepper) {
        eatEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func playChanged(_ sender: UIStepper) {
        playEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func workChanged(_ sender: UIStepper) {
        workEntry.value = sender.value
        updateChartData()
    }
    
    
    @IBAction func studyChanged(_ sender: UIStepper) {
        studyEntry.value = sender.value
        updateChartData()
    }
    
    func setUIView() {
        self.chartView.layer.cornerRadius = 8
    }
    
    func setDate() {
        let today   = Date()
        let weekday = Calendar.current.weekdaySymbols[Calendar.current.component(.weekday, from:            today) - 1]
        let month   = Calendar.current.shortMonthSymbols[Calendar.current.component(.month, from: today) - 1]
        let date    = Calendar.current.component(.day, from: today)
        let year    = Calendar.current.component(.year, from:today)
        
        self.title  = "\(weekday) \(date) \(month) \(year)"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
  
    }
}

