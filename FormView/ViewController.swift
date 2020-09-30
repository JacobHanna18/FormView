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

        let childView = UIHostingController(rootView: FormView(props: FormProperties(title: "TestTitle", done: {
            print("done")
        }, delete: {
            print("delete")
        }, dismiss: {
            print("dismiss")
        }, cells: [
            FormCell(type: .ColorInput, title: "test title", set: { (color) in
                if let co = color as? Color{
                    print(co.description)
                    testColorInput = co
                }
            }, get: { () -> Any in
                return testColorInput
            }),
            FormCell(type: .DoubleInput, title: "Test Title", set: { (str) in
                if let st = str as? Double{
                    testDoubleInput = st;
                    print(testDoubleInput)
                }
            }, get: { () -> Any in
                return testDoubleInput
            })
        ])))
        addChild(childView)
        childView.view.frame = mainView.bounds
        mainView.addSubview(childView.view)
        childView.didMove(toParent: self)
        
    }
}

