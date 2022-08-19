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
        Review[] reviews;
    }

    struct Service {
        string id;
        string name;
        uint256 price;
        uint256 amount;
        string description;
        string image;
        Review[] reviews;
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
        uint256 promotion;
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
    uint256 addressCount;
    uint256 businessReviewCount;
    uint256 serviceReviewCount;
    uint256 productReviewCount;
    mapping(address => Business) businesses;
    mapping(address => Location) locations;
    mapping(address => Review) reviews;
    mapping(address => mapping(string => Product)) products;
    mapping(address => mapping(string => Service)) services;

    // compare strings functions
    function compareStrings(string memory a, string memory b)
        private
        pure
        returns (bool)
    {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }

    // business section
    function registerNewBusiness(
        address id,
        string[] calldata location,
        string calldata name,
        string calldata category,
        string calldata subcategory,
        string calldata aboutUs //isAddressListed(id)
    ) public {
        addressesArray[addressCount] = id;
        addressCount += 1;
        Business storage newBusiness = businesses[id];
        newBusiness.id = id;
        newBusiness.name = name;

        for (uint256 i = 0; i < location.length; i++) {
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
        Business[] memory _businesses;
        for (uint256 i = 0; i < addressesArray.length; i++) {
            _businesses[i] = businesses[addressesArray[i]];
        }

        return _businesses;
    }

    // products section
    function addBusinessProduct(
        address id,
        string memory prodId,
        Product calldata product
    ) public {
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

    function getProductsByBusiness(address id)
        public
        view
        returns (Product[] memory)
    {
        Business storage business = businesses[id];
        return business.products;
    }

    // location section
    function getLocation(address id) public view returns (Location memory) {
        return locations[id];
    }

    function getBusinessLocationByCountry(address id)
        public
        view
        returns (string memory)
    {
        return getLocation(id).country;
    }

    function getBusinessLocationByCounty(address id)
        public
        view
        returns (string memory)
    {
        return getLocation(id).county;
    }

    function getBusinessLocationBySubcounty(address id)
        public
        view
        returns (string memory)
    {
        return getLocation(id).subcounty;
    }

    function getBusinessLocationByWard(address id)
        public
        view
        returns (string memory)
    {
        return getLocation(id).ward;
    }

    function getBusinessLocationByVillage(address id)
        public
        view
        returns (string memory)
    {
        return getLocation(id).village;
    }

    function getBusinessByLocation(string[] memory businessInfo)
        public
        view
        returns (Business[] memory)
    {
        Business[] memory _businesses;
        Business[] memory allBusinesses = getAllBusinesses();

        string memory locale = businessInfo[0];
        string memory value = businessInfo[1];

        for (uint256 i = 0; i < allBusinesses.length; i++) {
            Business memory business = allBusinesses[i];

            uint256 item;

            if (compareStrings(locale, business.location[0])) {
                item = 0;
            } else if (compareStrings(locale, business.location[1])) {
                item = 1;
            } else if (compareStrings(locale, business.location[2])) {
                item = 2;
            } else if (compareStrings(locale, business.location[3])) {
                item = 3;
            } else {
                item = 4;
            }

            if (compareStrings(business.location[item], value)) {
                _businesses[i] = business;
            }
        }

        return _businesses;
    }

    // review section
    function addBusinessReview(address id, Review memory review) public {
        Business storage _business = businesses[id];
        Review memory newReview;
        newReview.rating = review.rating;
        newReview.comment = review.comment;

        _business.reviews[businessReviewCount] = newReview;
        businessReviewCount++;
    }

    function addProductReview(
        address id,
        string calldata prodId,
        Review memory review
    ) public {
        Product storage _product = products[id][prodId];
        Review memory newReview;
        newReview.rating = review.rating;
        newReview.comment = review.comment;

        _product.reviews[productReviewCount] = newReview;
        productReviewCount++;
    }

    function addServiceReview(
        address id,
        string calldata serviceId,
        Review memory review
    ) public {
        Service storage _service = services[id][serviceId];
        Review memory newReview;
        newReview.rating = review.rating;
        newReview.comment = review.comment;

        _service.reviews[serviceReviewCount] = newReview;
        serviceReviewCount++;
    }

    // modifier isAddressListed(address id) {
    //     require(!businesses[id], "This id is already registered");
    //     _;
    // }
}
