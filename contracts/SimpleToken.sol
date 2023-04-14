pragma solidity ^0.8.18;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol";

contract SimpleToken is ERC20Upgradeable, Ownable2StepUpgradeable {

    function initialize(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) initializer public {
        __Ownable_init();
        __ERC20_init(name, symbol);
        _mint(msg.sender, initialSupply);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public onlyOwner {
        _burn(account, amount);
    }
}