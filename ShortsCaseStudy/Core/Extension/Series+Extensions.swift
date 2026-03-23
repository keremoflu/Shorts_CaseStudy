//
//  Series+Extensions.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import Foundation

extension Series {
    func episodeProgress(at index: Int, currentDuration: Int) -> CGFloat {
        guard episodes.indices.contains(index),
              episodes[index].durationSeconds > 0 else { return 0 }
        return CGFloat(currentDuration) / CGFloat(episodes[index].durationSeconds)
    }
}
