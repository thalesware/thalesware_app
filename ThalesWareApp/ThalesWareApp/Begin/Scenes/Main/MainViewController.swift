import UIKit

// MARK: - Class

final class MainViewController: ViewController<MainView> {
    
    // MARK: - Private variables
    
    private let viewModel: MainViewModel
    
    // MARK: - Initializers
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewModel.routeToMainMenu()
        // Storage.fetchAccountsXamarin()
        //viewModel.setupInitialFlow()
//        if viewModel.hasAccounts {
//            viewModel.routeToListAccounts()
//        } else {
//            viewModel.routeToAgencyAndAccount()
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(sessionExpired),
                         name: .sessionExpired,
                         object: nil)
    }
}

extension MainViewController {
    
    // MARK: - Private methods
    
    @objc private func sessionExpired(notification: NSNotification) {
//        if let error = notification.userInfo?["error"] as? ResponseError {
//            MBKLoader().dismiss(on: self)
//            viewModel.route(to: error, controller: self)
//        }
    }
}

