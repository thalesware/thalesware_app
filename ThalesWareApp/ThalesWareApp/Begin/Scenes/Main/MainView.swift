import UIKit

final class MainView: UIView {
    
    // MARK: - Private variables
    
    let spinner: UIActivityIndicatorView = {
        $0.width(size: 40.0)
        $0.height(size: 40.0)
        $0.style = .gray
        $0.startAnimating()
        return $0
    }(UIActivityIndicatorView())
    
    // MARK: - Initializers
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        addComponents()
        setupSpinner()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    func addComponents() {
        addSubview(spinner, constraints: true)
    }
    
    func setupSpinner() {
        spinner.center(to: self)
    }
}
