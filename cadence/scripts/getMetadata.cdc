// flow scripts execute GetMetadata.cdc

import Pixori from 0x05f5f6e2056f588b

pub fun main(address: Address) {

    let nftOwner = getAccount(address)
    let capability = nftOwner.getCapability<&{Pixori.NFTReceiver}>(/public/NFTReceiver)
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow receiver reference")

    log("Current user's NFTs")
    let allIDs = receiverRef.getIDs()

    // print one id respectively
    for id in allIDs {
        log(receiverRef.getMetadata(id: id))
    }
}
