/*
This file is for documentation of the dreamerxp NFT contract - use ../dreamerxp-flattened.sol for compilation */



//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/introspection/ERC165.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";

contract thedreamerxp is ERC721 {


    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    constructor() public ERC721("TheDreamerIO XP", "DXP") {
        _setBaseURI("https://raw.githubusercontent.com/thedreamdao-eth/Dreamer_NTT_Merit_Badges/gh-pages-iterations/metadata/json/");
    }
    
    // global state variables
    mapping(uint256 => uint256) public AwardIdtoValue;
    
    


    // contract functions
    function awardItem(address ethwallet, string memory tokenURI, uint Value ) public returns (uint256) {
            _tokenIds.increment();
      // mintit      
             uint256 AwardId = _tokenIds.current() + 1000 ;
            _mint(ethwallet, AwardId);
            _setTokenURI(AwardId, tokenURI);
            // set Value
           AwardIdtoValue[AwardId] = Value;
        return AwardId;
    }

    function getAwardValue(uint256 AwardId) public view returns(uint256) {
        return AwardIdtoValue[AwardId];
    }
}
