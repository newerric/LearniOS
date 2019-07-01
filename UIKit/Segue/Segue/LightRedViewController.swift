//
//  LightRedViewController.swift
//  Segue
//
//  Created by mikewang on 2019/7/1.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

protocol LightRedViewControllerDelegate {
    func setColor(colorType: String)
}

class LightRedViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var delegate: LightRedViewControllerDelegate?
    var infoFromViewOne: String?
    let colorArray = ["red", "green", "blue"]
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPickerView: UIPickerView!
    
    // MYAR: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = infoFromViewOne
        myPickerView.dataSource = self
        myPickerView.delegate = self
    }
    
    // MARK: - IBAction
    @IBAction func backToViewOne(_ sender: UIButton) {
        let colorNumber = myPickerView.selectedRow(inComponent: 0)
        let color = colorArray[colorNumber]
        delegate?.setColor(colorType: color)
        navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row]
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
