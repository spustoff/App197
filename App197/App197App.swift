//
//  App197App.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_WCsQYuzQkuBS2mK4j3mvgJiB37PGzB")
        Amplitude.instance().initializeApiKey("69650ea2e3857c34101b2607033a5114")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App197App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
