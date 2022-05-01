import UIKit

// MARK: - Class

open class View: UIView {
    
    // MARK: - Public variables
    
    public var scrollView = UIScrollView()
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension

public extension View {
    
    // MARK: - Public methods
    
    
}
