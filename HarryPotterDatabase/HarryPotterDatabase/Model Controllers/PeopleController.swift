//
//  PeopleController.swift
//  HarryPotterDatabase
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

class PeopleController {

// STARTS FETCH PEOPLE
    static func fetchPeople(completion: @escaping ([People]) -> Void) {
        
        guard var baseURL = URL(string: "https://www.potterapi.com/v1") else { completion([]); return }
        
        let componentName = "characters"
        baseURL.appendPathComponent(componentName)
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let urlQueryItem = URLQueryItem(name: "key", value: "$2a$10$fMpJvdyHwKfnEnXvt/xJkuXUj8XwBG/T9Whd7f20uzXJAqU0CxTKa")
        components?.queryItems = [urlQueryItem]

        guard let passedURL = components?.url else { completion([]); return }
        
        URLSession.shared.dataTask(with: passedURL) { (data, _, error) in
            if let error = error {
                print("Error creating a URL Session. \(#function) - \(error) - \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("Error receiving the data. \(#function) - \(String(describing: error)) - \(String(describing: error?.localizedDescription))")
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let people = try decoder.decode([People].self, from: data)
                print("success getting people")
                completion(people)
            } catch {
                print("Error getting the people array. \(#function) - \(error) - \(error.localizedDescription)")
                completion([])
            }
            
        }.resume()
        
        return
    }    
} // Ends class PeopleController
