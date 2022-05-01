// MARK: - Class

import UIKit

public final class BeginCoordinator: Coordinator {
    
    // MARK: - Public variables
    
    public weak var parent: Coordinator?
    public var children = [Coordinator]()
    public var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public methods
    
    public func start() {
        let viewModel = MainViewModel(coordinator: self)
        let viewController = MainViewController(viewModel: viewModel)
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToMainMenu() {
        let viewModel = MainMenuViewModel(coordinator: self)
        let viewController = MainMenuViewController(viewModel: viewModel)
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(viewController, animated: true)
    }
}
