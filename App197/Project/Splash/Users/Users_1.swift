//
//  Users_1.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct Users_1: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            Image(.loadingBg)
                .ignoresSafeArea()
            
            Image(.users1)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(spacing: 7, content: {
                        
                        Text("Success is in your hands")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Go to the goal")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                
                    NavigationLink(destination: {
                        
                        Users_2(telegram: telegram, isTelegram: isTelegram, isContacts: isContacts)
                            .navigationBarBackButtonHidden()
                        
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
    }
}

#Preview {
    Users_1(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
}
