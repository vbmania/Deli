import Deli

final class LibraryService: Autowired {
    let testService: TestService
    let books: [Book]

    required init(qualifierTest testService: TestService, _ books: [Book]) {
        self.testService = testService
        self.books = books
    }
}
