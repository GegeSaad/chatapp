//
//  ContentView.swift
//  Chat
//
//  Created by engy on 7/15/23.
//

import SwiftUI

struct Login: View {
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var userName = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 30){
                    // MARK: -   PICKER
                    
                    Picker(selection: $isLoginMode,label: Text("picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                        
                    }
                    .pickerStyle(.segmented)
                    .overlay{
                        RoundedRectangle(cornerRadius: 4).stroke( Color.blue,lineWidth: 0.5)
                    }
                    
                    
                    //picker end
                    // MARK: -    BUTTON FOR IMAGE
                    // if !isLoginMode // mean true
                    if !isLoginMode {
                        
                        Button{
                            // some action here
                            print(12346)
                        } label: {
                            //image
                            Image(systemName: "person.circle")
                                .font(.system(size: 100,weight: .thin))
                            
                            
                            
                                .foregroundColor(.black)
                                .padding()
                            
                            
                        }
                        
                        //button end
                    }
                    
                    // MARK: -    group textFIELD AND PASSWORD
                    Group{
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        TextField("User Name", text:$userName).isHidden(isLoginMode, remove: true)
                            
                    
        
                        
                        SecureField("password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    .overlay{
                        RoundedRectangle(cornerRadius: 5).stroke(Color.blue,lineWidth: 0.3)
                    }
                    
                    // MARK: - BUTTON FOR create or login
                    Button{
                        //some action here
                       handelAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text( isLoginMode ?  "Log in " : "Create Account")
                                .foregroundColor(.white)
                            
                                .padding(10)
                                .font(.system(size: 19, weight: .semibold))
                            Spacer()
                        }
                        .background(Color.blue.cornerRadius(12))
                        .frame(maxWidth:.infinity)
                        .frame(height:100)
                        
                    }
                    //button end
                    
                    
                }.padding() //END VSTACK
            }.navigationTitle(isLoginMode ?  "Log in " : "Create Account")
                .background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
        }
    }
    private func handelAction(){
        if isLoginMode{
            print("should log into firbase with email & password ")
        } else{
            print("Register a new account inside of Firebase Auth ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
extension View{
    /// Hide or show the view based on a boolean value.
        ///
        /// Example for visibility:
        ///
        ///     Text("Label")
        ///         .isHidden(true)
        ///
        /// Example for complete removal:
        ///
        ///     Text("Label")
        ///         .isHidden(true, remove: true)
        ///
        /// - Parameters:
        ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
        ///   - remove: Boolean value indicating whether or not to remove the view.
        @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
            if hidden {
                if !remove {
                    self.hidden()
                }
            } else {
                self
            }
        }}
