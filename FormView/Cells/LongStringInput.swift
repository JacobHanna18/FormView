//
//  LongtringInput.swift
//  FormView
//
//  Created by Jacob Hanna on 01/10/2020.
//

import SwiftUI

struct LongStringInput: View {
    let cell : FormCell
    @State var inp: String = ""
    var height : CGFloat{
        switch cell.type {
        case let .LongStringInput(height: h):
            return h
        default:
            return 100
        }
    }
    var body: some View {
        VStack{
            HStack{
                Text(cell.title ?? "error")
                Spacer()
            }
            ZStack{
                Color.accentColor.opacity(0.5)
                TextEditor(text: $inp).frame(minHeight: height, idealHeight: height, maxHeight: .infinity)
            }
           
//            TextField(cell.title ?? "error", text: $inp, onCommit: {
//                UIApplication.shared.endEditing()
//            }).textFieldStyle(RoundedBorderTextFieldStyle())
        }.onAppear(perform: {
            inp = cell.getT(String.self) ?? ""
        }).onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}

struct LongStringInput_Previews: PreviewProvider {
    static var previews: some View {
        LongStringInput(cell: FormCell(type: .LongStringInput(height: 100), title: "Test Title", set: { (str) in
            if let st = str as? String{
                testStringInput = st;
                print(testStringInput)
            }
        }, get: { () -> Any in
            print("get")
            return testStringInput
        }))
    }
}
