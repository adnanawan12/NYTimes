//
//  StringExtension.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

extension String {
    //Converts the string to URL
    public func asURL() -> URL? {
        guard let url = URL(string: self) else { return  nil  }

        return url
    }
}
