import UIKit

// MARK: - Class

final class LaunchScreenView: UIView {
    
    // MARK: - Private variables
    
    lazy var logo: UIImageView = {
        $0.image = UIImage(named: "swiftIcon")
        return $0
    }(UIImageView())
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .darkGray
        addComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LaunchScreenView {
    
    // MARK: - Private methods
    
    private func addComponents() {
        addSubview(logo, constraints: true)
    }
    
    private func setupConstraints() {
        logo.width(size: 90)
        logo.height(size: 90)
        logo.center(to: self)
    }
}
