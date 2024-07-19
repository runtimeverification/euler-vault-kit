#!/bin/bash

forge script test/kontrol/init-state/InitState.sol:InitState --sig runSetUp --ffi

kontrol load-state InitState test/kontrol/init-state/InitState.json --contract-names test/kontrol/init-state/AddressNames.json --output-dir test/kontrol/proofs/utils

forge fmt test/kontrol

FOUNDRY_PROFILE=kontrol kontrol build

FOUNDRY_PROFILE=kontrol kontrol prove --mt prove_EVault_asset_doesNotRevert --init-node-from-dump test/kontrol/init-state/InitState.json

FOUNDRY_PROFILE=kontrol kontrol prove --mt GLDTokenTest.test

FOUNDRY_PROFILE=kontrol kontrol prove --mt prove_Allowance_ReturnsZero --mt prove_Approve_NotSupported --mt prove_addIgnoredForTotalSupply_onlyOwner