//
//  ContentView.swift
//  api_example
//
//  Created by 김형석 on 2021/01/29.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var message: String = "API 호출 중..."
    
    var body: some View {
        Button(action: {
            request("http://localhost:5000/test/get", "GET") { (success, data) in
                self.message = data as! String
            }
        }) {
            Text("GET API 호출")
                .padding(.vertical, 10)
                .frame(width: 200.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
        Button(action: {
            request("http://localhost:5000/test/post", "POST", ["key": "hello!"]) { (success, data) in
                self.message = data as! String
            }
        }) {
            Text("POST API 호출")
                .padding(.vertical, 10)
                .frame(width: 200.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
        Button(action: {
            request("http://localhost:5000/test/put", "PUT", ["key": "hello!"]) { (success, data) in
                self.message = data as! String
            }
        }) {
            Text("PUT API 호출")
                .padding(.vertical, 10)
                .frame(width: 200.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
        Button(action: {
            request("http://localhost:5000/test/patch", "PATCH", ["key": "hello!"]) { (success, data) in
                self.message = data as! String
            }
        }) {
            Text("PATCH API 호출")
                .padding(.vertical, 10)
                .frame(width: 200.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
        Button(action: {
            request("http://localhost:5000/test/delete", "DELETE", ["key": "hello!"]) { (success, data) in
                self.message = data as! String
            }
        }) {
            Text("DELETE API 호출")
                .padding(.vertical, 10)
                .frame(width: 200.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
        Button(action: {
            AF.request("http://localhost:5000/test/get").responseJSON() { response in
                switch response.result {
                case .success:
                    if let data = try! response.result.get() as? [String: Any] {
                        self.message = data["result"] as! String
                    }
                case .failure(let error):
                    print("Error: \(error)")
                    return
                }
            }
        }) {
            Text("AF GET API 호출")
                .padding(.vertical, 10)
                .frame(width: 200.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
        Button(action: {
            AF.request("http://localhost:5000/test/post", method: .post, parameters: ["key": "hello!"], encoding: URLEncoding.httpBody).responseJSON() { response in
                switch response.result {
                case .success:
                    if let data = try! response.result.get() as? [String: Any] {
                        self.message = data["result"] as! String
                    }
                case .failure(let error):
                    print("Error: \(error)")
                    return
                }
            }
        }) {
            Text("AF POST API 호출")
                .padding(.vertical, 10)
                .frame(width: 200.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
        Text("\(self.message)")
            .padding(.top, 40.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

