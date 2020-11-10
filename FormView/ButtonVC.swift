//
//  Button.swift
//  FormView
//
//  Created by Jacob Hanna on 07/10/2020.
//

import UIKit

class ButtonVC: UIViewController {
    
    @IBAction func showView(_ sender: Any) {
        self.showForm(FormProperties(title: "TestTitle", done: {
            print("done")
        }, delete: {
            print("delete")
        }, dismiss: {
            print("dismiss")
        }, cells: [
            c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13
        ]))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
