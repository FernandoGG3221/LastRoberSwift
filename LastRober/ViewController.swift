//
//  ViewController.swift
//  LastRober
//
//  Created by Fernando González González on 12/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblLastRober: UILabel!
    @IBOutlet weak var lblDateLastRober: UILabel!
    @IBOutlet weak var lblCountDays: UILabel!
    
    //MARK: - Propieties
    var arrDates = [[Any]]()
    
    let dateLastRob:String = "02/12/2021"
    let current = Date()

    //MARK: - Life Screen
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        formatedData(lastDate: dateLastRob)
    }
    
    //MARK: - rules
    func reportNewRober(){
        arrDates.append([current])
        let last = arrDates.last
        
        //Formateo de last en formato dd/mm/yyyy
        let formatString = DateFormatter()
        formatString.dateFormat = "dd/MM/yyyy"
        
        let lastRob = formatString.string(from: last![0] as! Date)
        formatedData(lastDate: lastRob)
    }
    
    func formatedData(lastDate:String){
        
        var dateLRComponents = DateComponents()

        //Separacion de la cadena en componentes
        let a = lastDate.split(separator: "/")
        dateLRComponents.day = Int(a[0])
        dateLRComponents.month = Int(a[1])
        dateLRComponents.year = Int(a[2])

        //dateLRComponents.timeZone = TimeZone(abbreviation: "UTC")
        let dateLast = Calendar(identifier: .gregorian).date(from: dateLRComponents)
        
        countDaysWithRober(lastDate: dateLast!)
    }
    
    func countDaysWithRober(lastDate last:Date){
        //Mostrar diferencia de tiempo de una fecha a otra
        let formatComponents = DateComponentsFormatter()
        formatComponents.unitsStyle = .full
        formatComponents.includesApproximationPhrase = true
        formatComponents.includesTimeRemainingPhrase = true
        formatComponents.allowedUnits = [.day, .month, .hour]
        let tiempo = formatComponents.string(from: last, to: current)
        
        lastRob(from: last, to: tiempo!)
        
    }
    
    func lastRob(from date:Date,to date1:String ){
        
        let formatString = DateFormatter()
        formatString.dateFormat = "dd/MM/yyyy"
        
        //let lastRob = formatString.date(from: dateLastRob)
        let lastRob = formatString.string(from: date)
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        //lblDateLastRober.text = dateFormatter.string(from: lastRob!)
        lblCountDays.text = date1
        lblDateLastRober.text = lastRob
    }
    

    //MARK: - Actions
    @IBAction func btnRober(_ sender: UIButton) {
        reportNewRober()
    }
    
    
}

