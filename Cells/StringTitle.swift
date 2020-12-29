//
//  StringTitle.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct StringTitle: View {
    let cell : FormCell
    
    
    var systemImageName : String
    var systemImage : Image{
        return Image(systemName: systemImageName)
    }
    
    var extraButtonName : String?
    var extraButtonTap : (()->())?
    
    var extraButtonImage : Image?{
        return (extraButtonName != nil) ? Image(systemName: extraButtonName!) : nil
    }
    
    var color : Color?
    
    var mainBody : some View{
        HStack{
            
            if extraButtonName != nil{
                Button(action: {extraButtonTap?()}, label: {
                    extraButtonImage?.padding(.leading, 10.0).font(.title)
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
