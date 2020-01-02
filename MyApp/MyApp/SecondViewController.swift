//
//  SecondViewController.swift
//  MyApp
//
//  Created by Office on 1/2/20.
//  Copyright © 2020 Office. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var myButton:UIButton = UIButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        myButton.setTitle("Back", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        myButton.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)

        myButton.addTarget(self, action: #selector(backTo), for: .touchUpInside)
        self.view.addSubview(myButton)
        myButton.center = self.view.center
        

    }
    
    @objc func backTo() {
        self.dismiss(animated: true, completion: nil)
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
