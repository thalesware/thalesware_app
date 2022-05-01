import UIKit

// MARK: - Class

open class ViewModel {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    
    private var coordinator: Coordinator
    
    // MARK: - Initializer
    
    public init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

// MARK: - Extension

public extension ViewModel {
    
    // MARK: - Public methods
    
    func back() {
        coordinator.back()
    }
    
    func backWithoutAnimation() {
        coordinator.backWithoutAnimation()
    }
    
}
