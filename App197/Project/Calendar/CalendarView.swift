//
//  CalendarView.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct CalendarView: View {
    
    @State var current_date: Date = Date()
    
    @StateObject var viewModel = DonationsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("CALENDAR")
                    .foregroundColor(.white)
                    .font(.system(size: 21, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        DatePicker("", selection: $current_date)
                            .datePickerStyle(.graphical)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                        Text("My Donations")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 30)
                        
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
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            
            viewModel.fetchDonations()
        }
    }
}

#Preview {
    CalendarView()
}
