import UIKit

// MARK: - Class

public class WareButton: UIButton {
    
    public typealias ActionVoid = () -> Void
    
    // MARK: - Public variables
    
    public enum Style {
        case blueButton, whiteButton, blackButton, redButton, transparentButton(TransparentColor = .homer), orangeButton
    }
    
    public enum TransparentColor {
        case moeLight
        case homer
        
        var color: UIColor {
            switch self {
            case .homer:
                return .gray
            case .moeLight:
                return .systemBlue
            }
        }
    }
    
    public var buttonStyle = Style.blueButton {
        didSet {
            updateLayout()
        }
    }
    
    override public var isEnabled: Bool {
        didSet {
            updateLayout()
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            updateLayout()
        }
    }
    
    public var title: String = "" {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    
    public var closeKeyboard: ActionVoid?
    
    // MARK: - Initializers
    
    public init(title: String? = nil, style: Style, fontSize: CGFloat? = 16.0) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        guard let fontSize = fontSize else { return }
        titleLabel?.font = UIFont(name: "Georgia-Bold", size: fontSize)
        buttonStyle = style
        
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

extension WareButton {
    
    // MARK: - Private methods
    
    private func commonInit() {
        layer.cornerRadius = 15.0
        titleLabel?.textAlignment = .center
        titleLabel?.minimumScaleFactor = 7.0
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.lineBreakMode = .byWordWrapping
        updateLayout()
        
    }
    
    private func updateLayout() {
        switch buttonStyle {
            
        case .blueButton:
            setTitleColor(.white, for: .normal)
            backgroundColor = isEnabled ? .blue : .lightGray
            
        case .whiteButton:
            
            let fontColor: UIColor = isEnabled ? .black : .gray
            setTitleColor(fontColor, for: .normal)
            backgroundColor = .white
            
        case .blackButton:
            setTitleColor(.white, for: .normal)
            backgroundColor = isEnabled ? .black : .lightGray
            
        case .redButton:
            setTitleColor(.white, for: .normal)
            backgroundColor = isEnabled ? .red : .lightGray
            
        case let .transparentButton(color):
            setTitleColor(color.color, for: .normal)
            backgroundColor = .clear
            
        case .orangeButton:
            setTitleColor(.black, for: .normal)
            backgroundColor = isEnabled ? .orange : .lightGray
            
        }
    }
}
