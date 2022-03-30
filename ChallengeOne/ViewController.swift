import UIKit

public final class ViewController: UIViewController {

    var viewModel: ViewModelProtocol

    public init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
