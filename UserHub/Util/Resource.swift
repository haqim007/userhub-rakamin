//
//  Resource.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//


enum Resource<ResultType, ErrorType> where ErrorType : Error {
    case success(_ data: ResultType)
    case loading(_ data: ResultType? = nil)
    case error(_ error: ErrorType, data: ResultType? = nil)
    case idle
}