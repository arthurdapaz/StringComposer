import UIKit
import XCTest
@testable import StringComposer

final class StringComposerTests: XCTestCase {

    lazy var image: UIImage = UIImage()

    func basicTest() {

        let text = StringComposer {

            Paragraph {
                "Hello,"
                "Arthur!" § .bolded
                "Lorem dolor sit amet, consectetur adipiscing elit."
                "Nam maximus vehicula dui, nec sodales odio hendrerit nec." § .font(UIFont.preferredFont(forTextStyle: .callout))
                "Phasellus eget purus nunc. Ut cursus tincidunt elementum."
                "Vestibulum in sem quam. Donec."

            }.alignment(.justified)
                .firstLineHeadIndent(12.0)
                .lineHeightMultiple(1.1)
                .paragraphSpacing(12.0)
                .compose(with: .textEffect(.letterPressStyle))

            Paragraph {
                "Hello,"
                "Arthur!" § .heavy
                "Lorem dolor sit amet, consectetur adipiscing elit."
                image § .height(40)
                "Nam maximus vehicula dui, nec sodales odio hendrerit nec."
                "Phasellus eget purus nunc. Ut cursus tincidunt elementum."
                "Vestibulum in sem quam. Donec."
            }
            
        }.composed

        XCTAssertTrue(text.string.count > 200)
    }

    func singleLineStringTest() {
        let scs = StringComposer {
            "Works"
        }.composed

        let sci = StringComposer {
            image
        }.composed

        let ps = Paragraph {
            "Works"
        }.composed

        let pi = Paragraph {
            image
        }.composed


        XCTAssertTrue(sci.string.count == 0)
        XCTAssertTrue(pi.string.count == 0)
        XCTAssertTrue(scs.string.count == 5)
        XCTAssertTrue(ps.string.count == 5)
    }

    static var testes = [
        ("basicTest", basicTest),
        ("singleLineStringTest", singleLineStringTest),
    ]
}
