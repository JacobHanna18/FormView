//
//  FormView.swift
//  FormView
//
//  Created by Jacob Hanna on 30/09/2020.
//

import SwiftUI

struct CellsView : View{
    
    var props : FormProperties
    
    var body: some View{
        switch props.formType {
        case .list:
            listBody
        case .reorder:
            reOrderBody
        case .stack:
            stackBody
        }
    }
    
    var reOrderBody: some View{
        List{
            ForEach(props.cells) { cell in
                cell.padding(.horizontal).padding(.vertical,8)
                if cell.divider{
                    Divider()
                }
            }
            .onMove(perform: props.onMove)
            .onDelete(perform: props.onDelete)
            
        }
        .environment(\.editMode, .constant(.active))
    }
    
    var stackBody: some View{
        ZStack{
            ScrollView {
                VStack {
                    ForEach(props.cells) { cell  in
                        cell.padding(.horizontal).padding(.vertical,8)
                        if cell.divider{
                            Divider()
                        }
                    }

                }
            }
        }
    }
    
    var listBody: some View{
        List(props.cells) { cell  in
            cell.padding(.horizontal).padding(.vertical,8)
            if cell.divider{
                Divider()
            }
        }
    }
}

struct FormView: View {
    
    var props : FormProperties
    
    var dismiss : (()->Void)? = nil
    
    
    @State var showAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        
        ZStack{
            //Color(UIColor.systemBackground).ignoresSafeArea(.all)
            mainView
        }
        
    }
    
    var mainView: some View {
        NavigationView{
        VStack{
            CellsView(props: props)
            
            
            HStack {
                Spacer()
                
                if let label = props.doneButton.label{
                    Button(action: {
                        props.done?()
                        dismiss?()
                        
                        
                    }) {
                        Text(label)
                    }.frame(maxWidth: .infinity)
                    .padding(.all)
                    
                    Spacer()
                }

                
                
                
                if let label = props.button.label{
                    Button(action: {
                        if(props.button.showAlert){
                            showAlert = true
                        }else{
                            props.delete?()
                            dismiss?()
                        }
                        
                    }) {
                        Text(label)
                            .accentColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                    }.frame(maxWidth: .infinity)
                    .padding(.all)
                    Spacer()
                }
                
            }
        }.alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Are you sure?"),
                message: Text("This cannot be undone."),
                primaryButton: .destructive(Text("Yes"), action: {
                    props.delete?()
                    dismiss?()
                }),
                secondaryButton: .cancel(Text("No"), action: {
                    showAlert = false
                })
            )
        }).navigationBarTitle(Text(props.title ?? "PropTitle Error"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}
