import UIKit

/// The relation between the first attribute and the modified second attribute in a constraint.

public enum NSLayoutConstraintType {
    case equal
    case greaterThanOrEqual
    case lessThanOrEqual
    
    func get() -> NSLayoutConstraint.Relation {
        switch self {
        case .equal:
            return NSLayoutConstraint.Relation.equal
        case .greaterThanOrEqual:
            return NSLayoutConstraint.Relation.greaterThanOrEqual
        case .lessThanOrEqual:
            return NSLayoutConstraint.Relation.lessThanOrEqual
        }
    }
}

extension NSLayoutConstraint {
    static func inset(view: UIView,
                      inSuperView superview: UIView,
                      withInset inset: UIEdgeInsets? = nil) -> [NSLayoutConstraint] {
        
        return [.top(firstView: superview, secondView: view, relation: .equal, constant: -Float(inset?.top ?? 0)),
                .left(firstView: superview, secondView: view, relation: .equal, constant: -Float(inset?.left ?? 0)),
                .right(firstView: superview, secondView: view, relation: .equal, constant: Float(inset?.right ?? 0)),
                .bottom(firstView: superview, secondView: view, relation: .equal, constant: Float(inset?.bottom ?? 0))
        ]
    }
    
    static func top(firstView: UIView,
                    secondView: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .top,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .top,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func left(firstView: UIView,
                    secondView: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .left,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .left,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func right(firstView: UIView,
                    secondView: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .right,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .right,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func bottom(firstView: UIView,
                    secondView: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .bottom,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .bottom,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func baseLine(firstView: UIView,
                    secondView: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .firstBaseline,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .firstBaseline,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func over(topItem: UIView,
                    bottomItem: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: topItem,
                                  attribute: .bottom,
                                  relatedBy: relation.get(),
                                  toItem: bottomItem,
                                  attribute: .top,
                                  multiplier: 1,
                                  constant: -1 * CGFloat(constant))
    }
    
    static func aside(left: UIView,
                      right: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: left,
                                  attribute: .right,
                                  relatedBy: relation.get(),
                                  toItem: right,
                                  attribute: .left,
                                  multiplier: 1,
                                  constant: -1 * CGFloat(constant))
    }
    
    static func height(firstView: UIView,
                       secondView: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: Float,
                       multiplier: CGFloat = 1) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .height,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .height,
                                  multiplier: multiplier,
                                  constant: CGFloat(constant))
    }
    
    static func height(view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: Float) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: view,
                                  attribute: .height,
                                  relatedBy: relation.get(),
                                  toItem: nil,
                                  attribute: .notAnAttribute,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }

    static func width(firstView: UIView,
                       secondView: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: Float,
                       multiplier: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .width,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .width,
                                  multiplier: multiplier,
                                  constant: CGFloat(constant))
    }

    static func width(view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: Float) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: view,
                                  attribute: .width,
                                  relatedBy: relation.get(),
                                  toItem: nil,
                                  attribute: .notAnAttribute,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func aspectRadio(view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: Float) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: view,
                                  attribute: .width,
                                  relatedBy: relation.get(),
                                  toItem: view,
                                  attribute: .height,
                                  multiplier: CGFloat(constant),
                                  constant: 0)
    }
    
    static func centerY(firstView: UIView,
                       secondView: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .centerY,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .centerY,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    static func centerX(firstView: UIView,
                       secondView: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: Float = 0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView,
                                  attribute: .centerX,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: .centerX,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
}

public extension Array where Element == NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate(self)
    }
    
    func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
}

public extension UIView {
    var dsl: AutoLayoutDSLConstraint {
        return AutoLayoutDSLConstraint(view: self)
    }
}

public class AutoLayoutDSLConstraint {
    let view: UIView
    
    public var height: NSLayoutDimension { return view.heightAnchor }
    public var widht: NSLayoutDimension { return view.widthAnchor }
    
    init(view: UIView) {
        self.view = view
    }
    
    public func applyConstraint(_ block: ((AutoLayoutDSLConstraint) -> Void)) {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(self)
    }
    
    public func edges(in superView: UIView,
                      with offSet: UIEdgeInsets? = nil) {
        let constraints = NSLayoutConstraint.inset(view: self.view,
                                                   inSuperView: superView,
                                                   withInset: offSet)
        
        constraints.activate()
    }
    
    public func edges(in superView: UIView,
                      offSet: CGFloat,
                      priority: UILayoutPriority = .required) {
        let inset = UIEdgeInsets(top: offSet, left: offSet, bottom: offSet, right: offSet)
        let constraints = NSLayoutConstraint.inset(view: self.view,
                                                   inSuperView: superView,
                                                   withInset: inset)
        
        constraints.forEach { $0.priority = priority }
        constraints.activate()
    }
    
