

import  UIKit

@IBDesignable class CustomProgressView: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            progressBarView.layer.cornerRadius = cornerRadius
            layer.cornerRadius = cornerRadius
        }
    }
    
    private let progressBarView = UIView()
    private var widthConstraint: NSLayoutConstraint!
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 4.0)
    }
    
    override var tintColor: UIColor! {
        didSet {
            progressBarView.backgroundColor = tintColor
        }
    }
    
    @IBInspectable public var progress: Float = 0 {
        didSet {
            if let wc = widthConstraint {
                wc.isActive = false
                let pct = min(progress, 1.0)
                self.widthConstraint = progressBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: CGFloat(pct))
                self.widthConstraint.isActive = true
            }
        }
    }
    public func setProgress(_ p: Float, animated: Bool) -> Void {
        let doAnim = animated && progressBarView.frame.height != 0
        self.progress = p
        if doAnim {
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
            })
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        if backgroundColor == nil {
            backgroundColor = UIColor.black.withAlphaComponent(0.1)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() -> Void {
        if backgroundColor == nil {
            backgroundColor = UIColor.black.withAlphaComponent(0.1)
        }
        tintColor = .blue
        cornerRadius = 4
        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressBarView)
        widthConstraint = progressBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.0)
        NSLayoutConstraint.activate([
      
            progressBarView.topAnchor.constraint(equalTo: topAnchor),
            progressBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressBarView.bottomAnchor.constraint(equalTo: bottomAnchor),
           
            widthConstraint,
        ])
        clipsToBounds = true
    }
    
}
