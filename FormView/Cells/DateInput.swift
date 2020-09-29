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
    var body: some View {
        VStack{
            DatePicker(cell.title ?? "error", selection: $inp, displayedComponents: [.date])
        }.onAppear(perform: {
            inp = (cell.getT(Date.self) ?? Date())
        }).onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}

var testDateInput : Date = Date()
struct DateInput_Previews: PreviewProvider {
    static var previews: some View {
        DateInput(cell: FormCell(type: .ColorInput, title: "test title", set: { (color) in
            if let co = color as? Date{
                print(co.description)
                testDateInput = co
            }
        }, get: { () -> Any in
            return testDateInput
        }))
    }
}
