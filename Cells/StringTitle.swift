//
//  StringTitle.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct StringTitle: View {
    let cell : FormCell
    
    var systemImage : Image{
        switch cell.type {
        case let .StringTitle(systemImageName: name, _,_):
            return Image(systemName: name)
        default:
            return Image(systemName: "chevron.right")
        }
    }
    
    var extraButton : (Image, (()->()))?{
        switch cell.type {
        case let .StringTitle(_, extraButton : button,_):
            if button == nil{
                return nil
            }else{
                return (Image(systemName: button!.imageName), button!.tap)
            }
        default:
            return nil
        }
    }
    
    var color : Color?{
        switch cell.type {
        case let .StringTitle(_, _, color: c):
            return c == nil ? nil : Color(c!)
        default:
            return nil
        }
    }
    
    var mainBody : some View{
        HStack{
            
            if extraButton != nil{
                Button(action: {extraButton?.1()}, label: {
                    extraButton?.0.padding(.leading, 10.0).font(.title)
                })
            }
            if cell.tap != nil{
                HStack {
                    Button(action: {cell.tap?()}, label: {
                        CellTitleView(title: cell.title)
                    })
                    Spacer()
                    Button(action: {cell.tap?()}, label: {
                        systemImage.padding(.leading, 10.0).font(.title2)
                    })
                    
                }
            }else{
                CellTitleView(title: cell.title)
            }
        }
    }
    
    var body: some View {
        
        if color == nil{
            mainBody
        }else{
            mainBody.accentColor(color)
        }
        
        
    }
}

struct StringTitle_Previews: PreviewProvider {
    static var previews: some View {
        StringTitle(cell: FormCell(type: .StringTitle(), title: "DemoTitle"))
    }
}
