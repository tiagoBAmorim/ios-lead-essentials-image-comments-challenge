//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public final class ImageCommentsMapper {
	private struct Root: Decodable {
		private let items: [Item]

		private struct Item: Decodable {
			let id: UUID
			let message: String
			let created_at: Date
			let author: Author
		}

		private struct Author: Decodable {
			let username: String
		}

		var images: [ImageComment] {
			items.map { ImageComment(id: $0.id, message: $0.message, createdAt: $0.created_at, username: $0.author.username) }
		}
	}

	public enum Error: Swift.Error {
		case invalidData
	}

	public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [ImageComment] {
		guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
			throw Error.invalidData
		}

		return root.images
	}
}
