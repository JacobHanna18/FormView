//
//  FormView.swift
//  FormView
//
//  Created by Jacob Hanna on 30/09/2020.
//

import SwiftUI

struct FormView: View {
    
    let props : FormProperties
    
    let padding : CGFloat = 200
    
    var body: some View{
        ZStack{
            Color.black.opacity(0.5).ignoresSafeArea()
            (Color(UIColor.systemBackground)).ignoresSafeArea().padding(.top, padding + 100)
            mainView.background(Color(UIColor.systemBackground)).cornerRadius(20).padding(.top, padding)
        }
        
    }
    
    var mainView: some View {
        VStack{
            HStack{
                Text(props.title ?? "error").font(.title).fontWeight(.bold).padding([.top, .leading, .trailing], 15.0)
                Spacer()
            }
            ScrollView {
                VStack {
                    ForEach(props.cells) { cell in
                        cell.padding(.horizontal).padding(.vertical,8)
                    }
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    props.done?()
                }) {
                    Text("Done")
                }.frame(maxWidth: .infinity)
                .padding(.all)
                Spacer()
                Button(action: {
                    props.delete?()
                }) {
                    Text("Delete")
                        .accentColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                }.frame(maxWidth: .infinity)
                .padding(.all)
                Spacer()
            }
        }
        
    }
}


let c1 = FormCell(type: .StringTitle, title: "DemoTitle")

let c2 = FormCell(type: .StringSub1, title: "Test Title", get: { () -> Any in
    return "test subtitle 1"
})
let c3 = FormCell(type: .StringSub2, title: "Test Title", get: { () -> Any in
    return "test subtitle 2"
})
let c4 = FormCell(type: .StringInput, title: "Test Title", set: { (str) in
    if let st = str as? String{
        testStringInput = st;
        print(testStringInput)
    }
}, get: { () -> Any in
    print("get")
    return testStringInput
})
let c5 = FormCell(type: .DoubleInput, title: "Test Title", set: { (str) in
    if let st = str as? Double{
        testDoubleInput = st;
        print(testDoubleInput)
    }
}, get: { () -> Any in
    return testDoubleInput
})
let c6 = FormCell(type: .IntInput, title: "Test Title", set: { (str) in
    if let st = str as? Int{
        testIntInput = st;
        print(testIntInput)
    }
}, get: { () -> Any in
    print("get")
    return testIntInput
})
let c7 = FormCell(type: .IntSub, title: "Test Title", get: { () -> Any in
    return testIntInput
})
let c8 = FormCell(type: .DoubleSub, title: "Test Title", get: { () -> Any in
    return testDoubleInput
})
let c9 = FormCell(type: .ColorInput, title: "test title", set: { (color) in
    if let co = color as? Color{
        print(co.description)
        testColorInput = co
    }
}, get: { () -> Any in
    return testColorInput
})
let c10 = FormCell(type: .DateInput(showTime: true, showDate: false), title: "test title", set: { (color) in
    if let co = color as? Date{
        print(co.description)
        testDateInput = co
    }
}, get: { () -> Any in
    return testDateInput
})
let c11 = FormCell(type: .BoolInput, title: "Test Title", set: { (str) in
    if let st = str as? Bool{
        testBoolInput = st;
        print(testBoolInput)
    }
}, get: { () -> Any in
    print("get")
    return testBoolInput
})
let c12 = FormCell(type: .SingleSelection(labels: ["label1","label2"]), title: "test title", set: { (ind) in
    if let i = ind as? Int{
        print(i)
    }
}, get: { () -> Any in
    return testSingleSelectionInput
})

let c13 =  FormCell(type: .LongStringInput(height: 500), title: "Test Title", set: { (str) in
    if let st = str as? String{
        testStringInput = st;
        print(testStringInput)
    }
}, get: { () -> Any in
    print("get")
    return testStringInput
})


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(props: FormProperties(title: "TestTitle", done: {
            print("done")
        }, delete: {
            print("delete")
        }, dismiss: {
            print("dismiss")
        }, cells: [
            c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13
            ]))
    }
}
