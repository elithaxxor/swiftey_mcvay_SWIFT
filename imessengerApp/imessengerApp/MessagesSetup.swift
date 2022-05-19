//
//  MessagesSetup.swift
//  imessengerApp
//
//  Created by a-robota on 5/17/22.
//

import Foundation


static let purchaseSeveralTimes = true
static let allStickersAreFalse = false
static let appBundleId = "com.nobodylikesme.imessengerApp"

/// Category for prucahses
///
///
static let categoryAll = Category(title: "", desciption: "", imageUrl: "CategoryAll", inAppPurchaseSuffix: allCategories, categoryImageType: .plain)

static let category1 = Category(title: "category 1", descsription: "everything here is free", imageUrl: "Category1", inAppPurchaseSuffix: free)



static let category2 = Category(title: "category 2", descsription: "everything here is free", imageUrl: "Category2", inAppPurchaseSuffix: .gif)

static let category3 = Category(title: "category 3", descsription: "everything here is free", imageUrl: "Category3", inAppPurchaseSuffix: .plain)


static let categories = [
category1,
category2,
category3
]

static let sticker1 = Sticker(Title: "Sticker1", imageUrl: "Sticker1", category: category1, stickerType: .sticker )
