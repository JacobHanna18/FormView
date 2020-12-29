//
//  FormProperties.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import Foundation
import SwiftUI

extension View{
    func tappable (action : @escaping ()->Void) -> some View{
        return self.highPriorityGesture(TapGesture().onEnded(action))
    }
}

struct FormProperties{
    var title : String?
    var done : (()->Void)?
    var delete : (()->Void)?
    var dismiss : (()->Void)?
    var cells : [FormCell] = []
    var button : ButtonType = ButtonType.delete
    var doneButton : ButtonType = ButtonType.done
    var listView : Bool = false
}

enum CellType{
    
    //Strings
    case StringInput
    case StringTitle(systemImageName : String = "chevron.right", extraButton : (imageName : String, tap : (()->()))? = nil, color : UIColor? = nil)
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
    case BoolInput(color : Color? = nil, subTitle : [String]? = nil)
    case SingleSelection(labels : [String])
    case LongStringInput(height : CGFloat)
    case ImageSelection(images : [[UIImage]], background : [Color], ringColor: [Color])
    case MatrixSelection(columns:Int, values : [AnyView])
}

struct ButtonType{
    var label : String?
    var showAlert : Bool
    
    static var delete = ButtonType(label: "Delete", showAlert: true)
    static var none = ButtonType(label: nil, showAlert: false)
    static var done = ButtonType(label: "Done", showAlert: false)
}

struct FormCell: View, Identifiable{
    
    let id = UUID()
    
    var type : CellType
    
    var title : String?
    
    var divider : Bool = false
    
    var set : ((Any) -> Void)?
    var get : (() -> Any)?
    var tap : (()->Void)?
    
    
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
        case let .StringTitle(systemImageName : name, extraButton : extraBttn, color : c):
            StringTitle(cell: self, systemImageName: name, extraButtonName: (extraBttn != nil) ? extraBttn!.imageName : nil, extraButtonTap: (extraBttn != nil) ? extraBttn!.tap : nil, color: (c != nil) ? Color(c!) : nil)
        case .StringInput:
            StringInput(cell: self, inp : self.getT(String.self) ?? "")
        case .StringSub1:
             StringSub1(cell: self)
        case .StringSub2:
            AbstractSub(title: self.title, subtitle: self.getT(String.self) ?? "StrSub2 Err", tap: self.tap)
        case .IntSub:
            AbstractSub(title: self.title, subtitle: (self.getT(Int.self) ?? 0).toString, tap: self.tap)
        case .IntInput:
            IntInput(cell: self,inp: (self.getT(Int.self) ?? 0).toString)
        case .DoubleSub:
            AbstractSub(title: self.title, subtitle: (self.getT(Double.self) ?? 0).toString, tap: self.tap)
        case .DoubleInput:
            DoubleInput(cell: self, inp : (self.getT(Double.self) ?? 0).toString)
        case .ColorInput:
            ColorInput(cell: self,inp : (self.getT(Color.self) ?? Color.red))
        case let .DateInput(showTime : time, showDate: date):
             DateInput(cell: self, inp: self.getT(Date.self) ?? Date(), showTime: time, showDate: date)
        case let .BoolInput(color : color, subTitle : subs):
            BoolInput(cell: self,inp: (self.getT(Bool.self) ?? true), color: color ?? Color.accentColor, sub: subs)
        case let .SingleSelection(labels : labels):
            SingleSelection(cell: self, labels: labels, inp : (self.getT(Int.self) ?? 0))
        case let .LongStringInput(height : h):
            LongStringInput(cell: self,inp : self.getT(String.self) ?? "", height : h)
        case let .ImageSelection(images : images, background : back, ringColor: ring):
            ImageSelection(cell: self,backgroundColor: back, ringColor: ring, images: images, index: (self.getT((Int,Int).self) ?? (0,0)))
        case let .MatrixSelection(columns: c, values : v):
            MatrixSelection(cell: self, images: v, columns: c,selected : self.getT(Int.self) ?? 0)
        }
    }
    
}
