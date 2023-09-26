//
//  TopView.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct TopView: View {
    
    @StateObject var viewModel = TopViewModel()
    @StateObject var donationModel = DonationsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("TOP DONATIONS")
                    .foregroundColor(.white)
                    .font(.system(size: 21, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                HStack {
                    
                    ForEach(viewModel.tabs, id: \.self) { index in
                        
                        Text(index)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(height: 35)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(viewModel.current_tab == index ? 0.8 : 0.1) ))
                            .onTapGesture {
                                
//                                viewModel.current_tab = index
                            }
                    }
                }
                .padding(.horizontal)
                
                if donationModel.donations.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("empty")
                        
                        VStack(spacing: 7, content: {
                            
                            Text("No donations")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text("You don't have added donations yet")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        })
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                     
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(donationModel.donations, id: \.self) { index in
                                
                                HStack(spacing: 10) {
                                    
                                    Image(index.platform ?? "")
                                        .frame(width: 40, height: 70)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                    
                                    HStack(alignment: .top) {
                                        
                                        VStack(alignment: .leading, spacing: 6, content: {
                                            
                                            Text(index.streamer ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .medium))
                                            
                                            Text("$\(index.amount)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 17, weight: .regular))
                                        })
                                        
                                        Spacer()
                                        
                                        Text((index.date ?? Date()).convertDate(format: "MMM d"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .padding()
                                    .frame(height: 70)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            
            donationModel.fetchDonations()
        }
    }
}

#Preview {
    TopView()
}
