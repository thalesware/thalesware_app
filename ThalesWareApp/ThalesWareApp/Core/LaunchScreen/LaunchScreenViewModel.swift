import UIKit

// MARK: - Class

final class LaunchScreenViewModel {
        
    // MARK: - Private variables
    
    private let coordinator: AppCoordinator
    
    // MARK: - Initializers
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}

extension LaunchScreenViewModel {
    
    // MARK: - Internal methods
    
    func routeToConfigFlow() {
        coordinator.startWareApp()
    }
}
