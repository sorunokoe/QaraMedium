import XCTest
@testable import QaraMedium

final class QaraMediumTests: XCTestCase {
    
    private let token = "21984b73065b253d47a4e6a3ce46295594be1e77d644d49df5f4167cf0ccddd8a"
    
    private var sut: QaraMediumAPI!
    
    override func setUp() async throws {
        let network = QaraMediumNetwork(token: token)
        sut = QaraMediumAPI(token: token, network: network)
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
    
    
    func testCreatingAIPost() async {
        let article = QaraMediumArticle(title: "Bind: Learn a Language with AI",
                                        content: "# Bind: Learn a Language with AI\n\n---\n\nUnlock the world of language learning with our cutting-edge iOS app! Whether you\'re a beginner or looking to enhance your language skills, our app is your perfect companion on mastering new languages.\n\n## Features\n\n### AI-Powered Learning\nBind uses advanced AI algorithms to tailor lessons specifically to your learning pace and style. The AI adapts to your progress, ensuring that you are always challenged but never overwhelmed.\n\n### Multi-Language Support\nWith Bind, you can choose from a variety of languages to learn: English, German, Russian, Spanish, Italian, and Kazakh. Each language comes with its own set of courses that are designed to make learning easy and enjoyable.\n\n### Interactive Lessons\nOur interactive lessons feature a mix of reading, writing, listening, and speaking exercises. This multi-sensory approach helps to reinforce your learning and ensures you retain new information more effectively.\n\n### Real-World Scenarios\nBind incorporates real-world scenarios and dialogues to make your learning experience practical and relevant. You\'ll be able to apply what you’ve learned immediately in everyday situations.\n\n### Progress Tracking\nKeep track of your progress with our detailed analytics. The app provides regular feedback and adjusts the difficulty of lessons based on your performance, helping you to stay motivated and on track.\n\n### Offline Mode\nDon’t let a lack of internet connection slow down your learning. With our offline mode, you can download lessons and continue your studies anywhere, anytime.\n\n### Community Support\nJoin a community of like-minded learners. Our app includes a forum where you can ask questions, share tips, and find study partners to practice with.\n\n## Why Choose Bind?\n\n- **Personalized Learning:** Our AI adapts to your learning needs.\n- **Versatile Language Selection:** Choose from six different languages.\n- **Practical Application:** Learn using real-world scenarios.\n- **Comprehensive Tracking:** Monitor your progress in real-time.\n- **Flexible Learning:** Study offline at your convenience.\n- **Community Engagement:** Interact with other learners.\n\nBind is designed for anyone who wants to learn a new language or improve their existing skills. With our state-of-the-art AI technology and user-friendly interface, achieving fluency has never been easier. Download Bind today and start your language learning journey!\n\n---\n\n*Tags: #LanguageLearning, #AI, #iOSApp, #Education, #Multilingual, #BindApp, #LearnWithAI*", 
                                        contentFormat: .markdown)
        
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
