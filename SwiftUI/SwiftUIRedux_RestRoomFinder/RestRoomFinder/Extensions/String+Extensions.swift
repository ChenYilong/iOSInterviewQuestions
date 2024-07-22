

import Foundation

extension String {
    
    func encodeURL() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    
}
