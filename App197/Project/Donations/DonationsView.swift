//
//  DonationsView.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct DonationsView: View {
    
    @StateObject var viewModel = DonationsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 50) {
                    
                    HStack {
                        
                        Text("MY DONATIONS")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .regular))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isAdd = true
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 15, weight: .medium))
                                .padding(7)
                                .background(Circle().fill(.white))
                        })
                    }
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        
                        Text("Total amount of donations")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("$\(viewModel.donations.map(\.amount).reduce(0, +))")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        Image("usd")
                        
                        Text("USD")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isChart = true
                            
                        }, label: {
                            
                            Text("Choose")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .medium))
                                .padding(.horizontal)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.4)))
                        })
                    }
                }
                .padding()
                .background(Color("primary").ignoresSafeArea(.all, edges: .top))
                
                Text("Latest Donations")
                    .foregroundColor(.white)
                    .font(.system(size: 21, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.donations.isEmpty {
                    
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
                            
                            ForEach(viewModel.donations, id: \.self) { index in
                                
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
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchDonations()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            DonationsAdd(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isChart, content: {
            
            DonationsSimulator()
        })
    }
}

#Preview {
    DonationsView()
}
