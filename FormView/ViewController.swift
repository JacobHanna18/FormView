//
//  ViewController.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.

        let childView = UIHostingController(rootView: BoolInput(cell: FormCell(type: .BoolInput, title: "Test Title", set: { (str) in
            if let st = str as? Bool{
                testBoolInput = st;
                print(testBoolInput)
            }
        }, get: { () -> Any in
            print("get")
            return testBoolInput
        })))
        addChild(childView)
        childView.view.frame = mainView.bounds
        mainView.addSubview(childView.view)
        childView.didMove(toParent: self)
        
    }
}

