//
//  App343App.swift
//  App343
//
//  Created by DJUNA on 22/02/2024.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import OneSignalFramework
import YandexMobileMetrica

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Apphud.start(apiKey: DataManager().appHudID)
        
        OneSignal.initialize(DataManager().oneSignalID, withLaunchOptions: launchOptions)
        YMMYandexMetrica.activate(with: YMMYandexMetricaConfiguration.init(apiKey: DataManager().metricaID)!)
        
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App343App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
                
                ContentView()
            }
        }
    }
}
