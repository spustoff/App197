//
//  DonationsAdd.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct DonationsAdd: View {
    
    @StateObject var viewModel: DonationsViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("NEW DONATION")
                    .foregroundColor(.white)
                    .font(.system(size: 21, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 30) {
                        
                        VStack(alignment: .leading, spacing: 12, content: {
                            
                            Text("Donation Platform")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 20) {
                                    
                                    ForEach(viewModel.platforms, id: \.self) { index in
                                            
                                        Image(index)
                                            .opacity(viewModel.current_platform == index ? 1 : 0.5)
                                            .onTapGesture {
                                                
                                                viewModel.current_platform = index
                                            }
                                    }
                                }
                            }
                        })
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Select Streamer")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.streamer.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.streamer)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$ 0.00")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.amount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.amount)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("A comment")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.comment.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.comment)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addDonation {
                        
                        viewModel.fetchDonations()
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Add Donation")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.current_platform.isEmpty || viewModel.streamer.isEmpty || viewModel.amount.isEmpty || viewModel.comment.isEmpty ? 0.5 : 1)
                .disabled(viewModel.current_platform.isEmpty || viewModel.streamer.isEmpty || viewModel.amount.isEmpty || viewModel.comment.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    DonationsAdd(viewModel: DonationsViewModel())
}
