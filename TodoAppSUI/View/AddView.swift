//
//  AddView.swift
//  TodoAppSUI
//
//  Created by Daniel on 07.12.2022.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listVM: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var textfieldText = ""
    @State var alertTitle = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Topy something here...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.916))
                    .cornerRadius(10)
                
                Button(action: saveButttonTapped) {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                }
            }
            .padding(16)
        }
        .navigationBarTitle("Add an item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButttonTapped() {
        if textIsValid() {
            listVM.addItem(title: textfieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    func textIsValid() -> Bool {
        if textfieldText.count < 3 {
            alertTitle = "Your todo item should contain alleast 3 characters 🙃"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
