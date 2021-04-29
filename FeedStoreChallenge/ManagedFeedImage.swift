//
//  ManagedFeedImage.swift
//  FeedStoreChallenge
//
//  Created by Vladimir Jeremic on 4/27/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(ManagedFeedImage)
final class ManagedFeedImage: NSManagedObject {
	@NSManaged var id: UUID
	@NSManaged var imageDescription: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var cache: ManagedFeedCache

	static func feedImages(from localFeedImages: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeedImages.map({ feedImage(from: $0, in: context) }))
	}

	private static func feedImage(from localFeedImage: LocalFeedImage, in context: NSManagedObjectContext) -> ManagedFeedImage {
		let feedImage = ManagedFeedImage(context: context)
		feedImage.id = localFeedImage.id
		feedImage.imageDescription = localFeedImage.description
		feedImage.location = localFeedImage.location
		feedImage.url = localFeedImage.url

		return feedImage
	}

	var localFeedImage: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}
}
