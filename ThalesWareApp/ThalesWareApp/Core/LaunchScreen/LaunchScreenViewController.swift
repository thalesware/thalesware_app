import UIKit

// MARK: - Class
final class LaunchScreenViewController: ViewController<LaunchScreenView> {
    
    // MARK: - Private Variables
    
    private let viewModel: LaunchScreenViewModel
    
    // MARK: - Initializers
    
    init(viewModel: LaunchScreenViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoAppearing()
    }
    
    private func logoAppearing() {
        customView.logo.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        customView.logo.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            self.customView.backgroundColor = .white
            self.customView.logo.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.customView.logo.alpha = 1
        }, completion: { finished in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.logoDisappearring()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.viewModel.routeToConfigFlow()
            }
        })
    }
    
    private func logoDisappearring() {
        UIView.animate(withDuration: 0.5, animations: {
            self.customView.logo.transform = CGAffineTransform(translationX: 0, y: -50)
            self.customView.logo.alpha = 0
        })
    }
}
