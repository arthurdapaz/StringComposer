import UIKit
import XCTest
@testable import StringComposer

final class StringComposerTests: XCTestCase {

    lazy var label: UILabel = {
        var l = UILabel()
        l.font = UIFont.preferredFont(forTextStyle: .body)

        return l
    }()

    lazy var image: UIImage = UIImage()


    func testA() {

//        let text = StringComposer {
//            Paragraph {
//                "A estagnação no atraso é compreensível. fi-lo porque quilo "
//                "Assumir a responsabilidade de nossos atos é enxergar, " <- .shadow(.with(color: .brown, blur: 1.0))
//                " no espelho da consciência, a beleza das virtudes, mas fi-lo também, "
//                "clique aqui" <- .italicized(label.font)
//                " enfrentar os horrores de nossos vícios e as fraquezas morais que nos " <- .
//                image <- .height(20)
//                // You can also use #imageLiteral(resourceName: <#T##Image Name#>)
//                " derrubam ao chão de nossa vergonha, isso, "
//                "quando a temos." <- .underlineStyle(.patternDash) <- .underlineColor(.red)
//                " Embora esta correção seja inevitável."
//            }
//            .alignment(.justified)
//            .firstLineHeadIndent(20.0)
//            .headIndent(10.0)
//            .paragraphSpacing(10.0)
//
//            Paragraph {
//                "A prece é o feixe de luz que mantém o contato mais " <- .ultraLight(label.font)
//                "estreito do homem e da mulher, encarnados na Terra, com os seus pares invisíveis."
//            }
//            .alignment(.left)
//            .paragraphSpacing(10.0)
//
//            Paragraph {
//                "A prece é o feixe de luz que mantém o contato mais " <- .bolded(label.font)
//                "estreito do homem e da mulher, encarnados na Terra, com os seus pares invisíveis."
//            }
//            .alignment(.right)
//            .paragraphSpacing(10.0)
//
//            Paragraph {
//                "A prece é o feixe de luz que mantém o contato mais " <- .bolded(label.font)
//                "estreito do homem e da mulher, encarnados na Terra, com os seus pares invisíveis."
//            }
//
//        }.composed

        let text = StringComposer {

            Paragraph(label.font) {
                "Hello,"
                "Arthur!" <- .bolded
                "Lorem dolor sit amet, consectetur adipiscing elit."
                "Nam maximus vehicula dui, nec sodales odio hendrerit nec." <- .font(UIFont.preferredFont(forTextStyle: .callout))
                "Phasellus eget purus nunc. Ut cursus tincidunt elementum."
                "Vestibulum in sem quam. Donec."

            }.alignment(.justified)
                .firstLineHeadIndent(12.0)
                .lineHeightMultiple(1.1)
                .paragraphSpacing(12.0)
                .compose(with: .textEffect(.letterPressStyle))

            Paragraph {
                "Hello,"
                "Arthur!" <- .heavy
                "Lorem dolor sit amet, consectetur adipiscing elit."
                image <- .height(40)
                "Nam maximus vehicula dui, nec sodales odio hendrerit nec."
                "Phasellus eget purus nunc. Ut cursus tincidunt elementum."
                "Vestibulum in sem quam. Donec."
            }
            
        }.composed

        XCTAssertTrue(text.string.count > 758)
    }

    //    func testB() {
    //
    //    }

    static var allTests = [
        ("testA", testA),
        //("testB", testB),
    ]
}
