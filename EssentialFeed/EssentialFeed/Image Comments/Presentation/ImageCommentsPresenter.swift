//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public struct ImageCommentsViewModel {
	public let comments: [ImageCommentViewModel]
}

public struct ImageCommentViewModel: Hashable {
	public let message: String
	public let date: String
	public let username: String

	public init(message: String, date: String, username: String) {
		self.message = message
		self.date = date
		self.username = username
	}
}

public final class ImageCommentsPresenter {
	public static var title: String {
		NSLocalizedString(
			"IMAGE_COMMENTS_VIEW_TITLE",
			tableName: "ImageComments",
			bundle: Bundle(for: ImageCommentsPresenter.self),
			comment: "Title for the comments view")
	}

	public static func map(_ comments: [ImageComment],
	                       currentDate: Date = Date(),
	                       calendar: Calendar = .current,
	                       locale: Locale = .current
	) -> ImageCommentsViewModel {
		let formatter = RelativeDateTimeFormatter()
		formatter.calendar = calendar
		formatter.locale = locale

		return ImageCommentsViewModel(comments: comments.map {
			ImageCommentViewModel(message: $0.message, date: formatter.localizedString(for: $0.createdAt, relativeTo: currentDate), username: $0.username)
		})
	}
}
