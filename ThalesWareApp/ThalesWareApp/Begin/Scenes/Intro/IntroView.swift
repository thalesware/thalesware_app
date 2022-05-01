import UIKit

final class IntroView: View {
    
    // MARK: - Private variables
    
    // MARK: - Initializers
    
    public override init() {
        super.init()
        backgroundColor = .black
        
        addComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IntroView {
    
    func addComponents() {
        //addSubviews([title, buttonsStack], constraints: true)
    }
    
    func setupConstraints() {

//        NSLayoutConstraint.activate([
//            title.topAnchor.constraint(equalTo: topAnchor, constant: 120.0),
//            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40.0),
//            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0),
//            
//            buttonsStack.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 60.0),
//            buttonsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40.0),
//            buttonsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0),
//            buttonsStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50.0)
//        ])
    }
}
