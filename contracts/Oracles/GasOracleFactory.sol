pragma solidity 0.4.11;
import "../Oracles/GasOracle.sol";


/// @title Centralized oracle factory contract - Allows to create centralized oracle contracts
/// @author Stefan George - <stefan@gnosis.pm>
contract GasOracleFactory {

    /*
     *  Events
     */
    event GasOracleCreation(address indexed creator, GasOracle gasOracle, bytes ipfsHash);

    /*
     *  Public functions
     */
    /// @dev Creates a new centralized oracle contract
    /// @param ipfsHash Hash identifying off chain event description
    /// @return Oracle contract
    function createGasOracle(bytes ipfsHash)
        public
        returns (GasOracle gasOracle)
    {
        gasOracle = new GasOracle(msg.sender, ipfsHash);
        GasOracleCreation(msg.sender, gasOracle, ipfsHash);
    }
}
