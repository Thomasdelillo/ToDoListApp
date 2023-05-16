//
//  RegisterView.swift
//  ToDoList
//
//  Created by Thomas D on 5/12/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       background: .gray)
            
            Spacer()
            
            //Form
            Form {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                }
                
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                }
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                TLButton(title: "Create Account", background: .green) {
                    //attempt registration
                    viewModel.register()
                } .padding()
            }
            .offset(y: -50)
            .scrollContentBackground(.hidden)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
