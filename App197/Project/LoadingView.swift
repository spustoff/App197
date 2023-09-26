//
//  LoadingView.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            Image(.loadingBg)
                .ignoresSafeArea()
            
            Image(.logoBig)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            VStack {
                
                Spacer()
                
                ProgressView()
            }
            .padding()
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    LoadingView()
}
