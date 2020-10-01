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
        VStack{
            Text(props.title ?? "error")
            ScrollView {
                VStack {
                    ForEach(props.cells) { cell in
                        cell.padding([.top, .leading, .trailing])
                    }
                }
            }
//            List(props.cells) { cell in
//                cell
//            }
            HStack {
                Spacer()
                Button(action: {
                    props.done?()
                }) {
                    Text("Done")
                }
                .padding(.all)
                Spacer()
                Button(action: {
                    props.delete?()
                }) {
                    Text("Delete")
                        .accentColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                }
                .padding(.all)
                Spacer()
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
