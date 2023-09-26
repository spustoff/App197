//
//  DonationsSimulator.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct DonationsSimulator: View {
    
    @Environment(\.presentationMode) var router
    
    @State var currencies: [String] = ["EURUSD", "EURTRY", "EURKZT", "EURJPY", "EURCAD", "USDTRY", "USDKZT", "USDJPY", "USDCAD"]
    @State var current_currency: String = "EURUSD"
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Graph of \(current_currency)")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .padding(.top)
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("\(Int.random(in: 1...205000))")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .medium))
                        
                        Text("+\(Int.random(in: 1...2500))%")
                            .foregroundColor(.green)
                            .font(.system(size: 14, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Menu {
                        
                        ForEach(currencies, id: \.self) { index in
                        
                            Button(action: {
                                
                                current_currency = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                    
                                    Spacer()
                                    
                                    if current_currency == index {
                                        
                                        Image(systemName: "xmark")
                                    }
                                }
                            })
                        }
                        
                    } label: {
                        
                        HStack {
                            
                            Text(current_currency)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                }
                .padding(.horizontal)
                
                Chart(pair: current_currency)
                    .disabled(true)
            }
        }
    }
}

#Preview {
    DonationsSimulator()
}
