//
//  ViewState.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 13/07/2023.
//

/// Enum representing possible states of the views.
enum ViewState<T> {
  case idle
  case loading
  case content(T)
  case error(Error)
}
