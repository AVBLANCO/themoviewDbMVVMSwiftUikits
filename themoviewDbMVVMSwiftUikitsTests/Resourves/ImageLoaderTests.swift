//
//  ImageLoaderTests.swift
//  themoviewDbMVVMSwiftUikitsTests
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import XCTest
import Combine

class ImageLoaderTests: XCTestCase {

    var imageLoader: ImageLoader!

    override func setUp() {
        super.setUp()
        imageLoader = ImageLoader()
    }

    func testLoadImageSuccess() {

        let url = URL(string: "https://example.com/image.jpg")!
        let imageData = try! Data(contentsOf: url)
        let expectedImage = UIImage(data: imageData)

        
        imageLoader.loadImage(from: url)
        XCTAssertNil(imageLoader.error)
        XCTAssertNotNil(imageLoader.image)
        XCTAssertEqual(imageLoader.image, expectedImage)
    }

    func testLoadImageError() {
        let url = URL(string: "https://example.com/non-existent-image.jpg")!
        let expectedError = NSError(domain: "com.example.ImageLoader",
                                    code: -1,
                                   userInfo: [NSLocalizedDescriptionKey: "No data received"])

        imageLoader.loadImage(from: url)


        XCTAssertNotNil(imageLoader.error)
        XCTAssertEqual(imageLoader.error, expectedError)
        XCTAssertNil(imageLoader.image)
    }

    func testLoadImageNil() {
        let url = URL(string: "https://example.com/no-image.jpg")!
        imageLoader.loadImage(from: url)
        XCTAssertNotNil(imageLoader.error)
        XCTAssertNil(imageLoader.image)
    }
}
