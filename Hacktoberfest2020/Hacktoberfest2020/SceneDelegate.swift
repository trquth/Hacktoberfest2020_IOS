//
//  SceneDelegate.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/9/20.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //***************** Old code *****************************************
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//        window?.backgroundColor = .white
//        //window?.overrideUserInterfaceStyle = .light
//        let lootLoggerVC = LootLoggerVC()
//        lootLoggerVC.itemStore = ItemStore()
//        window?.rootViewController = NetworkingTabBar()
//        window?.makeKeyAndVisible()
        //***************** New code *****************************************
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            //Storyboard
            let sb = UIStoryboard(name: "CollectionViewSection", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "FlowLayoutCollection")
            self.window?.rootViewController = vc
            //self.window?.rootViewController =  CellBackgroundLayeringCollectionVC()
            //self.window?.rootViewController = UINavigationController(rootViewController: EditInsertAndRearrangeTableVC())
            self.window?.makeKeyAndVisible()
        }
        
        //*************************TABBAR CONFIG**********************************
        self.window?.tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .black
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Avenir-Light", size: 14)!,.foregroundColor: UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Avenir-Light", size: 14)!,.foregroundColor: UIColor.orange], for: .selected)
        //************************NAVBAR CONFIG**********************************
        
        do{
            print("******************🍎🍎 NAVIGATION BAR CONFIGURATION FOR ALL SCREENS 🍎🍎 *************************")
            let navBarConfig = UINavigationBarAppearance()
            navBarConfig.configureWithOpaqueBackground()
            navBarConfig.backgroundColor = .brown //No effect.
            UINavigationBar.appearance().scrollEdgeAppearance = navBarConfig
            UINavigationBar.appearance().standardAppearance = navBarConfig
        }
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

