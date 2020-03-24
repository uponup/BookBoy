//
//  CollectionType.swift
//  
//
//  Created by wangyang on 2018/5/18.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

extension Collection {
    /// 如果相邻的两个元素不能合并就开分组
    public func dividIntoSections(_ canMergeTogether: (Self.Iterator.Element, Self.Iterator.Element) -> Bool) -> [[Self.Iterator.Element]] {
        var sections: [[Self.Iterator.Element]] = []
        var preSection: [Self.Iterator.Element] = []
        var preElement: Self.Iterator.Element?
        self.forEach { element in
            if let theElement = preElement {
                if (!canMergeTogether(theElement, element)) {
                    if preSection.count > 0 {
                        sections.append(preSection)
                    }
                    preSection = []
                }
            }
            preElement = element
            preSection.append(element)
        }
        if preSection.count > 0 {
            sections.append(preSection)
        }
        return sections
    }
    /// 所有符合规则的元素合并到一个分组中去
    public func mergeIntoSections(_ canMergeTogether: (Self.Iterator.Element, Self.Iterator.Element) -> Bool) -> [[Self.Iterator.Element]] {
        var sections: [[Self.Iterator.Element]] = []
        self.forEach { element in
            var index: Int?
            sections.enumerated().forEach { i, e in
                if canMergeTogether(e.first!, element) {
                    index = i
                    return
                }
            }
            if let i = index {
                var section = sections.remove(at: i)
                section.append(element)
                sections.insert(section, at: i)
            } else {
                sections.append([element])
            }
        }
        return sections
    }
}
