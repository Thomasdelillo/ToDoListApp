//
//  LoginView.swift
//  ToDoList
//
//  Created by Thomas D on 5/12/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Accomplish your goals",
                           angle: 15,
                           background: Color(red: 0/255, green: 51/255, blue: 79/255))
                
                //Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Email Address", text:$viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                    }
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        SecureField("Password", text:$viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                    }
                    TLButton(title: "Log In", background: Color(red: 0/255, green: 51/255, blue: 79/255)) {
                        //attempt log in
                        viewModel.login()
                    } .padding()
                }
                .offset(y: -50)
                .scrollContentBackground(.hidden)
                
                //Create Account
                
                VStack {
                    Text("Don't have an account?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
