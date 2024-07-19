// SPDX-License-Identifier: UNLICENSED
// This file was autogenerated by running `kontrol load-state`. Do not edit this file manually.

pragma solidity ^0.8.13;

import { Vm } from "forge-std/Vm.sol";

import { InitStateCode } from "./InitStateCode.sol";

contract InitState is InitStateCode {
	// Cheat code address, 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D
	address private constant VM_ADDRESS = address(uint160(uint256(keccak256("hevm cheat code"))));
	Vm private constant vm = Vm(VM_ADDRESS);

	address internal constant unitOfAccountAddress = 0x0000000000000000000000000000000000000001;
	address internal constant assetTST2Address = 0x1d1499e622D69689cdf9004d05Ec547d650Ff211;
	address internal constant protocolConfigAddress = 0x2e234DAe75C793f67A35089C9d99245E1C58470b;
	address internal constant feeReceiverAddress = 0x344ef496b004663a04d70B427a78E33cC3E9f619;
	address internal constant evcAddress = 0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f;
	address internal constant oracleAddress = 0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9;
	address internal constant eTSTAddress = 0xA02A0858A7B38B1f7F3230FAD136BD895C412CE5;
	address internal constant permit2Address = 0xA4AD4f68d0b91CFD19687c881e50f3A00242828c;
	address internal constant factoryAddress = 0xDB25A7b768311dE128BBDa7B8426c3f9C74f3240;
	address internal constant balanceTrackerAddress = 0xF62849F9A0B5Bf2913b396098F7c7019b51A820a;
	address internal constant assetTSTAddress = 0xa0Cb889707d426A7A386870A03bc70d1b0697598;
	address internal constant sequenceRegistryAddress = 0xc7183455a4C133Ae270771860664b6B7ec320bB1;
	address internal constant acc12Address = 0x65B6A5f2965e6f125A8B1189ed57739Ca49Bc70e;
	address internal constant acc13Address = 0x3D7Ebc40AF7092E3F1C81F2e996cbA5Cae2090d7;
	address internal constant acc14Address = 0x15cF58144EF33af1e14b5208015d11F9143E27b9;
	address internal constant acc15Address = 0x2a07706473244BC757E10F2a9E86fB532828afe3;
	address internal constant acc16Address = 0xe35107b66aA5bCDDC7b3887DaDD0bfe5Dc1A4315;
	address internal constant acc17Address = 0x3381cD18e2Fb4dB236BF0525938AB6E43Db0440f;
	address internal constant acc18Address = 0x03A6a84cD762D9707A21605b548aaaB891562aAb;
	address internal constant acc19Address = 0xf8E03F9b9528835c24D85F2a701096242B8EC026;
	address internal constant acc20Address = 0x13aa49bAc059d709dd0a18D6bb63290076a702D7;
	address internal constant acc21Address = 0x212224D2F2d262cd093eE13240ca4873fcCBbA3C;
	address internal constant acc22Address = 0xD6BbDE9174b1CdAa358d2Cf4D57D1a9F7178FBfF;
	address internal constant acc23Address = 0xD16d567549A2a2a2005aEACf7fB193851603dd70;
	address internal constant acc24Address = 0x96d3F6c20EEd2697647F543fE6C08bC2Fbf39758;
	address internal constant acc25Address = 0x756e0562323ADcDA4430d6cb456d9151f605290B;


	function recreateState() public {
		bytes32 slot;
		bytes32 value;
		vm.etch(evcAddress, evcCode);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000000';
		value = hex'0000000000000100000000000000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000001';
		value = hex'0100000000000000000000000000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000003';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000004';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000005';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000006';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000007';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000008';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000009';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'000000000000000000000000000000000000000000000000000000000000000a';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'000000000000000000000000000000000000000000000000000000000000000b';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'000000000000000000000000000000000000000000000000000000000000000c';
		value = hex'0100000000000000000000000000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'000000000000000000000000000000000000000000000000000000000000000e';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'000000000000000000000000000000000000000000000000000000000000000f';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000010';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000011';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000012';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000013';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000014';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000015';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000016';
		value = hex'0000000000000000000000010000000000000000000000000000000000000000';
		vm.store(evcAddress, slot, value);
		vm.etch(acc12Address, acc12Code);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000000';
		value = hex'0000000000000000000000000000000000000000000000000000000000000001';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000001';
		value = hex'0000000100000000000000000000000000000000000000000000000000000000';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000002';
		value = hex'0000000000000000000000000000000000000000000000000000000000000001';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000003';
		value = hex'0000000000000000000000000000000000000000000000000000000000000000';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000004';
		value = hex'0000000000000000000000000000000000000000000000000000000000000000';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000005';
		value = hex'0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000006';
		value = hex'0000000000000000000003e8756e0562323adcda4430d6cb456d9151f605290b';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000007';
		value = hex'45564b205661756c7420654532304d2d32000000000000000000000000000022';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000008';
		value = hex'654532304d2d320000000000000000000000000000000000000000000000000e';
		vm.store(acc12Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000009';
		value = hex'0000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496';
		vm.store(acc12Address, slot, value);
		slot = hex'000000000000000000000000000000000000000000000000000000000000000a';
		value = hex'0000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496';
		vm.store(acc12Address, slot, value);
		slot = hex'a3f0ad74e5423aebfd80d3ef4346578335a9a72aeaee59ff6cb3582b35133d50';
		value = hex'000000000000000000000000db25a7b768311de128bbda7b8426c3f9c74f3240';
		vm.store(acc12Address, slot, value);
		vm.etch(acc13Address, acc13Code);
		vm.etch(permit2Address, permit2Code);
		vm.etch(protocolConfigAddress, protocolConfigCode);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000000';
		value = hex'0000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496';
		vm.store(protocolConfigAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000001';
		value = hex'000000000000271003e803e8344ef496b004663a04d70b427a78e33cc3e9f619';
		vm.store(protocolConfigAddress, slot, value);
		vm.etch(oracleAddress, oracleCode);
		vm.etch(acc14Address, acc14Code);
		vm.etch(acc15Address, acc15Code);
		vm.etch(eTSTAddress, eTSTCode);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000000';
		value = hex'0000000000000000000000000000000000000000000000000000000000000001';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000001';
		value = hex'0000000100000000000000000000000000000000000000000000000000000000';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000002';
		value = hex'0000000000000000000000000000000000000000000000000000000000000001';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000003';
		value = hex'0000000000000000000000000000000000000000000000000000000000000000';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000004';
		value = hex'0000000000000000000000000000000000000000000000000000000000000000';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000005';
		value = hex'0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000006';
		value = hex'0000000000000000000003e83381cd18e2fb4db236bf0525938ab6e43db0440f';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000007';
		value = hex'45564b205661756c7420654532304d2d31000000000000000000000000000022';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000008';
		value = hex'654532304d2d310000000000000000000000000000000000000000000000000e';
		vm.store(eTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000009';
		value = hex'0000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496';
		vm.store(eTSTAddress, slot, value);
		slot = hex'000000000000000000000000000000000000000000000000000000000000000a';
		value = hex'0000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496';
		vm.store(eTSTAddress, slot, value);
		slot = hex'a3f0ad74e5423aebfd80d3ef4346578335a9a72aeaee59ff6cb3582b35133d50';
		value = hex'000000000000000000000000db25a7b768311de128bbda7b8426c3f9c74f3240';
		vm.store(eTSTAddress, slot, value);
		vm.etch(acc16Address, acc16Code);
		vm.etch(acc17Address, acc17Code);
		vm.etch(sequenceRegistryAddress, sequenceRegistryCode);
		slot = hex'de660128e8e2b2843057b5aa095d8d81227c789f28542244b19c5ed248c1d21b';
		value = hex'0000000000000000000000000000000000000000000000000000000000000002';
		vm.store(sequenceRegistryAddress, slot, value);
		vm.etch(factoryAddress, factoryCode);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000000';
		value = hex'0000000000000000000000000000000000000000000000000000000000000001';
		vm.store(factoryAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000001';
		value = hex'0000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496';
		vm.store(factoryAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000002';
		value = hex'00000000000000000000000013aa49bac059d709dd0a18d6bb63290076a702d7';
		vm.store(factoryAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000004';
		value = hex'0000000000000000000000000000000000000000000000000000000000000002';
		vm.store(factoryAddress, slot, value);
		slot = hex'140502ef14c9076d739ac376db5488e150b22709a0f3278322719464014650f2';
		value = hex'000000000000000000000013aa49bac059d709dd0a18d6bb63290076a702d701';
		vm.store(factoryAddress, slot, value);
		slot = hex'140502ef14c9076d739ac376db5488e150b22709a0f3278322719464014650f3';
		value = hex'0000000000000000000000000000000000000000000000000000000000000079';
		vm.store(factoryAddress, slot, value);
		slot = hex'2bc0ea5cc4a3769fe20ef2f520da0e75cb8f968a158cf59582bf345d76f0c9b6';
		value = hex'000000000000000000000013aa49bac059d709dd0a18d6bb63290076a702d701';
		vm.store(factoryAddress, slot, value);
		slot = hex'2bc0ea5cc4a3769fe20ef2f520da0e75cb8f968a158cf59582bf345d76f0c9b7';
		value = hex'0000000000000000000000000000000000000000000000000000000000000079';
		vm.store(factoryAddress, slot, value);
		slot = hex'5f1728f021d809868987e0e6b404854f22873a0623416db7df384042834d8bc2';
		value = hex'a0cb889707d426a7a386870a03bc70d1b06975985991a2df15a8f6a256d3ec51';
		vm.store(factoryAddress, slot, value);
		slot = hex'5f1728f021d809868987e0e6b404854f22873a0623416db7df384042834d8bc3';
		value = hex'e99254cd3fb576a9000000000000000000000000000000000000000100000000';
		vm.store(factoryAddress, slot, value);
		slot = hex'8a35acfbc15ff81a39ae7d344fd709f28e8600b4aa8c65c6b64bfe7fe36bd19b';
		value = hex'000000000000000000000000a02a0858a7b38b1f7f3230fad136bd895c412ce5';
		vm.store(factoryAddress, slot, value);
		slot = hex'8a35acfbc15ff81a39ae7d344fd709f28e8600b4aa8c65c6b64bfe7fe36bd19c';
		value = hex'00000000000000000000000065b6a5f2965e6f125a8b1189ed57739ca49bc70e';
		vm.store(factoryAddress, slot, value);
		slot = hex'ffdeb92892f2345410c11353fa7a49c8bd19342f1fd3dbe921aa0c69787c7e63';
		value = hex'1d1499e622d69689cdf9004d05ec547d650ff2115991a2df15a8f6a256d3ec51';
		vm.store(factoryAddress, slot, value);
		slot = hex'ffdeb92892f2345410c11353fa7a49c8bd19342f1fd3dbe921aa0c69787c7e64';
		value = hex'e99254cd3fb576a9000000000000000000000000000000000000000100000000';
		vm.store(factoryAddress, slot, value);
		vm.etch(acc18Address, acc18Code);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000000';
		value = hex'0000000000000000000000000000000000000000000000000000000000000001';
		vm.store(acc18Address, slot, value);
		vm.etch(acc19Address, acc19Code);
		vm.etch(acc20Address, acc20Code);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000000';
		value = hex'0000000000000000000000000000000000000000000000000000000000000001';
		vm.store(acc20Address, slot, value);
		vm.etch(assetTST2Address, assetTST2Code);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000003';
		value = hex'45524332304d6f636b0000000000000000000000000000000000000000000012';
		vm.store(assetTST2Address, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000004';
		value = hex'4532304d00000000000000000000000000000000000000000000000000000008';
		vm.store(assetTST2Address, slot, value);
		vm.etch(acc21Address, acc21Code);
		vm.etch(acc22Address, acc22Code);
		vm.etch(acc23Address, acc23Code);
		vm.etch(acc24Address, acc24Code);
		vm.etch(assetTSTAddress, assetTSTCode);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000003';
		value = hex'45524332304d6f636b0000000000000000000000000000000000000000000012';
		vm.store(assetTSTAddress, slot, value);
		slot = hex'0000000000000000000000000000000000000000000000000000000000000004';
		value = hex'4532304d00000000000000000000000000000000000000000000000000000008';
		vm.store(assetTSTAddress, slot, value);
		vm.etch(balanceTrackerAddress, balanceTrackerCode);
		vm.etch(acc25Address, acc25Code);
	}
}