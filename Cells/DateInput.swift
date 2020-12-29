//
//  DateInput.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct DateInput: View {
    let cell : FormCell
    @State var inp: Date = Date()
    
    var showTime : Bool
    var showDate : Bool
    
    var components : DatePickerComponents{
        if showTime && showDate{
            return [.date,.hourAndMinute]
        }else if showTime{
            return [.hourAndMinute]
        }else {
            return [.date]
        }
    }
    
    var body: some View {
        VStack{
            DatePicker(selection: $inp, displayedComponents: components) {
                CellTitleView(title: cell.title).onTapGesture(perform: {
                    cell.tap?()
                })
            }
        }.onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}
