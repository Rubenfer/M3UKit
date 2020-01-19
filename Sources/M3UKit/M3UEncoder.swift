import Foundation

public class M3UEncoder {
    
    public init() {}
    
    public func encode(_ value: M3U) -> Data? {
        var m3uString = ""
        value.channels.forEach { channel in
            m3uString += """
            
            #EXTINF:\(channel.duration)\(encodeAttributes(channel.attributes)),\(channel.title)
            \(channel.url)
            """
        }
        m3uString.removeFirst()
        return m3uString.data(using: .utf8)
    }
    
    private func encodeAttributes(_ attributes: [String:String]) -> String {
        var attributesEncodedString = ""
        attributes.forEach { attribute in
            attributesEncodedString += " \(attribute.key)=\"\(attribute.value)\""
        }
        return attributesEncodedString
    }
    
}
