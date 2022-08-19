// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Marketplace {

    struct Product {
        string id;
        string name;
        uint256 price;
        uint256 amount;
        string description;
        string image;
        Review[] review;
    }

    struct Service {
        string id;
        string name;
        uint256 price;
        uint256 amount;
        string description;
        string image;
        Review[] review;

    }

    struct Business {
        address id;
        string name;
        string[] location;
        string category;
        string subcategory;
        string logo;
        Review[] reviews;
        Product[] products;
        string aboutUs;
        uint promotion;   
    }

    struct Location {
        string country;
        string county;
        string subcounty;
        string ward;
        string village;
    }

    struct Review {
        uint8 rating;
        string comment;
    }
    address[] addressesArray;
    uint256 count;
    mapping(address => Business) businesses;
    mapping(address => Location) locations;
    mapping(address => Review) reviews;
    mapping(address => mapping (string => Product)) products;
    mapping(address => Service[]) services;
    
    // business section
    function registerNewBusiness(
        address id,
        string[] calldata location,
        string calldata name,
        string calldata category,
        string calldata subcategory,
        string calldata aboutUs
    ) public //isAddressListed(id)
    {
        addressesArray[count] = id;
        count += 1;
        Business storage newBusiness = businesses[id];
        newBusiness.id = id;
        newBusiness.name = name;

        for ( uint i = 0; i < location.length; i++) {
            Location storage newBusinessLocations = locations[id];
            newBusinessLocations.country = location[0];
            newBusinessLocations.county = location[1];
            newBusinessLocations.subcounty = location[2];
            newBusinessLocations.ward = location[3];
            newBusinessLocations.village = location[4];

        }
        newBusiness.category = category;
        newBusiness.subcategory = subcategory;
        newBusiness.aboutUs = aboutUs;     

    }

    function getAllBusinesses() public view returns (Business[] memory) {
        for (uint i = 0; i < addressesArray.lenght; i++) {
            
        }
    }

    // products section
    function addBusinessProduct(address id, string memory prodId, Product calldata product) public {
        // require(products[id], "This product already exists");
        Business storage business = businesses[id];
        Product storage new_product = products[id][prodId];
        new_product.id = product.id;
        new_product.name = product.name;
        new_product.price = product.price;
        new_product.amount = product.amount;
        new_product.description = product.description;
        new_product.image = product.image;

        business.products.push(new_product);
        
    }

    function getProductsByBusiness(address id) public view returns(Product[] memory) {
        Business storage business = businesses[id];
        return business.products;
    }

    // location section
    function getLocation(address id) public view returns (Location memory) {
        return locations[id];
    }

    function getBusinessLocationByCountry(address id) public view returns (string memory) {
        return getLocation(id).country;
    }

    function getBusinessLocationByCounty(address id) public view returns (string memory) {
        return getLocation(id).county;
    }

    function getBusinessLocationBySubcounty(address id) public view returns (string memory) {
        return getLocation(id).subcounty;
    }

    function getBusinessLocationByWard(address id) public view returns (string memory) {
        return getLocation(id).ward;
    }

    function getBusinessLocationByVillage(address id) public view returns (string memory) {
        return getLocation(id).village;
    }

    // function getBusinessByCounty(string countyName) public view returns (string memory) {

    // }

    // modifier isAddressListed(address id) {
    //     require(!businesses[id], "This id is already registered");
    //     _;
    // }
    
}





// 

    // function getBusinessByCountry(string memory countryName) public view returns (Business[] memory) {
    //     Business[] memory _businesses;
    //     Business[] memory allBusinesses = getAllBusinesses();

    //     for (uint i = 0; i < allBusinesses.length; i++) {
    //         Business memory business = allBusinesses[i];

    //         if (compareStrings(business.location[0], countryName)) {
    //             _businesses[i] = business;
    //         }
    //     }

    //     return _businesses;
    // }

    // function getBusinessByCounty(string memory countyName) public view returns (Business[] memory) {
    //     Business[] memory _businesses;
    //     Business[] memory allBusinesses = getAllBusinesses();

    //     for (uint i = 0; i < allBusinesses.length; i++) {
    //         Business memory business = allBusinesses[i];

    //         if (compareStrings(business.location[1], countyName)) {
    //             _businesses[i] = business;
    //         }
    //     }

    //     return _businesses;
    // }

    // function getBusinessBySubcounty(string memory subCountyName) public view returns (Business[] memory) {
    //     Business[] memory _businesses;
    //     Business[] memory allBusinesses = getAllBusinesses();

    //     for (uint i = 0; i < allBusinesses.length; i++) {
    //         Business memory business = allBusinesses[i];

    //         if (compareStrings(business.location[2], subCountyName)) {
    //             _businesses[i] = business;
    //         }
    //     }

    //     return _businesses;
    // }

    // function getBusinessByWard(string memory ward) public view returns (Business[] memory) {
    //     Business[] memory _businesses;
    //     Business[] memory allBusinesses = getAllBusinesses();

    //     for (uint i = 0; i < allBusinesses.length; i++) {
    //         Business memory business = allBusinesses[i];

    //         if (compareStrings(business.location[3], ward)) {
    //             _businesses[i] = business;
    //         }
    //     }

    //     return _businesses;
    // }

    // function getBusinessByVillage(string memory village) public view returns (Business[] memory) {
    //     Business[] memory _businesses;
    //     Business[] memory allBusinesses = getAllBusinesses();

    //     for (uint i = 0; i < allBusinesses.length; i++) {
    //         Business memory business = allBusinesses[i];

    //         if (compareStrings(business.location[4], village)) {
    //             _businesses[i] = business;
    //         }
    //     }

    //     return _businesses;
    // }