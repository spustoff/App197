//
//  TopViewModel.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

final class TopViewModel: ObservableObject {
    
    @Published var tabs: [String] = ["Bloggers"]
    @Published var current_tab: String = ""
    
    
}
