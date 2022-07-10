//
//  ScoutConstants.swift
//  Scout
//
//  Created by Ryan Barger on 7/9/22.
//

import Foundation

enum Handedness : String {
    case left = "L"
    case right = "R"
    case both = "S"
}

enum GradeLevel : String {
    case noSchool = "noSchool"
    case highSchoolFreshman = "hs_fresh"
    case highSchoolSophomore = "hs_soph"
    case highSchoolJunior = "hs_jr"
    case highSchoolSenior = "hs_sr"
    case jrCollegeYear1 = "jc_1"
    case collegeFreshman = "4yr_fresh"
    case redshirtFreshman = "rs_fresh"
    case jrCollegeYear2 = "jc_2"
    case collegeSophomore = "4yr_soph"
    case redshirtSophomore = "rs_soph"
    case jrCollegeYear3 = "jc_3"
    case collegeJunior = "4yr_jr"
    case redshirtJunior = "rs_jr"
    case collegeSenior = "4yr_sr"
    case redshirtSenior = "rs_sr"
    case college5YearSenior = "5yr_sr"
    case postGraduatae = "pg"
}
