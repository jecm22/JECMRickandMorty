//
//  AppDelegate.swift
//  RickandMortyJECM
//
//  Created by Jesús Enrique Castro on 10/11/22.
//



import UIKit
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var internetStatus = false
    var internetType = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let monitor = NWPathMonitor()
                //closure : bloque de còdigo que se ejecuta de manera asincrona
                monitor.pathUpdateHandler = { path in
                    //path es un argumento que llega a la funcion
                    if path.status != .satisfied{
                        self.internetStatus = false
                        print("Sin servicio")
                    }else{
                        self.internetStatus = true
                        if path.usesInterfaceType(.wifi){
                            self.internetType = "WIF"
                        }else{
                            self.internetType = "Datos"
                        }
                        print("conectado")
                    }
                }
                monitor.start(queue: DispatchQueue.global())
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

