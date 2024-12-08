//
//  DownloadError.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 08/12/24.
//

import Foundation

enum DownloadError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}
