//
//  UserListView.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//

import SwiftUI

struct UserListView: View {
    @StateObject
    private var viewModel = UsersViewModel()
    @State
    private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                switch viewModel.users {
                case .success(let data):
                    if data.isEmpty {
                        Text(!searchText.isEmpty ? "User not found" : "There is no User")
                    }
                    else {
                        ScrollView {
                            LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                                Section(
                                    header: SectionHeaderView(title: searchText.isEmpty ? "All Users" : "Search Results")
                                        .padding(.bottom, 8)
                                ) {
                                    ForEach(data) { user in
                                        NavigationLink {
                                            DetailUserView(user: user)
                                        } label: {
                                            UserListItemView(user: user)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                        }
                        
                    }
                case .error(let error, _):
                    Text(error.localizedDescription)
                default: ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Users")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color("BgColor"))
        }
        .searchable(text: $searchText, prompt: Text("Search"))
        .onAppear {
            viewModel.fetchUsers()
        }
        .onChange(of: searchText) {
            viewModel.findUser(keyword: searchText)
        }
    }
}

#Preview {
    UserListView()
}

struct SectionHeaderView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.primary
                        .colorInvert()
                        .opacity(0.75)
        )
        .borderVerticalSide(height: 1, color: .black)
    }
}

struct UserListItemView: View {
    let user: User
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.smallAvatar)!) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding()
            }
            placeholder: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.black.opacity(0.1))
                        .scaledToFit()
                        .padding()
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading) {
                Text("\(user.name)")
                    .font(.system(size: 16))
                    .bold()
                Text("@\(user.username)")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .foregroundColor(.primary)
        .cornerRadius(10)
        .shadow(radius: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 1)
        )
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}
