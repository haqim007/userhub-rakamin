//
//  DetailUserView.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//

import SwiftUI

struct DetailUserView: View {
    let user: User
    var body: some View {
        ZStack{
            VStack {
                AsyncImage(url: URL(string: user.largeAvatar)!) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding()
                }
                placeholder: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.black.opacity(0.1))
                            .scaledToFit()
                            .clipShape(Circle())
                            .padding()
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    .frame(width: 200, height: 200)
                }
                .rightBottomShadow(color: Color(hex: "#f8d7b5"), x: 10, y: 10)
                
                Text(user.name)
                    .font(.title)
                    .bold()
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("USERNAME")
                            .bold()
                            .frame(width: 100, alignment: .leading)
                        Text(user.username)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        Text("EMAIL")
                            .bold()
                            .frame(width: 100, alignment: .leading)
                        Text(user.email)
                    }
                    .padding(.horizontal)
                    
                    HStack(alignment: .top) {
                        Text("ADDRESS")
                            .bold()
                            .frame(width: 100, alignment: .leading)
                        VStack (alignment: .leading) {
                            Text(user.address.street)
                            Text(user.address.suite)
                            Text(user.address.city)
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("PHONE")
                            .bold()
                            .frame(width: 100, alignment: .leading)
                        Text(user.phone)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("WEBSITE")
                            .bold()
                            .frame(width: 100, alignment: .leading)
                        Text(user.website)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .foregroundColor(.primary)
                .cornerRadius(5)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 0.5)
                )
                .padding(.vertical, 8)
                .padding(.horizontal)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("BgColor"))
    }
}

#Preview {
    NavigationStack {
        DetailUserView(
            user: dummyUsers[0]
        )
    }
}
