//
//  ViewController.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    
    var fv = FormView(props: FormProperties(title: "TestTitle", done: {
        print("done")
    }, delete: {
        print("delete")
    }, dismiss: {
        print("dismiss")
    }, cells: [
        c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13
    ]), spacing: 200)
    
    var content : UIHostingController<FormView>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fv.dismiss = {
            self.dismiss(animated: true, completion: nil)
        }
        
        
        content = UIHostingController(rootView: fv)
        
        
        content.view.backgroundColor = UIColor.clear
        addChild(content)
        content.view.frame = mainView.frame
        mainView.addSubview(content.view)
        content.didMove(toParent: self)
        
        setUp()
        
    }
    
    func setUp(){
        content.view.translatesAutoresizingMaskIntoConstraints = false
        content.view.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        content.view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        content.view.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        content.view.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
    }
}

