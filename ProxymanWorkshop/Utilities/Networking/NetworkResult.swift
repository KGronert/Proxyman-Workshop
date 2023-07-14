//
//  NetworkResult.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Foundation
import Kingfisher

typealias NetworkResult<T> = Result<T, Error>
typealias NetworkTask<T> = Task<T, Error>
typealias ImageResult = (Result<RetrieveImageResult, KingfisherError>) -> Void
