//
//  ViewController.swift
//  Tic Tac Toe 1
//
//  Created by Mahamud abukar on 2021-01-12.
//

import UIKit


class ViewController: UIViewController {
    
    
    var nuvarandeSpelare = 1// kryss
    var spelStat = [0, 0, 0, 0, 0, 0, 0, 0, 0] // vart vi har lagt ut i brädan
    
    let vinnarCombinationer = [[0,1,2], [3,4,5] , [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var speletÄrIgång = true

    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: UIButton){
        if(spelStat[sender.tag-1] == 0 && speletÄrIgång == true)
        
        {
            spelStat[sender.tag-1 ] = nuvarandeSpelare
            if(nuvarandeSpelare==1)
            {
                sender.setImage(UIImage(named: "X.jpg"), for: .normal)
                nuvarandeSpelare = 2
            }
            else{
                sender.setImage(UIImage(named: "O.jpg"), for: .normal)
                nuvarandeSpelare = 1
            }
        }
       
        for combinationer in vinnarCombinationer{
            if spelStat[combinationer[0]] != 0 && spelStat[combinationer[0]] == spelStat [combinationer[1]] && spelStat[combinationer[1]] == spelStat[combinationer[2]]
            {
                speletÄrIgång = false
                
                if spelStat[combinationer[0]] == 1
                {
                    
                    label.text = "Kryss har vunnit!"
                }
                else{
                  
                    label.text = "Cirkel har vunnit!"
                }
                
                KörIgenKnapp.isHidden = false
                label.isHidden = false
        
            }
        }
        speletÄrIgång = false
        
        for i in spelStat { // kollar om de inte finns brädor/0a kvar i spelet
            if i == 0
            {
             speletÄrIgång = true
                break
            }
        }
        if speletÄrIgång == false {
            label.text = "Oavgjort"
            label.isHidden = false
            KörIgenKnapp.isHidden = false
        }
    }
    
  
    @IBOutlet weak var KörIgenKnapp: UIButton!
    @IBAction func körIgen(_ sender: Any)
    {
        spelStat = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        speletÄrIgång = true
        nuvarandeSpelare = 1
        
        KörIgenKnapp.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
        }
    
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

