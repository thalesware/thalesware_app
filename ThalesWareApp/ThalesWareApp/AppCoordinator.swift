import UIKit

// MARK: - Class

final class AppCoordinator: Coordinator {
    
    // MARK: - Internal variables
    
    weak var parent: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension AppCoordinator {
    
    // MARK: Internal methods
    
    func start() {
        startLaunchScreen()
    }
    
    func startWareApp() {
        let coord = BeginCoordinator(navigationController: navigationController)
        add(coord)
        coord.start()
        coord.parent = self
        
        navigationController.removeViewController(LaunchScreenViewController.self)
    }
    
    private func startLaunchScreen() {
        let viewModel = LaunchScreenViewModel(coordinator: self)
        let viewController = LaunchScreenViewController(viewModel: viewModel)
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(viewController, animated: false)
    }
}