    @discardableResult
    public func top(alignedWith view: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    offSet: Float = 0,
                    priority: UILayoutPriority = .required) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.top(firstView: self.view,
                                                secondView: view,
                                                relation: relation,
                                                constant: offSet)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func left(alignedWith: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    offSet: Float = 0,
                    priority: UILayoutPriority = .required) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.left(firstView: self.view,
                                                secondView: alignedWith,
                                                relation: relation,
                                                constant: offSet)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    public func right(alignedWith: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    offSet: Float = 0,
                    priority: UILayoutPriority = .required) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.right(firstView: self.view,
                                                secondView: alignedWith,
                                                relation: relation,
                                                constant: -offSet)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func bottom(alignedWith: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    offSet: Float = 0,
                    priority: UILayoutPriority = .required) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.bottom(firstView: self.view,
                                                secondView: alignedWith,
                                                relation: relation,
                                                constant: -offSet)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func baseLine(alignedWith: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    offSet: Float = 0) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.baseLine(firstView: self.view,
                                                secondView: alignedWith,
                                                relation: relation,
                                                constant: -offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func under(view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: Float = 0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.over(topItem: view,
                                                 bottomItem: self.view,
                                                 relation: relation,
                                                 constant: offSet)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func above(view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: Float = 0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.over(topItem: self.view,
                                                 bottomItem: view,
                                                 relation: relation,
                                                 constant: offSet)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func right(of view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: Float = 0) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.aside(left: view,
                                                  right: self.view,
                                                  relation: relation,
                                                  constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func left(of view: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     offSet: Float = 0) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.aside(left: self.view,
                                                  right: view,
                                                  relation: relation,
                                                  constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func height(relatedTo view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       priority: UILayoutPriority = .required,
                       multiplier: CGFloat = 1,
                       _ size: Float = 0) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.height(firstView: self.view,
                                                   secondView: view,
                                                   relation: relation,
                                                   constant: size,
                                                   multiplier: multiplier)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func height(relation: NSLayoutConstraintType = .equal,
                       priority: UILayoutPriority = .required,
                       _ size: Float = 0) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.height(view: self.view,
                                                   relation: relation,
                                                   constant: size)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func height(equalTo dimension: NSLayoutDimension,
                       priority: UILayoutPriority = .required,
                       multiplier: Float = 1,
                       _ size: Float = 0) -> NSLayoutConstraint {

        return anchor(\.heightAnchor, to: dimension, priority: priority, multiplier: multiplier, size)
    }
    
    @discardableResult
    public func widht(relatedTo view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       multiplier: CGFloat = 1,
                       _ size: Float = 0) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.width(firstView: self.view,
                                                  secondView: view,
                                                  relation: relation,
                                                  constant: size,
                                                  multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func widht(relation: NSLayoutConstraintType = .equal,
                      _ size: Float) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.width(view: self.view,
                                                  relation: relation,
                                                  constant: size)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func width(equalTo dimension: NSLayoutDimension,
                       priority: UILayoutPriority = .required,
                       multiplier: Float = 1,
                       _ size: Float = 0) -> NSLayoutConstraint {

        return anchor(\.widthAnchor, to: dimension, priority: priority, multiplier: multiplier, size)
    }
    
    public func size(relation: NSLayoutConstraintType = .equal,
                     _ size: Float) {
        widht(relation: relation, size)
        height(relation: relation, size)
    }
    
    public func verticalCenter(view: UIView,
                               relation: NSLayoutConstraintType = .equal,
                               offSet: Float = 0) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.centerY(firstView: self.view,
                                                    secondView: view,
                                                    relation: relation,
                                                    constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    public func horizontalCenter(view: UIView,
                                 relation: NSLayoutConstraintType = .equal,
                                 offSet: Float = 0,
                                 priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.centerX(firstView: self.view,
                                                    secondView: view,
                                                    relation: relation,
                                                    constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    public func center(in view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       offSet: Float = 0) {
        
        horizontalCenter(view: view, relation: relation, offSet: offSet)
        verticalCenter(view: view, relation: relation, offSet: offSet)
    }
    
    @discardableResult
    private func anchor(_ dimensionKeyPath: KeyPath<UIView, NSLayoutDimension>,
                        to dimension: NSLayoutDimension,
                        priority: UILayoutPriority = .required,
                        multiplier: Float = 1,
                        _ size: Float = 0) -> NSLayoutConstraint {

        let anchor = view[keyPath: dimensionKeyPath]
        let constraint = anchor.constraint(equalTo: dimension, multiplier: CGFloat(multiplier), constant: CGFloat(size))
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
        
    }
    
    
}
