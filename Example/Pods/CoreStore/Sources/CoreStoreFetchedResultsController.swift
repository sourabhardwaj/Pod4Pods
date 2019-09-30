//
//  CoreStoreFetchedResultsController.swift
//  CoreStore
//
//  Copyright © 2018 John Rommel Estropia
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import CoreData


// MARK: - CoreStoreFetchedResultsController

@available(macOS 10.12, *)
internal final class CoreStoreFetchedResultsController: NSFetchedResultsController<NSManagedObject> {
    
    // MARK: Internal
    
    @nonobjc
    internal convenience init<D>(dataStack: DataStack, fetchRequest: NSFetchRequest<NSManagedObject>, from: From<D>, sectionBy: SectionBy<D>? = nil, applyFetchClauses: @escaping (_ fetchRequest: NSFetchRequest<NSManagedObject>) -> Void) {
        
        self.init(
            context: dataStack.mainContext,
            fetchRequest: fetchRequest,
            from: from,
            sectionBy: sectionBy,
            applyFetchClauses: applyFetchClauses
        )
    }
    
    @nonobjc
    internal init<D>(context: NSManagedObjectContext, fetchRequest: NSFetchRequest<NSManagedObject>, from: From<D>, sectionBy: SectionBy<D>? = nil, applyFetchClauses: @escaping (_ fetchRequest: NSFetchRequest<NSManagedObject>) -> Void) {
        
        _ = try? from.applyToFetchRequest(
            fetchRequest,
            context: context,
            applyAffectedStores: false
        )
        applyFetchClauses(fetchRequest)
        
        self.reapplyAffectedStores = { fetchRequest, context in
            
            try from.applyAffectedStoresForFetchedRequest(fetchRequest, context: context)
        }
        
        super.init(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: sectionBy?.sectionKeyPath,
            cacheName: nil
        )
    }
    
    @nonobjc
    internal func performFetchFromSpecifiedStores() throws {

        try self.reapplyAffectedStores(self.fetchRequest, self.managedObjectContext)
        try self.performFetch()
    }
    
    @nonobjc
    internal func dynamicCast<U>() -> NSFetchedResultsController<U> {
        
        return unsafeBitCast(self, to: NSFetchedResultsController<U>.self)
    }
    
    deinit {
        
        self.delegate = nil
    }
    
    
    // MARK: Private
    
    @nonobjc
    private let reapplyAffectedStores: (_ fetchRequest: NSFetchRequest<NSManagedObject>, _ context: NSManagedObjectContext) throws -> Void
}
