//
//  extensions.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import UIKit


extension Double{
    public var toString : String{
        return self == floor(self) ? "\(Int(self))" : "\(self)"
    }
    public var toTwoString : String{
        return self == floor(self) ? "\(Int(self))" : String(format: "%.02f", self)
    }
    
    public var toForcedTwoString : String{
        return String(format: "%.02f", self)
    }
}


extension Int{
    public var toString : String{
        return "\(self)"
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
