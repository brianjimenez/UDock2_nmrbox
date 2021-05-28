#ifndef MOL2_IO_H
#define MOL2_IO_H

#include <iostream>
#include <fstream>
#include <cctype>
#include <algorithm>
#include <vector>
#include <string>
#include <iterator>
#include <sstream>






#include "Atom.h"
#include "Molecule.h"




enum class MOL2_DATA_TYPE : int
{
    MOLECULE,
    ATOM,
    BOND,
	SUBSTRUCTURE,
    OTHER,
    DATA
};



// from epock code: https://bitbucket.org/epock/epock
// Description:
// Return a vector of the words in the string s using the 
// space as delimiter.
inline std::vector<std::string> split(const std::string &s)

{
    std::vector<std::string> tokens;
    std::istringstream iss(s);
    copy(std::istream_iterator<std::string>(iss),
         std::istream_iterator<std::string>(),
         std::back_inserter<std::vector<std::string>>(tokens));
    return tokens;
}

MOL2_DATA_TYPE getReadingType(const std::string& line) {
    if (line.substr(0, 17) == (std::string)"@<TRIPOS>MOLECULE") return MOL2_DATA_TYPE::MOLECULE;
    else if (line.substr(0, 13) == (std::string)"@<TRIPOS>ATOM") return MOL2_DATA_TYPE::ATOM;
    else if (line.substr(0, 13) == (std::string)"@<TRIPOS>BOND") return MOL2_DATA_TYPE::BOND;
	else if (line.substr(0, 21) == (std::string)"@<TRIPOS>SUBSTRUCTURE") return MOL2_DATA_TYPE::SUBSTRUCTURE;
    else if (line.substr(0, 9) == (std::string)"@<TRIPOS>") return MOL2_DATA_TYPE::OTHER;
    else return MOL2_DATA_TYPE::DATA;
}

Molecule readMOL2(std::ifstream& file)
{
    Molecule mol;
    std::string line;
    std::vector<std::string> splitedline;
    MOL2_DATA_TYPE readingData = MOL2_DATA_TYPE::OTHER;
    while (std::getline(file, line))
    {		
		MOL2_DATA_TYPE readingDataLine = getReadingType(line);
        if (readingDataLine != MOL2_DATA_TYPE::DATA) {
			readingData = readingDataLine;
            continue;
        }		

		switch (readingData)
		{
		case MOL2_DATA_TYPE::MOLECULE:
			mol.name = line;
			readingData = MOL2_DATA_TYPE::DATA;
			break;
		case MOL2_DATA_TYPE::ATOM:
		{
			splitedline = split(line);
			Atom at;

			at.atomId = stoi(splitedline[0]);
			at.atomName = splitedline[1];
			at.pos.x = stof(splitedline[2]);
			at.pos.y = stof(splitedline[3]);
			at.pos.z = stof(splitedline[4]);

			at.atomType = splitedline[5];
			at.residueId = stoi(splitedline[6]);
			at.residueType = splitedline[7];
			at.charge = stof(splitedline[8]);
			
			
			at.UdockId = at.findAtomUdockId();


			if (at.atomType == "C.3") {
				at.radius = 1.908f;
			}
			else if (at.atomType == "C.2") {
				at.radius = 1.908f;
			}
			else if (at.atomType == "C.ar") {
				at.radius = 1.908f;
			}
			else if (at.atomType == "C.cat") {
				at.radius = 1.908f;
			}
			else if (at.atomType == "N.2") {
				at.radius = 1.824f;
			}
			else if (at.atomType == "N.3") {
				at.radius = 1.875f;;
			}
			else if (at.atomType == "N.4") {
				at.radius = 1.824f;
			}
			else if (at.atomType == "N.ar") {
				at.radius = 1.824f;
			}
			else if (at.atomType == "N.am") {
				at.radius = 1.824f;
			}
			else if (at.atomType == "N.pl3") {
				at.radius = 1.824f;
			}
			else if (at.atomType == "O.2") {
				at.radius = 1.6612f;
			}
			else if (at.atomType == "O.3") {
				at.radius = 1.721f;
			}
			else if (at.atomType == "O.co2") {
				at.radius = 1.6612f;
			}
			else if (at.atomType == "S.3") {
				at.radius = 2.0f;
			}
			else if (at.atomType == "P.3") {
				at.radius = 2.1f;
			}
			else if (at.atomType == "F") {
				at.radius = 1.75f;
			}
			else if (at.atomType == "H") {
				at.radius = 1.4870f;
			}
			else if (at.atomType == "LI") {
				at.radius = 1.137f;
			}
			else
			{
				std::cout << "unknowm atom type: " << at.atomType << std::endl;
			}
			mol.atoms.push_back(at);
			break;
		}
		case MOL2_DATA_TYPE::BOND:
		{
			splitedline = split(line);

			Bond bond;

			bond.start = stoi(splitedline[1]);
			bond.end = stoi(splitedline[2]);
			bond.type = splitedline[3];

			mol.bonds.push_back(bond);
			 
			break;
		}
		case MOL2_DATA_TYPE::OTHER:

			break;
		default:
			break;
		}     
    }

    mol.CenterToOrigin();
    mol.calcRadius();
    
    return mol;
}

Molecule readMOL2(const std::string fileName)
{
    std::ifstream file(fileName.c_str());
    if (!file)
    {
        throw std::invalid_argument("readPDB:Could not open file \"" + fileName + "\" #####");
    }
    Molecule mol = readMOL2(file);
    file.close();
    return mol;
}


#endif
