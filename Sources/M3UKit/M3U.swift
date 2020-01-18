import Foundation

public struct M3U: Codable {
    
    public struct Channel: Codable {
        /// Title of the channel
        public var title: String
        /// Duration of stream in seconds. -1 for live streams. 0 unknown.
        public var duration: Int = 0
        /// Custom attributes for the channel
        public var attributes: [String:String] = [:]
        /// Playback URL
        public var url: String
    }
    
    public var channels: [Channel] = []
    
}
