//
//  PagingCollectionViewLayout.swift
//  PagingCollectionViewLayout
//
//  Created by Vladislav Mashkov on 15.01.2022.
//

import Foundation
import UIKit

class PagingCollectionViewLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let pageLength:        CGFloat
        let approxPage:        CGFloat
        let nextOrCurrentPage: CGFloat
        let speed:             CGFloat
        
        // When user stop scroll CollectionView get approx number of selected page and save scroll speed
        if scrollDirection == .horizontal {
            
            pageLength = self.itemSize.width + minimumLineSpacing
            approxPage = collectionView.contentOffset.x / pageLength
            speed      = velocity.x
            
        } else {
            
            pageLength = (self.itemSize.height + self.minimumLineSpacing)
            approxPage = collectionView.contentOffset.y / pageLength
            speed      = velocity.y
            
        }
        
        // if user scroll back (speed < 0) ceil approxPage and get number of previous page
        // if user scroll ahead (speed > 0) floor approxPage and get number of next page
        // if user scroll slow (speed = 0) rounded approxPage and if the offset is greater than 50 percent forward, get next page
        // if user scroll slow (speed = 0) rounded approxPage and if the offset is greater than 50 percent back, get previous page
        // if user scroll slow (speed = 0) rounded approxPage and if the offset is less than 50 percent, get current page
        
        if speed < 0 {
            
            nextOrCurrentPage = ceil(approxPage)
            
        } else if speed > 0 {
            
            nextOrCurrentPage = floor(approxPage)
            
        } else {
            
            nextOrCurrentPage = round(approxPage)
            
        }
        
        
        // If speed = 0, return the offset required for correct display currentPage
        guard speed != 0 else {

            if scrollDirection == .horizontal {
                
                return CGPoint(x: (nextOrCurrentPage * pageLength) + self.sectionInset.left, y: 0)
                
            } else {
                
                return CGPoint(x: 0, y: nextOrCurrentPage * pageLength)
                
            }
            
        }
        
        
        // If speed != 0, We'll switch the page anyway
        
        // get number of nextPage
        let nextPage: CGFloat = nextOrCurrentPage + (speed > 0 ? 1 : -1)
        
        // return the offset required for correct display selected page
        if scrollDirection == .horizontal {
            
            return CGPoint(x: nextPage * pageLength, y: 0)
            
        } else {
            
            return CGPoint(x: 0, y: nextPage * pageLength)
            
        }
        
    }
}
