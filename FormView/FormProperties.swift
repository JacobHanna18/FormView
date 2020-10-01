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
    case SingleSelection(labels : [String])
    case LongStringInput(height : CGFloat)
    //case Selection(singleSelection: Bool, labels: [String])
}

struct FormCell: View, Identifiable{
    
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
    
    var body: some View{
        switch type{
        case .StringTitle:
             StringTitle(cell: self)
        case .StringInput:
             StringInput(cell: self)
        case .StringSub1:
             StringSub1(cell: self)
        case .StringSub2:
             StringSub2(cell: self)
        case .IntSub:
             IntSub(cell: self)
        case .IntInput:
             IntInput(cell: self)
        case .DoubleSub:
             DoubleSub(cell: self)
        case .DoubleInput:
             DoubleInput(cell: self)
        case .ColorInput:
             ColorInput(cell: self)
        case .DateInput:
             DateInput(cell: self)
        case .BoolInput:
             BoolInput(cell: self)
        case .SingleSelection:
            SingleSelection(cell: self)
        case .LongStringInput:
            LongStringInput(cell: self)
        }
    }
    
    
    
}
