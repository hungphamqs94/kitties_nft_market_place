pragma solidity ^0.8.4;
import "../KittyMarketplace.sol";

contract TestKittyMarketPlace is KittyMarketPlace {
    constructor(address _kittyContractAddress)
        public
        KittyMarketPlace(_kittyContractAddress)
    {}

    function getKittyContractAddress() public view returns (address addr) {
        return address(_kittyContract);
    }

    function test_createOffer(
        address payable _seller,
        uint256 _price,
        uint256 _tokenId,
        bool _isSireOffer,
        bool _active
    ) public {
        Offer memory newOffer = Offer(
            _seller,
            _price,
            0,
            _tokenId,
            _isSireOffer,
            _active
        );
        offers.push(newOffer);
        uint256 index = offers.length - 1;
        offers[index].index = index;

        tokenIdToOffer[_tokenId] = offers[index];
    }
}
