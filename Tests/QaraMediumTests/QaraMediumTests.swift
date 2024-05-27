import XCTest
@testable import QaraMedium

final class QaraMediumTests: XCTestCase {
    
    private let token = ""
    
    private var sut: QaraMediumAPI!
    
    override func setUp() async throws {
        let network = Network(token: token)
        sut = QaraMediumAPI(network: network, token: token)
    }
    
    func testCreatingPost() async {
        let expectationGettingUsers = expectation(description: "Request - get user")
        let expectationCreatingPost = expectation(description: "Request - create an article")
        
        var me: QaraMediumUser?
        switch await sut.getMe() {
        case .success(let data):
            me = data.data
        case .failure(let failure):
            print(failure.localizedDescription)
        }
        expectationGettingUsers.fulfill()
        if let me {
            let article = QaraMediumArticle(title: "Hello World from Xcode", content: "This is a draf article. No content. Only testing purpose. To be deleted!")
            switch await sut.create(article: article, authorId: me.id) {
            case .success(let data):
                print(data)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            expectationCreatingPost.fulfill()
        }
        
        await fulfillment(of: [expectationGettingUsers, expectationCreatingPost])
        XCTAssertNotNil(me)
    }
    
}
