//
//  SoundPlayer.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import AVFoundation

class SoundPlayer {
    private init() {}

    static var shared: SoundPlayer = .init()
    var player: AVAudioPlayer?

    enum SoundPlayerError: Error {
        case wrongURL
        case mediaFileNotFound
    }

    func playSound(sound: String, type: String) throws {
        if let path = Bundle.main.path(forResource: sound, ofType: type.description) {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player?.play()
            } catch {
                print("Could not find and play the sound file")
                throw SoundPlayerError.wrongURL
            }
        } else {
            print("Wrong path")
            throw SoundPlayerError.mediaFileNotFound
        }
    }
}
