import UIKit

// MARK: - Class

final class MainViewModel {
    
    // MARK: - Internal variables
    
    var hasAccounts = false
    
    // MARK: - Private variables
    
    private let coordinator: BeginCoordinator
    
    
    // MARK: - Initializers
    
    init(coordinator: BeginCoordinator) {
        self.coordinator = coordinator
        setupInitialFlow()
    }
}

extension MainViewModel {
    
    // MARK: - Internal methods
    
    // MARK: - Private methods
    
    func setupInitialFlow() {
//        guard
//            let accounts = Storage.fetchAccounts(),
//            accounts.count > 0
//        else {
//            hasAccounts = false
//            return
//        }
//
//        hasAccounts = true
    }
    
//    func route(to error: ResponseError, controller: UIViewController) {
//        coordinator.present(error: error, controller: controller)
//    }
    
    func routeToMainMenu() {
        coordinator.routeToMainMenu()
    }
}
