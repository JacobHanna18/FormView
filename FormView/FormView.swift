//
//  FormView.swift
//  FormView
//
//  Created by Jacob Hanna on 30/09/2020.
//

import SwiftUI

struct FormView: View {
    
    let props : FormProperties
    
    var body: some View {
        Text(props.title ?? "error")
        List(props.cells) { cell in
            switch cell.type{
            case .StringTitle:
                 StringTitle(cell: cell)
            case .StringInput:
                 StringInput(cell: cell)
            case .StringSub1:
                 StringSub1(cell: cell)
            case .StringSub2:
                 StringSub2(cell: cell)
            case .IntSub:
                 IntSub(cell: cell)
            case .IntInput:
                 IntInput(cell: cell)
            case .DoubleSub:
                 DoubleSub(cell: cell)
            case .DoubleInput:
                 DoubleInput(cell: cell)
            case .ColorInput:
                 ColorInput(cell: cell)
            case .DateInput:
                 DateInput(cell: cell)
            case .BoolInput:
                 BoolInput(cell: cell)
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(props: FormProperties(title: "TestTitle", done: {
            print("done")
        }, delete: {
            print("delete")
        }, dismiss: {
            print("dismiss")
        }, cells: [
            FormCell(type: .ColorInput, title: "test title", set: { (color) in
                if let co = color as? Color{
                    print(co.description)
                    testColorInput = co
                }
            }, get: { () -> Any in
                return testColorInput
            }),
            FormCell(type: .DoubleInput, title: "Test Title", set: { (str) in
                if let st = str as? Double{
                    testDoubleInput = st;
                    print(testDoubleInput)
                }
            }, get: { () -> Any in
                return testDoubleInput
            })
        ]))
    }
}
