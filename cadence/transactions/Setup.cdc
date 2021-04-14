// flow transactions send Setup.cdc --signer user-account 

import Pixori from 0x05f5f6e2056f588b 

transaction {

    prepare(acct: AuthAccount) {

        let collection <- Pixori.createEmptyCollection()

        acct.save<@Pixori.Collection>(<-collection, to: /storage/NFTCollection)
        log("Collection created for Current user")

        acct.link<&{Pixori.NFTReceiver}>(/public/NFTReceiver, target: /storage/NFTCollection)
        log("Capability created")
    }
}
 