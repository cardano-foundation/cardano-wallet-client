{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}

module WalletSpec where

import Network.HTTP.Client (responseBody, responseStatus)
import Network.HTTP.Types (ok200)
import Test.Syd (Spec, describe, it, shouldBe, shouldSatisfy)
import Wallet.Common
  ( Configuration (..),
    anonymousSecurityScheme,
    runWithConfiguration,
  )
import Wallet.Operations.ListWallets
  ( ListWalletsResponse (..),
    listWallets,
  )

spec :: Spec
spec = describe "(+)" $ do
  it "lists wallets" $ do
    resp <- runWithConfiguration configuration listWallets
    responseStatus resp `shouldBe` ok200
    let ListWalletsResponse200 wallets = responseBody resp
    wallets `shouldSatisfy` not . null

configuration :: Configuration
configuration =
  Configuration
    { configBaseURL = "http://localhost:8090/v2",
      configSecurityScheme = anonymousSecurityScheme,
      configIncludeUserAgent = False,
      configApplicationName = ""
    }
