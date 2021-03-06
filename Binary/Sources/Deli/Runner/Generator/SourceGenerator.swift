//
//  SourceGenerator.swift
//  Deli
//

import Foundation

final class SourceGenerator: Generator {

    // MARK: - Public

    func generate() throws -> String {
        #if swift(>=4.1)
        let output = results
            .compactMap { $0.makeSource() }
            .joined(separator: "\n")
            .replacingOccurrences(of: "\n", with: "\n        ")
        #else
        let output = results
            .flatMap { $0.makeSource() }
            .joined(separator: "\n")
            .replacingOccurrences(of: "\n", with: "\n        ")
        #endif

        return """
        //
        //  Deli Factory
        //  Auto generated code.
        //

        import Deli

        final class DeliFactory: ModuleFactory {
            func load(context: AppContextType) {
                \(output)
            }

            required init() {}
        }
        """
    }

    // MARK: - Private

    private let results: [Results]

    // MARK: - Lifecycle

    init(results: [Results]) {
        self.results = results
    }
}
