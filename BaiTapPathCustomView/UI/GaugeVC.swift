//
//  GaugeVC.swift
//  BaiTapPath
//
//  Created by Admin on 28/7/25.
//

import UIKit

class GaugeVC: UIViewController {

    @IBOutlet weak var gaugeView: GaugeView!
    @IBOutlet weak var percentageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    @IBAction func btnRandom(_ sender: Any) {
        let ran = CGFloat(Double.random(in: 0...1))
        percentageLabel.text = String(" \(Int(ran*100)) / 100")
        gaugeView.animateGauge(to: ran)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
