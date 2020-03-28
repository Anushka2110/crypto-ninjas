pragma solidity ^0.5.12;

import '.././node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import '.././node_modules/openzeppelin-solidity/contracts/utils/Address.sol';
import '.././node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol';
import '.././node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol';
import '.././node_modules/openzeppelin-solidity/contracts/token/ERC721/IERC721Receiver.sol';
import './Strings.sol';



contract CryptoNinjas is ERC721Full {

    constructor() ERC721Full("CryptoNinjas", "POK") public {  owner = msg.sender; }

    struct Ninja {
        string name;
        uint level;
        uint swordPower;
        uint shieldPower;
    }

   

    Ninja[] public ninjas;
    address public owner;
    

   

     modifier onlyOwner {
        require(msg.sender == owner, "error,only owner is allowed");
        _;
    }

    function createNinja(string memory _name, address _to) public onlyOwner {
        uint id = ninjas.length;
        ninjas.push(Ninja(_name, 1, 100, 100));
        _mint(_to, id);
    }

    function fight(uint _ninjaId, uint _opponentId) public {
        Ninja storage ninja1 = ninjas[_ninjaId];
        Ninja storage ninja2 = ninjas[_opponentId];

        if(ninja1.swordPower >= ninja2.shieldPower)
        {
            ninja1.level += 1;
            ninja1.swordPower += 5;
        }
        else
        {
            ninja2.level += 1;
            ninja2.shieldPower += 5;

        }
    }

}