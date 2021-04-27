//
//  ManagedFeedCache.swift
//  FeedStoreChallenge
//
//  Created by Vladimir Jeremic on 4/27/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(ManagedFeedCache)
public class ManagedFeedCache: NSManagedObject {
	@NSManaged var timestamp: Date
	@NSManaged var feed: NSOrderedSet

	@discardableResult
	static func insertNewUniqueInstance(with timestamp: Date, feed: NSOrderedSet, in context: NSManagedObjectContext) throws -> ManagedFeedCache {
		try find(in: context).map(context.delete)
		let feedCache = ManagedFeedCache(context: context)
		feedCache.timestamp = timestamp
		feedCache.feed = feed

		return feedCache
	}

	static func find(in context: NSManagedObjectContext) throws -> ManagedFeedCache? {
		let fetchRequest = NSFetchRequest<ManagedFeedCache>.init(entityName: entity().name!)
		fetchRequest.fetchLimit = 1
		fetchRequest.returnsObjectsAsFaults = false
		let cache = try context.fetch(fetchRequest).first

		return cache
	}

	var localFeed: [LocalFeedImage] {
		return feed.compactMap { ($0 as? ManagedFeedImage)?.localFeedImage }
	}
}
