//
//  SingleSelection.swift
//  FormView
//
//  Created by Jacob Hanna on 01/10/2020.
//

import SwiftUI

struct SingleSelection: View {
    let cell : FormCell
    var labels : [String] {
        switch cell.type {
        case let .SingleSelection(labels: ls):
            return ls
        default:
            return ["error"]
        }
    }
    @State var inp: Int = 0
    var body: some View {
        VStack{
            CellTitleView(title: cell.title)
            HStack {
                ForEach((0..<labels.count), id: \.self) {i in
                    Spacer()
                    Button(labels[i]) {
                        inp = i
                    }.padding(.all, 5).accentColor(i == inp ? Color(UIColor.systemBackground) : Color.accentColor).frame( maxWidth: .infinity).background((i == inp ? Color.blue : Color.clear)).cornerRadius(10.0)
                }
                Spacer()
            }
        }.onAppear(perform: {
            
            inp = (cell.getT(Int.self) ?? 0)

        }).onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}

var testSingleSelectionInput = "test input"
struct SingleSelection_Previews: PreviewProvider {
    static var previews: some View {
        SingleSelection(cell: FormCell(type: .SingleSelection(labels: ["label1","label2"]), title: "test title", set: { (ind) in
            if let i = ind as? Int{
                print(i)
            }
        }, get: { () -> Any in
            return testSingleSelectionInput
        }))
    }
}
