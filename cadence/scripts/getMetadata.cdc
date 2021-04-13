// flow scripts execute GetMetadata.cdc

import Pixori from 0x05f5f6e2056f588b

pub fun main(address: Address) {
// pub fun main(address: Address): [{String: String}] {

    let nftOwner = getAccount(address)
    let capability = nftOwner.getCapability<&{Pixori.NFTReceiver}>(/public/NFTReceiver)
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow receiver reference")

    log("Current user's NFTs")
    let allIDs = receiverRef.getIDs()
    // var allMetadata: [{String: String}] = []


    for id in allIDs {
        log(receiverRef.getMetadata(id: id))
        // delete the line above
        // allMetadata[id] = receiverRef.getMetadata(id: id)
    }
    // return allMetadata
    // Error: GraphQL error: panic: runtime error: index out of range [1] with length 0

}
