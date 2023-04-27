//
//  SceneDelegate.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import UIKit

public class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    public var window: UIWindow?

    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = .init(windowScene: windowScene)
        window?.rootViewController = ConverterFactory.create(viewModel: SceneDelegate.getConverterViewModel())
        window?.makeKeyAndVisible()
        UserDefaults.hasRunBefore = true
    }
    
    public static func getConverterViewModel() -> ConverterViewModel {
        if !UserDefaults.hasRunBefore {
            let viewModel: ConverterViewModel = .mock
            syncConverterViewModel(viewModel: viewModel)
            return viewModel
        }
        
        return .init(
            accountItems: [
                .init(
                    currency: .EUR,
                    amount: UserDefaults.standard.double(forKey: Currency.EUR.key)
                ),
                .init(
                    currency: .USD,
                    amount: UserDefaults.standard.double(forKey: Currency.USD.key)
                ),
                .init(
                    currency: .JPY,
                    amount: UserDefaults.standard.double(forKey: Currency.JPY.key)
                )
            ],
            numberOfFreeExchange: UserDefaults.numberOfFreeExchange,
            commissionPercentage: UserDefaults.commissionPercentage
        )
    }
    
    static public func syncConverterViewModel(viewModel: ConverterViewModel) {
        viewModel.accountItems.forEach { accountItem in
            UserDefaults.standard.set(accountItem.amount, forKey: accountItem.currency.key)
        }
        UserDefaults.numberOfFreeExchange = viewModel.numberOfFreeExchange
        UserDefaults.commissionPercentage = viewModel.commissionPercentage
    }
}

