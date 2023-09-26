//
//  Users_2.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            Image(.loadingBg)
                .ignoresSafeArea()
            
            Image(.users2)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(spacing: 7, content: {
                        
                        Text("Rate our app in the AppStore")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Help make the app even better")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Users_3(telegram: telegram, isContacts: isContacts)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            if isContacts == true {
                                
                                Users_4()
                                    .navigationBarBackButtonHidden()
                                
                            } else if isContacts == false {
                                
                                Users_5()
                                    .navigationBarBackButtonHidden()
                            }
                        }
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            .padding(.bottom, 25)
                            .padding(.top, 50)
                    })
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color("bg").ignoresSafeArea())
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Users_2(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
}
