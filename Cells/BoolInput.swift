//
//  BoolInput.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct BoolInput: View {
    let cell : FormCell
    @State var inp: Bool = true
    var color: Color
    var sub : [String]?
    
    var body: some View {
        HStack(){
            if cell.tap != nil{
                Button(action: {cell.tap?()}, label: {
                    Image(systemName: "pencil.circle").font(.title)
                }).accentColor(color)
            }
            
            VStack {
                
                CellTitleView(title: cell.title)
                
                if let arr = sub{

                    ForEach(0 ..< arr.count){ i in
                        HStack {
                            Text(arr[i]).font(.footnote).foregroundColor(Color(UIColor.secondaryLabel))
                            Spacer()
                        }
                    }
                    
                    
                }
            }
            Toggle(isOn: $inp, label: {
            }).toggleStyle(SwitchToggleStyle(tint: color))
        }.onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}
