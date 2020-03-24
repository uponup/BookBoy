//
//  OCRProvider.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/28.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import Foundation
import Vision
import UIKit

struct OCRProvider {
    typealias CompletionBlock = (_ text: String) -> Void
    
    let deactImage: UIImage?
    let imageRequestHanlder: VNImageRequestHandler?
    let completion: CompletionBlock?
    
    
    init(deactImage img: UIImage?, completionBlock: CompletionBlock?) {
        deactImage = img
        completion = completionBlock
        if let image = deactImage, let cgimg = image.cgImage {
            imageRequestHanlder = VNImageRequestHandler(cgImage: cgimg, orientation: .up, options: [:])
        }else {
            imageRequestHanlder = nil
        }
    }
    
//  support: ["en-US"]
    func scan() {
        let request = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                print("The observations are of an unexpected type.")
                return
            }
            
            // 把识别的文字全部连成一个string
            var resultText = ""
            let maximumCandidates = 1
            for observation in observations {
                guard let candidate = observation.topCandidates(maximumCandidates).first else { continue }
                resultText += candidate.string + "\n"
            }
            
            guard let block = self.completion else { return }
            block(resultText)
        }
        request.recognitionLevel = .fast
        
        guard let requestHandler = imageRequestHanlder else {
            print("检测失败")
            return
        }
        
        do {
            try requestHandler.perform([request])
        } catch {
            print(error)
        }
    }
}

extension OCRProvider {
    static func printSupportLanguages() {
        do {
            let dic = try VNRecognizeTextRequest.supportedRecognitionLanguages(for: .fast, revision: 1)
            print(dic)
        } catch {
            print("发生错误")
        }
    }
}
