import UIKit

final class MainMenuView: View {
    
    // MARK: - Private variables
    
    let title = WareLabel(text: "", fontSize: 16.0, alignment: .center, textColor: .white, adjustsFontToFitWidth: true)
    
    let buttonsStack: UIStackView = {
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.spacing = 40.0
        return $0
    }(UIStackView())
    
    let startGameButton = WareButton(title: "Start Game", style: .orangeButton)
    
    let loadGameButton = WareButton(title: "Load Game", style: .orangeButton)
    
    let configGameButton = WareButton(title: "Config Game", style: .orangeButton)
    
    let secretButton = WareButton(title: "Secret Password", style: .transparentButton(.homer))
    
    let closeButton = WareButton(title: "Close Game", style: .orangeButton)
    
    // MARK: - Initializers
    
    public override init() {
        super.init()
        backgroundColor = .black
        
        addComponents()
        setupConstraints()
        
        title.attributedText = "Bem Vinda !!!<BR>Juliana Custodio (:".convertHtmlToAttributedStringWithCSS(font: UIFont(name: "Georgia-Bold", size: 16.0), csscolor: "#FFFFFF", lineheight: 5, csstextalign: "center")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainMenuView {
    func addComponents() {
        addSubviews([title, buttonsStack], constraints: true)
        buttonsStack.addArrangedSubview(startGameButton)
        buttonsStack.addArrangedSubview(loadGameButton)
        buttonsStack.addArrangedSubview(configGameButton)
        buttonsStack.addArrangedSubview(secretButton)
        buttonsStack.addArrangedSubview(closeButton)
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 120.0),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40.0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0),
            
            buttonsStack.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 60.0),
            buttonsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40.0),
            buttonsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0),
            buttonsStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50.0)
        ])
    }
}
