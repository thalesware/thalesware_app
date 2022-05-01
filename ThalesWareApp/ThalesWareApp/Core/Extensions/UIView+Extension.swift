import UIKit

public extension UIView {
    
    // MARK: - Anchors extensions
    
    enum AnchorType {
        case all
        case top
        case bottom
        case leading
        case trailing
        case heigth
        case width
        case centerX
        case centerY
    }
    
    var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var widthConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }

    var bottomConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .bottom && $0.relation == .equal
            })
        }
        
        set { setNeedsLayout() }
    }
    
    var globalPoint :CGPoint? {
       return self.superview?.convert(self.frame.origin, to: nil)
    }

    var globalFrame :CGRect? {
       return self.superview?.convert(self.frame, to: nil)
    }
    
    func addSubview(_ subview: UIView, constraints: Bool) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = !constraints
    }
    
    func addSubviews(_ subviews: [UIView], constraints: Bool) {
        for subview in subviews {
            addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = !constraints
        }
    }
    
    func applyAnchors(ofType: [AnchorType], to referenceView: UIView, safeArea: Bool = false) {
        
        if ofType.contains(.all) {
            if safeArea {
                if #available(iOS 11.0, *) {
                    self.topAnchor.constraint(equalTo: referenceView.safeAreaLayoutGuide.topAnchor).isActive = true
                } else {
                    self.topAnchor.constraint(equalTo: referenceView.topAnchor).isActive = true
                }
            } else {
                self.topAnchor.constraint(equalTo: referenceView.topAnchor).isActive = true
            }
            self.leadingAnchor.constraint(equalTo: referenceView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: referenceView.trailingAnchor).isActive = true
            if safeArea {
                if #available(iOS 11.0, *) {
                    self.bottomAnchor.constraint(equalTo: referenceView.safeAreaLayoutGuide.bottomAnchor).isActive = true
                } else {
                    self.bottomAnchor.constraint(equalTo: referenceView.bottomAnchor).isActive = true
                }
            } else {
                self.bottomAnchor.constraint(equalTo: referenceView.bottomAnchor).isActive = true
            }
            return
        }
        
        if ofType.contains(.bottom) {
            if safeArea {
                if #available(iOS 11.0, *) {
                    self.bottomAnchor.constraint(equalTo: referenceView.safeAreaLayoutGuide.bottomAnchor).isActive = true
                } else {
                    self.bottomAnchor.constraint(equalTo: referenceView.bottomAnchor).isActive = true
                }
            } else {
                self.bottomAnchor.constraint(equalTo: referenceView.bottomAnchor).isActive = true
            }
        }
        
        if ofType.contains(.top) {
            if safeArea {
                if #available(iOS 11.0, *) {
                    self.topAnchor.constraint(equalTo: referenceView.safeAreaLayoutGuide.topAnchor).isActive = true
                } else {
                    self.topAnchor.constraint(equalTo: referenceView.topAnchor).isActive = true
                }
            } else {
                self.topAnchor.constraint(equalTo: referenceView.topAnchor).isActive = true
            }
        }
        
        if ofType.contains(.trailing) {
            self.trailingAnchor.constraint(equalTo: referenceView.trailingAnchor).isActive = true
        }
        
        if ofType.contains(.leading) {
            self.leadingAnchor.constraint(equalTo: referenceView.leadingAnchor).isActive = true
        }
        
        if ofType.contains(.heigth) {
            self.heightAnchor.constraint(equalTo: referenceView.heightAnchor).isActive = true
        }
        
        if ofType.contains(.width) {
            self.widthAnchor.constraint(equalTo: referenceView.widthAnchor).isActive = true
        }
        
        if ofType.contains(.centerX) {
            self.centerXAnchor.constraint(equalTo: referenceView.centerXAnchor).isActive = true
        }
        if ofType.contains(.centerY) {
            self.centerYAnchor.constraint(equalTo: referenceView.centerYAnchor).isActive = true
        }
    }
    
    func applyConstraints(_ toView: UIView,
                          applyAnchor: [(anchor: AnchorType, constraint: CGFloat)],
                          safeArea: Bool = false) {
        applyAnchor.forEach { element in
            switch element.anchor {
            case .all:
                if #available(iOS 11.0, *) {
                    self.topAnchor.constraint(equalTo: (safeArea ? toView.safeAreaLayoutGuide.topAnchor : toView.topAnchor),
                                              constant: element.constraint).isActive = true
                } else {
                    self.topAnchor.constraint(equalTo: toView.topAnchor,
                                              constant: element.constraint).isActive = true
                }
                self.leadingAnchor.constraint(equalTo: toView.leadingAnchor,
                                              constant: element.constraint).isActive = true
                self.trailingAnchor.constraint(equalTo: toView.trailingAnchor,
                                               constant: element.constraint).isActive = true
                self.bottomAnchor.constraint(equalTo: toView.bottomAnchor,
                                             constant: element.constraint).isActive = true
            case .top:
                if #available(iOS 11.0, *) {
                    self.topAnchor.constraint(equalTo: (safeArea ? toView.safeAreaLayoutGuide.topAnchor : toView.topAnchor),
                                              constant: element.constraint).isActive = true
                } else {
                    self.topAnchor.constraint(equalTo: toView.topAnchor,
                                              constant: element.constraint).isActive = true
                }
                
            case .bottom:
                self.bottomAnchor.constraint(equalTo: toView.bottomAnchor,
                                             constant: element.constraint).isActive = true
                
            case .leading:
                self.leadingAnchor.constraint(equalTo: toView.leadingAnchor,
                                              constant: element.constraint).isActive = true
                
            case .trailing:
                self.trailingAnchor.constraint(equalTo: toView.trailingAnchor,
                                               constant: element.constraint).isActive = true
                
            case .heigth:
                self.heightAnchor.constraint(equalTo: toView.heightAnchor,
                                             constant: element.constraint).isActive = true
                
            case .width:
                self.widthAnchor.constraint(equalTo: toView.widthAnchor,
                                            constant: element.constraint).isActive = true
                
            case .centerX:
                self.centerXAnchor.constraint(equalTo: toView.centerXAnchor,
                                              constant: element.constraint).isActive = true
                
            case .centerY:
                self.centerYAnchor.constraint(equalTo: toView.centerYAnchor,
                                              constant: element.constraint).isActive = true
            }
        }
    }
    
    @discardableResult
    func height(size: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        constraint = heightAnchor.constraint(equalToConstant: size)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func height(min: CGFloat) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: min)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func width(size: CGFloat) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        constraint = widthAnchor.constraint(equalToConstant: size)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func width(min: CGFloat) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: min)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerX(to: UIView, padding: CGFloat? = 0) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        constraint = centerXAnchor.constraint(equalTo: to.centerXAnchor, constant: padding ?? 0)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerY(to: UIView, padding: CGFloat? = nil) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        constraint = centerYAnchor.constraint(equalTo: to.centerYAnchor, constant: padding ?? 0)
        constraint.isActive = true
        return constraint
    }
    
    func center(to view: UIView) {
        self.applyAnchors(ofType: [.centerX, .centerY], to: view)
    }
    
    func flexibleConstraintHeight(_ to: UIView) {
        applyAnchors(ofType: [.top, .trailing, .bottom, .leading], to: to)
        
        let widthConstraint = widthAnchor.constraint(equalTo: to.widthAnchor)
        widthConstraint.isActive = true
        
        let heigthConstraint = heightAnchor.constraint(equalTo: to.heightAnchor)
        heigthConstraint.priority = UILayoutPriority(250.0)
        heigthConstraint.isActive = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}
