
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract LearningProfile_is_Ownable {
    struct Profile {
        string name;
        string degree;
        string[] certifications;
          string school;           // School name
        uint8 score10th;         // Score in 10th grade (0-100 scale)
        uint8 score12th; 
        string college;
        string cg;
        
    }

    mapping(address => Profile) public profiles;

    event ProfileCreated(address indexed student, string name);
    event CertificationAdded(address indexed student, string certification);

    function createProfile(string memory _name, string memory _degree,string[] memory _certifications,string memory _school,
        uint8 _score10th,
        uint8 _score12th,string memory _college,string memory _cg) public {
    // Update the profiles mapping with the provided name and degree
    profiles[msg.sender] = Profile(_name, _degree, _certifications,_school,_score10th,_score12th,_college,_cg);
    
    // Emit the ProfileCreated event
    emit ProfileCreated(msg.sender, _name);
}
//update 
    function addCertification(string memory _certification) public {
        profiles[msg.sender].certifications.push(_certification);
        emit CertificationAdded(msg.sender, _certification);
    }
    
 function getProfile(address _student) public view returns (Profile memory) {
        Profile storage profile = profiles[_student];
        
        // Create a new memory array for the certifications
        // string[] memory certs = new string[](profile.certifications.length);
    string[] memory certificateArr = new string[](profile.certifications.length);
    for (uint i = 0; i < profile.certifications.length; i++) {
        certificateArr[i] = profile.certifications[i];
    }

        return profile;
    }

   
}
