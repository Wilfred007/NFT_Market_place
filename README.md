NFTZone: Decentralized NFT Marketplace

NFTZone is a decentralized marketplace built on the Ethereum blockchain, allowing users to mint, list, buy, and sell NFTs. This contract implements the ERC-721 standard for non-fungible tokens (NFTs) with OpenZeppelin’s secure contract libraries. It also includes an access control mechanism, where only the contract owner can mint NFTs.
Features

    Minting NFTs: Only the contract owner can mint new NFTs.
    Listing NFTs: NFT owners can list their NFTs for sale at a specified price.
    Buying NFTs: Users can purchase NFTs by paying the listing price in Ether.
    ERC-721 Standard: The contract follows the ERC-721 standard for NFTs, using the ERC721URIStorage extension for metadata handling.
    Ownership Management: The contract owner has special privileges to mint new NFTs, controlled by OpenZeppelin's Ownable contract.

Smart Contract Overview

The contract implements the following key functionalities:
1. MintNFT

Allows the contract owner to mint new NFTs with a unique token ID and a URI that points to the token's metadata.

solidity

function MintNFT(string memory _tokenURL) public onlyOwner returns(uint256);

2. listNFT

Allows the owner of an NFT to list the token for sale at a specified price.

solidity

function listNFT(uint256 _tokenId, uint256 _price) public;

3. purchaseNFT

Allows users to purchase an NFT by sending Ether equal to the listed price. The ownership is transferred to the buyer, and the seller receives the payment.

solidity

function purchaseNFT(uint256 _tokenId) external payable;

4. getNFTListing

Allows users to retrieve details about an NFT that is listed for sale, including the seller's address, the listing price, and whether the NFT is currently listed.

solidity

function getNFTListing(uint256 _tokenId) external view returns(address seller, uint256 price, bool isListed);
