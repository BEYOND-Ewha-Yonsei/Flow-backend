// flow transactions send --code NFT.cdc --signer admin-account

pub contract Pixori {

    pub resource NFT {
        pub let id: UInt64
        pub let metadata: {String: String}

        init(initID: UInt64) {
            self.id = initID
            self.metadata = {}
        }
    }


    pub resource interface NFTReceiver {

        pub fun deposit(token: @NFT, metadata: {String: String})
        pub fun getIDs(): [UInt64]
        pub fun idExists(id: UInt64): Bool
        pub fun getMetadata(id: UInt64) : {String : String}
    }


    pub resource Collection: NFTReceiver {

        pub var ownedNFTs: @{UInt64: NFT}
        pub var metadataObjs: {UInt64: {String: String}}

        init () {
            self.ownedNFTs <- {}
            self.metadataObjs = {}
        }

        pub fun withdraw(withdrawID: UInt64): @NFT {
            let token <- self.ownedNFTs.remove(key: withdrawID)!

            return <-token
        }

        pub fun deposit(token: @NFT, metadata: {String : String}) {

            // notice: fix an order of "self.metadataObjs" & "self.ownedNFTs"
            self.metadataObjs[token.id] = metadata
            self.ownedNFTs[token.id] <-! token
        }

        pub fun idExists(id: UInt64): Bool {
            return self.ownedNFTs[id] != nil
        }

        pub fun getIDs(): [UInt64] {
            return self.ownedNFTs.keys
        }

        pub fun getMetadata(id: UInt64): {String : String} {
            return self.metadataObjs[id]!
    }

        destroy() {
            destroy self.ownedNFTs
        }
    }


    pub fun createEmptyCollection(): @Collection {
        return <- create Collection()
    }


    pub resource NFTMinter {

        pub var idCount: UInt64

        init() {
            self.idCount = 1
        }

        pub fun mintNFT(): @NFT {

            var newNFT <- create NFT(initID: self.idCount)
            self.idCount = self.idCount + 1 as UInt64
            
            return <-newNFT
        }
    }
    
    pub fun check(_ address: Address): Bool {
      return getAccount(address)
        .getCapability<&{Pixori.NFTReceiver}>(/public/NFTReceiver)
        .check()
    }

	init() {
    
        self.account.save(<-self.createEmptyCollection(), to: /storage/NFTCollection)
        self.account.link<&{NFTReceiver}>(/public/NFTReceiver, target: /storage/NFTCollection)
        self.account.save(<-create NFTMinter(), to: /storage/NFTMinter)
	}
}
 
