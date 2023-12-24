//
//  GetSkillsRequest.swift
//  Portfolio
//
//  Created by Marc Flores on 19/12/23.
//

import Foundation

struct GetSkillsRequest: BaseRequest {
    let path: String = C.Urls.baseURL + "/skills"
}
