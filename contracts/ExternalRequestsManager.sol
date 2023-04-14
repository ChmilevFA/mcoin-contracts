pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol";

contract ExternalRequestsManager is Ownable2StepUpgradeable {

    mapping(address => bool) public allowedProviders;
    address public tokenAddress;

    event MintRequested(address provider, uint256 value);
    event BurnRequested(address provider, uint256 value);

    function initialize(
        address _tokenAddress
    ) initializer public {
        __Ownable_init();
        tokenAddress = _tokenAddress;
    }

    modifier onlyAllowedProviders() {
        require(allowedProviders[msg.sender], "Only approved providers could perform the action");
        _;
    }

    function addProvider(address provider) public onlyOwner {
        allowedProviders[provider] = true;
    }

    function removeProvider(address provider) public onlyOwner {
        allowedProviders[provider] = false;
    }

    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function requestMint() public payable onlyAllowedProviders {
        require(msg.value > 0, "amount cannot be 0");
        emit MintRequested(msg.sender, msg.value);
    }

    function requestBurn(uint256 value) public onlyAllowedProviders {
        IERC20 token = IERC20(tokenAddress);
        token.transferFrom(msg.sender, address(this), value);
        emit BurnRequested(msg.sender, value);
    }
}