//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import UIKit
import EssentialFeed

public final class ImageCommentCellController: NSObject, UITableViewDataSource {
	private let model: ImageCommentViewModel

	public init(model: ImageCommentViewModel) {
		self.model = model
	}

	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: ImageCommentsCell = tableView.dequeueReusableCell()
		cell.userNameLabel.text = model.username
		cell.dateLabel.text = model.date
		cell.messageLabel.text = model.message

		return cell
	}
}
