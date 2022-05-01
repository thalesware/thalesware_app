import UIKit

// MARK: - Coordinator Protocol

public protocol Coordinator: AnyObject {
    
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var parent: Coordinator? { get set }
    
    func start()
    func backToHome()
}

public extension Coordinator {
    
    func start() {}
    
    func add(_ child: Coordinator) {
        children.append(child)
        child.parent = self
    }

    func remove(_ child: Coordinator) {
        children.removeAll { $0 === child }
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func backWithoutAnimation() {
        navigationController.popViewController(animated: false)
    }
    
    func backToHome() {
        if let parent = parent {
            parent.remove(self)
            parent.backToHome()
        }
    }
    
    func finish() {
        if let parent = parent {
            parent.remove(self)
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    func customBack(lastInstance: Bool = false) {
        if let parent = parent {
            parent.customBack(lastInstance: lastInstance)
        }
    }
}
