// flow transactions send --code Setup.cdc --signer user-account

import ExampleNFT from 0x02 // set "0x02" as admin-account address

transaction {

    prepare(acct: AuthAccount) {

        let collection <- ExampleNFT.createEmptyCollection()

        acct.save<@ExampleNFT.Collection>(<-collection, to: /storage/NFTCollection)
        log("Collection created for account 1")

        acct.link<&{ExampleNFT.NFTReceiver}>(/public/NFTReceiver, target: /storage/NFTCollection)
        log("Capability created")
    }
}
 