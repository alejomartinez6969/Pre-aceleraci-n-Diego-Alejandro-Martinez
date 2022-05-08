//
//  SceneDelegate.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 28/04/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let homeViewController = ListViewController()
        let loginViewController = loginViewController()
        let navigationControler = UINavigationController(rootViewController: loginViewController)
        
        
        window?.rootViewController = navigationControler
        
        
        window?.makeKeyAndVisible()
        
        
        
    }

   

}

