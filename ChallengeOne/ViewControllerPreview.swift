#if canImport(SwiftUI) && DEBUG
import UIKit
import SwiftUI

extension UIViewController {

    // 2
    private struct Preview: UIViewControllerRepresentable {

        // 3
        let viewController: UIViewController

        // 4
        func makeUIViewController(context: Context) -> UIViewController {
            viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }

    // 5
    public var preview: some View {
        return Preview(viewController: self)
    }
}

//extension Array<Element> where Element == UIViewController {
//    // 2
//    private struct Preview: UIViewControllerRepresentable {
//
//        // 3
//        let viewControllers: [Element]
//
//        // 4
//        func makeUIViewController(context: Context) -> [Element] {
//            viewControllers
//        }
//
//        func updateUIViewController(_ uiViewControllers: [Element], context: Context) {}
//    }
//
//    // 5
//    public var preview: some View {
//        return Preview(viewControllers: self)
//    }
//
//
//}
#endif
