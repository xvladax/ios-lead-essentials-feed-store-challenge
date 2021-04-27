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
}
