import UIKit

open class NibLoadingView: UIView {
    
    public override init(
        frame: CGRect
    ) {
        super.init(
            frame: frame
        )
        loadview()
    }
    
    public required init?(
        coder aDecoder: NSCoder
    ) {
        super.init(
            coder: aDecoder
        )
        loadview()
    }
    
    private func loadview(){
        let bundle = Bundle(
            for: type(
                of: self
            )
        )
        let className = String(
            describing: type(
                of: self
            ).description().components(
                separatedBy: "."
            ).last ?? ""
        )
        let nib = UINib(
            nibName: className,
            bundle: bundle
        )
        
        
        guard let view = nib.instantiate(
            withOwner: self,
            options: nil
        ).first as? UIView else {
            fatalError(
                "Failed to load nib for view \\(className)."
            )
        }
        view.frame = self.bounds
        view.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        self.addSubview(
            view
        )
    }
}
