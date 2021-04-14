// flow scripts execute getMetadata.cdc

import Pixori from 0x05f5f6e2056f588b

// return all NFTs' metadata in an array
pub fun main(address: Address): [{String: String}] {

    let nftOwner = getAccount(address)
    let capability = nftOwner.getCapability<&{Pixori.NFTReceiver}>(/public/NFTReceiver)
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow receiver reference")

    log("Current user's NFTs")

    // get all NFTs' IDs in an array
    let allIDs = receiverRef.getIDs()

    // make an empty array to contain metadata
    var allMetadata: [{String: String}] = []

    // loop [allIDs] & add corresponding metadata to [allMetadata]
    for id in allIDs {
        allMetadata.append(receiverRef.getMetadata(id: id))
    }
    
    return allMetadata

}
