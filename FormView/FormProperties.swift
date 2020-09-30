//
//  FormProperties.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import Foundation
import SwiftUI

struct FormProperties{
    var title : String?
    var done : (()->Void)?
    var delete : (()->Void)?
    var dismiss : (()->Void)?
    var cells : [FormCell] = []
}

enum CellType{
    
    //Strings
    case StringInput
    case StringTitle
    case StringSub1
    case StringSub2
    
    //Numbers
    case IntSub
    case IntInput
    case DoubleSub
    case DoubleInput
    
    //other
    case ColorInput
    case DateInput(showTime : Bool, showDate: Bool)
    case BoolInput
    //case Selection(singleSelection: Bool, labels: [String])
}

struct FormCell: Identifiable{
    
    let id = UUID()
    
    var type : CellType
    
    var title : String?
    
    var set : ((Any) -> Void)?
    var get : (() -> Any)?
    
    func getT<T>(_ type: T.Type) -> T? {
        if let forcedGet = get{
            if let x = forcedGet() as? T{
                return x
            }
        }
        return nil
    }
    
    func setT(_ inp : Any){
        if let forcedSet = set{
           forcedSet(inp)
        }
    }
    
    
}
