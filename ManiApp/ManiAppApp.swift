//
//  ManiAppApp.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct ManiAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = FirebaseConfig()

    var body: some Scene {
        WindowGroup {
            if authViewModel.isLoggedIn {
                TabbarView()
                    .environmentObject(authViewModel)
                                        .task {
                                            await authViewModel.fetchSummary()
                                        }
            } else {
                OnboardingView()
            }
        }
    }
}
