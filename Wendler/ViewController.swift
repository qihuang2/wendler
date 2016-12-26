//
//  ViewController.swift
//  Wendler
//
//  Created by Qi Feng Huang on 12/23/16.
//  Copyright © 2016 Qi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties

    @IBOutlet weak var vWeekSelection: UISegmentedControl!
    @IBOutlet weak var vEditText: UITextField!
    
    @IBOutlet weak var vMaxWeightText: UILabel!
    @IBOutlet weak var vWeekText: UILabel!
    
    @IBOutlet weak var vSetText1: UILabel!
    @IBOutlet weak var vSetText2: UILabel!
    @IBOutlet weak var vSetText3: UILabel!
    
    
    private static let WEEK_PERCENTAGES: [[Double]] =
        [
            [0.75, 0.8, 0.85],
            [0.8, 0.85, 0.9],
            [0.75, 0.85, 0.95]
        ];
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        vEditText.delegate = self;
        vEditText.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    //MARK: Actions
    @IBAction func onWeekChanged(_ sender: UISegmentedControl) {
        vWeekText.text = String(format: "Week : %X",sender.selectedSegmentIndex + 1);
        
        update();
    }

    
    
    private func update(){
        //check edit text to see if it's empty
        if let text = vEditText.text, !text.isEmpty {
            let max = Double(text);
            updateWithNewMaxValue(v: (max == nil ? 0 : max!), w: vWeekSelection.selectedSegmentIndex);
        }else{
            updateWithNewMaxValue(v: 0, w: vWeekSelection.selectedSegmentIndex);
        }
    }
    
    private func updateWithNewMaxValue(v: Double, w: Int){
        vMaxWeightText.text = String(format: "Max weight : %.2f" ,v);
        
        //set the set weights
        vSetText1.text = String(format: "Set 1 : %.2f", v*ViewController.WEEK_PERCENTAGES[w][0]);
        vSetText2.text = String(format: "Set 2 : %.2f", v * ViewController.WEEK_PERCENTAGES[w][1]);
        vSetText3.text = String(format: "Set 3 : %.2f", v * ViewController.WEEK_PERCENTAGES[w][2]);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        vEditText.resignFirstResponder();
        return true;
    }
    
    func textFieldDidChange(textField: UITextField) {
        update();
    }
    
    
    
    
}

