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
            c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12
            ])))
        addChild(childView)
        childView.view.frame = mainView.bounds
        mainView.addSubview(childView.view)
        childView.didMove(toParent: self)
        
    }
}

