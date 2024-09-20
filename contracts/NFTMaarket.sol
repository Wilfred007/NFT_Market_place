// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NFTZone is ERC721URIStorage, Ownable {


    struct NFTListing{
        uint tokenId;
        address payable seller;
        uint256 price;
        bool isListed;
    }

    mapping(uint256 tokenId => NFTListing) nftListing; //Maping nftID to the NFTListing struct

    uint256 private tokenCounter;

        constructor(address initialOwner) ERC721("NFTZone", "NFTZ") Ownable(initialOwner) {}


    function MintNFT(string memory _tokenURL) public onlyOwner returns(uint256) {
        uint256 newTokenId = tokenCounter;
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, _tokenURL);


        tokenCounter +=1;
        return newTokenId;
        
    }


    function listNFT(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender, "Only owner can list");
        require(_price > 0, "Price must be greater than zero");

        nftListing[_tokenId] = NFTListing({
            tokenId: _tokenId,
            seller: payable(msg.sender),
            price: _price,
            isListed: true
        });
    }


    function purchaseNFT(uint256 _tokenId) external payable {
        NFTListing memory nftListing = nftListing[_tokenId];
        require(nftListing.isListed, "NFT not for sale");
        require(msg.value == nftListing.price, "Check the price again");


        //buyer transfers ether to the seller
        nftListing.seller.transfer(msg.value);

        //Owner transfers NFT ownership to the buyer


        //This marks the NFT as not lister
        nftListing.isListed = false;
        
    }


    function getNFTListing(uint256 _tokenId) external view returns(address seller, uint256 price, bool isListed) {
        NFTListing memory nftListing = nftListing[_tokenId];
        return(nftListing.seller, nftListing.price, nftListing.isListed);
    }
}