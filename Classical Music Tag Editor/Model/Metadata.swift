//
//  Metadata.swift
//  Classical Music Tag Editor
//
//  Created by Massimiliano Federici on 19/07/2020.
//  Copyright © 2020 Massimiliano Federici. All rights reserved.
//

import Foundation
import AudioToolbox
import Logging

let logger = Logger(label: "org.github.massimilianofederici.metadata")

extension Dictionary {
    mutating func merge(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

class Metadata {
    
    func writeTo(file: AudioFileID) {
       print(file)
    }
    
    func readFrom(fileID: AudioFileID) -> Dictionary<String, String> {
        var dict: CFDictionary? = nil
        var dataSize = UInt32(MemoryLayout<CFDictionary?>.size(ofValue: dict))
        AudioFileGetProperty(fileID, kAudioFilePropertyInfoDictionary, &dataSize, &dict)
        return dict! as! Dictionary<String, String>
    }
}

enum ValueType{
    case TEXT
    case NUMBER
    case FLAG
    case BINARY
}

class AudioFile {
    
    func load(url: URL) -> AudioFileID? {
        logger.info("Loading audio file from \(url)")
        var fileID: AudioFileID? = nil
        let status: OSStatus = AudioFileOpenURL(url as CFURL, .readPermission, kAudioFileFLACType, &fileID)
        guard status == noErr else {
            logger.critical("Could not read input file \(status.words)")
            return fileID
        }
        return fileID
    }
}
