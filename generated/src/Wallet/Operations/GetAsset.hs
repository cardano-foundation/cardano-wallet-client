-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation getAsset
module Wallet.Operations.GetAsset where

import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe
import qualified Control.Monad.Fail
import qualified Control.Monad.Trans.Reader
import qualified Data.Aeson
import qualified Data.Aeson as Data.Aeson.Encoding.Internal
import qualified Data.Aeson as Data.Aeson.Types
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.ByteString
import qualified Data.ByteString as Data.ByteString.Internal
import qualified Data.ByteString as Data.ByteString.Internal.Type
import qualified Data.Either
import qualified Data.Foldable
import qualified Data.Functor
import qualified Data.Maybe
import qualified Data.Scientific
import qualified Data.Text
import qualified Data.Text.Internal
import qualified Data.Time.Calendar as Data.Time.Calendar.Days
import qualified Data.Time.LocalTime as Data.Time.LocalTime.Internal.ZonedTime
import qualified Data.Vector
import qualified GHC.Base
import qualified GHC.Classes
import qualified GHC.Int
import qualified GHC.Show
import qualified GHC.Types
import qualified Network.HTTP.Client
import qualified Network.HTTP.Client as Network.HTTP.Client.Request
import qualified Network.HTTP.Client as Network.HTTP.Client.Types
import qualified Network.HTTP.Simple
import qualified Network.HTTP.Types
import qualified Network.HTTP.Types as Network.HTTP.Types.Status
import qualified Network.HTTP.Types as Network.HTTP.Types.URI
import qualified Wallet.Common
import Wallet.Types

-- | > GET /wallets/{walletId}/assets/{policyId}/{assetName}
-- 
-- Fetch a single asset from its \`policy_id\` and \`asset_name\`,
-- with its metadata if any.
-- 
-- The asset must be associated with the wallet.
getAsset :: forall m . Wallet.Common.MonadHTTP m => GetAssetParameters -- ^ Contains all available parameters of this operation (query and path parameters)
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response GetAssetResponse) -- ^ Monadic computation which returns the result of the operation
getAsset parameters = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either GetAssetResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> GetAssetResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                 GetAssetResponseBody200)
                                                                                                                                                         | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 404) (Network.HTTP.Client.Types.responseStatus response) -> GetAssetResponse404 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                 GetAssetResponseBody404)
                                                                                                                                                         | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> GetAssetResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                 GetAssetResponseBody406)
                                                                                                                                                         | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathWalletId parameters))) GHC.Base.<> ("/assets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathPolicyId parameters))) GHC.Base.<> ("/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathAssetName parameters))) GHC.Base.<> "")))))) GHC.Base.mempty)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/assets\/{policyId}\/{assetName}.GET.parameters@ in the specification.
-- 
-- 
data GetAssetParameters = GetAssetParameters {
  -- | pathAssetName: Represents the parameter named \'assetName\'
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 64
  getAssetParametersPathAssetName :: Data.Text.Internal.Text
  -- | pathPolicyId: Represents the parameter named \'policyId\'
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 56
  -- * Minimum length of 56
  , getAssetParametersPathPolicyId :: Data.Text.Internal.Text
  -- | pathWalletId: Represents the parameter named \'walletId\'
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 40
  -- * Minimum length of 40
  , getAssetParametersPathWalletId :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetAssetParameters
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["pathAssetName" Data.Aeson.Types.ToJSON..= getAssetParametersPathAssetName obj] : ["pathPolicyId" Data.Aeson.Types.ToJSON..= getAssetParametersPathPolicyId obj] : ["pathWalletId" Data.Aeson.Types.ToJSON..= getAssetParametersPathWalletId obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["pathAssetName" Data.Aeson.Types.ToJSON..= getAssetParametersPathAssetName obj] : ["pathPolicyId" Data.Aeson.Types.ToJSON..= getAssetParametersPathPolicyId obj] : ["pathWalletId" Data.Aeson.Types.ToJSON..= getAssetParametersPathWalletId obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetAssetParameters
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetAssetParameters" (\obj -> ((GHC.Base.pure GetAssetParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathAssetName")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathPolicyId")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathWalletId"))
-- | Create a new 'GetAssetParameters' with all required fields.
mkGetAssetParameters :: Data.Text.Internal.Text -- ^ 'getAssetParametersPathAssetName'
  -> Data.Text.Internal.Text -- ^ 'getAssetParametersPathPolicyId'
  -> Data.Text.Internal.Text -- ^ 'getAssetParametersPathWalletId'
  -> GetAssetParameters
mkGetAssetParameters getAssetParametersPathAssetName getAssetParametersPathPolicyId getAssetParametersPathWalletId = GetAssetParameters{getAssetParametersPathAssetName = getAssetParametersPathAssetName,
                                                                                                                                        getAssetParametersPathPolicyId = getAssetParametersPathPolicyId,
                                                                                                                                        getAssetParametersPathWalletId = getAssetParametersPathWalletId}
-- | Represents a response of the operation 'getAsset'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetAssetResponseError' is used.
data GetAssetResponse =
   GetAssetResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | GetAssetResponse200 GetAssetResponseBody200 -- ^ Ok
  | GetAssetResponse404 GetAssetResponseBody404 -- ^ Not Found
  | GetAssetResponse406 GetAssetResponseBody406 -- ^ Not Acceptable
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/assets\/{policyId}\/{assetName}.GET.responses.200.content.application\/json.schema@ in the specification.
-- 
-- 
data GetAssetResponseBody200 = GetAssetResponseBody200 {
  -- | asset_name: The asset on-chain type which acts as a sub-identifier within a
  -- policy. Although we call it \"asset name\", the value needn\'t be
  -- text, and it could even be empty.
  -- 
  -- For policies with a single fungible asset item, asset name is
  -- typically an empty string.
  -- 
  -- This value can be up to 32 bytes of arbitrary data (which is 64
  -- hexadecimal digits).
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 64
  getAssetResponseBody200Asset_name :: Data.Text.Internal.Text
  -- | fingerprint: A user-facing short fingerprint which combines the \`policy_id\` and \`asset_name\`
  -- to allow for an easier human comparison of assets. Note that it is generally
  -- **not okay** to use this fingerprint as a unique identifier for it is not collision
  -- resistant. Yet within the context of a single wallet, it makes for a (rather)
  -- short user-facing comparison mean.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 44
  -- * Minimum length of 44
  -- * Must match pattern \'^(asset)1[0-9a-z]*\$\'
  , getAssetResponseBody200Fingerprint :: Data.Text.Internal.Text
  -- | metadata: In the Mary era of Cardano, UTxO may contain native assets. These
  -- assets are represented on-chain by opaque identifiers which are
  -- meaningless to end-users. Therefore, user-facing metadata
  -- regarding each token must be stored off-chain, in a metadata
  -- registry.
  -- 
  -- Token creators may publish metadata into the registry and client
  -- applications can consume these metadata for display to end
  -- users. This will work in a similar way to how it is done for stake
  -- pool metadata.
  , getAssetResponseBody200Metadata :: (GHC.Maybe.Maybe GetAssetResponseBody200Metadata)
  -- | metadata_error: If there was an error fetching metadata from the server,
  -- this will be set to one of \`fetch\` or \`parse\`, to indicate
  -- the kind of error.
  , getAssetResponseBody200Metadata_error :: (GHC.Maybe.Maybe GetAssetResponseBody200Metadata_error)
  -- | policy_id: A unique identifier of the asset\'s monetary policy. The policy
  -- controls how assets of this kind are created and destroyed.
  -- 
  -- The contents are the blake2b-224 hash of the monetary policy
  -- script, encoded in hexadecimal.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 56
  -- * Minimum length of 56
  , getAssetResponseBody200Policy_id :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetAssetResponseBody200
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["asset_name" Data.Aeson.Types.ToJSON..= getAssetResponseBody200Asset_name obj] : ["fingerprint" Data.Aeson.Types.ToJSON..= getAssetResponseBody200Fingerprint obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("metadata" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200Metadata obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("metadata_error" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200Metadata_error obj) : ["policy_id" Data.Aeson.Types.ToJSON..= getAssetResponseBody200Policy_id obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["asset_name" Data.Aeson.Types.ToJSON..= getAssetResponseBody200Asset_name obj] : ["fingerprint" Data.Aeson.Types.ToJSON..= getAssetResponseBody200Fingerprint obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("metadata" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200Metadata obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("metadata_error" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200Metadata_error obj) : ["policy_id" Data.Aeson.Types.ToJSON..= getAssetResponseBody200Policy_id obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetAssetResponseBody200
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetAssetResponseBody200" (\obj -> ((((GHC.Base.pure GetAssetResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "asset_name")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "fingerprint")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "metadata")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "metadata_error")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "policy_id"))
-- | Create a new 'GetAssetResponseBody200' with all required fields.
mkGetAssetResponseBody200 :: Data.Text.Internal.Text -- ^ 'getAssetResponseBody200Asset_name'
  -> Data.Text.Internal.Text -- ^ 'getAssetResponseBody200Fingerprint'
  -> Data.Text.Internal.Text -- ^ 'getAssetResponseBody200Policy_id'
  -> GetAssetResponseBody200
mkGetAssetResponseBody200 getAssetResponseBody200Asset_name getAssetResponseBody200Fingerprint getAssetResponseBody200Policy_id = GetAssetResponseBody200{getAssetResponseBody200Asset_name = getAssetResponseBody200Asset_name,
                                                                                                                                                          getAssetResponseBody200Fingerprint = getAssetResponseBody200Fingerprint,
                                                                                                                                                          getAssetResponseBody200Metadata = GHC.Maybe.Nothing,
                                                                                                                                                          getAssetResponseBody200Metadata_error = GHC.Maybe.Nothing,
                                                                                                                                                          getAssetResponseBody200Policy_id = getAssetResponseBody200Policy_id}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/assets\/{policyId}\/{assetName}.GET.responses.200.content.application\/json.schema.properties.metadata@ in the specification.
-- 
-- In the Mary era of Cardano, UTxO may contain native assets. These
-- assets are represented on-chain by opaque identifiers which are
-- meaningless to end-users. Therefore, user-facing metadata
-- regarding each token must be stored off-chain, in a metadata
-- registry.
-- 
-- Token creators may publish metadata into the registry and client
-- applications can consume these metadata for display to end
-- users. This will work in a similar way to how it is done for stake
-- pool metadata.
data GetAssetResponseBody200Metadata = GetAssetResponseBody200Metadata {
  -- | decimals: Defines a scaling factor for the asset of 10\<sup>-n\<\/sup>. The
  -- decimals value _n_ is therefore the number of digits after the
  -- decimal point for quantities of this token.
  -- 
  -- It is up to API clients to use this metadata field to decimalize
  -- asset quantities before displaying to users. The wallet backend
  -- will always return unscaled token quantities as whole numbers.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maxium  of 255.0
  -- * Minimum  of 0.0
  getAssetResponseBody200MetadataDecimals :: (GHC.Maybe.Maybe GHC.Types.Int)
  -- | description: A human-readable description for the asset. Good for display in
  -- user interfaces.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 500
  , getAssetResponseBody200MetadataDescription :: Data.Text.Internal.Text
  -- | logo: A base64-encoded \`image\/png\` for displaying the asset. The end image can be expected
  -- to be smaller than 64KB.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 87400
  , getAssetResponseBody200MetadataLogo :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | name: A human-readable name for the asset, intended for display in user
  -- interfaces.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 50
  -- * Minimum length of 1
  , getAssetResponseBody200MetadataName :: Data.Text.Internal.Text
  -- | ticker: An optional human-readable very short name or acronym for the
  -- asset, intended for display in user interfaces. If \`ticker\` is not
  -- present, then \`name\` will be used, but it might be truncated to
  -- fit within the available space.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 5
  -- * Minimum length of 2
  , getAssetResponseBody200MetadataTicker :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | url: A URL to the policy\'s owner(s) or the entity website in charge of the asset.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 250
  -- * Must match pattern \'^https:\/\/.+\'
  , getAssetResponseBody200MetadataUrl :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetAssetResponseBody200Metadata
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("decimals" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200MetadataDecimals obj) : ["description" Data.Aeson.Types.ToJSON..= getAssetResponseBody200MetadataDescription obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("logo" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200MetadataLogo obj) : ["name" Data.Aeson.Types.ToJSON..= getAssetResponseBody200MetadataName obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("ticker" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200MetadataTicker obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("url" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200MetadataUrl obj) : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("decimals" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200MetadataDecimals obj) : ["description" Data.Aeson.Types.ToJSON..= getAssetResponseBody200MetadataDescription obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("logo" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200MetadataLogo obj) : ["name" Data.Aeson.Types.ToJSON..= getAssetResponseBody200MetadataName obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("ticker" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200MetadataTicker obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("url" Data.Aeson.Types.ToJSON..=)) (getAssetResponseBody200MetadataUrl obj) : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetAssetResponseBody200Metadata
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetAssetResponseBody200Metadata" (\obj -> (((((GHC.Base.pure GetAssetResponseBody200Metadata GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "decimals")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "description")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "logo")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "name")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "ticker")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "url"))
-- | Create a new 'GetAssetResponseBody200Metadata' with all required fields.
mkGetAssetResponseBody200Metadata :: Data.Text.Internal.Text -- ^ 'getAssetResponseBody200MetadataDescription'
  -> Data.Text.Internal.Text -- ^ 'getAssetResponseBody200MetadataName'
  -> GetAssetResponseBody200Metadata
mkGetAssetResponseBody200Metadata getAssetResponseBody200MetadataDescription getAssetResponseBody200MetadataName = GetAssetResponseBody200Metadata{getAssetResponseBody200MetadataDecimals = GHC.Maybe.Nothing,
                                                                                                                                                   getAssetResponseBody200MetadataDescription = getAssetResponseBody200MetadataDescription,
                                                                                                                                                   getAssetResponseBody200MetadataLogo = GHC.Maybe.Nothing,
                                                                                                                                                   getAssetResponseBody200MetadataName = getAssetResponseBody200MetadataName,
                                                                                                                                                   getAssetResponseBody200MetadataTicker = GHC.Maybe.Nothing,
                                                                                                                                                   getAssetResponseBody200MetadataUrl = GHC.Maybe.Nothing}
-- | Defines the enum schema located at @paths.\/wallets\/{walletId}\/assets\/{policyId}\/{assetName}.GET.responses.200.content.application\/json.schema.properties.metadata_error@ in the specification.
-- 
-- If there was an error fetching metadata from the server,
-- this will be set to one of \`fetch\` or \`parse\`, to indicate
-- the kind of error.
data GetAssetResponseBody200Metadata_error =
   GetAssetResponseBody200Metadata_errorOther Data.Aeson.Types.Internal.Value -- ^ This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
  | GetAssetResponseBody200Metadata_errorTyped Data.Text.Internal.Text -- ^ This constructor can be used to send values to the server which are not present in the specification yet.
  | GetAssetResponseBody200Metadata_errorEnumFetch -- ^ Represents the JSON value @"fetch"@
  | GetAssetResponseBody200Metadata_errorEnumParse -- ^ Represents the JSON value @"parse"@
  deriving (GHC.Show.Show, GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetAssetResponseBody200Metadata_error
    where toJSON (GetAssetResponseBody200Metadata_errorOther val) = val
          toJSON (GetAssetResponseBody200Metadata_errorTyped val) = Data.Aeson.Types.ToJSON.toJSON val
          toJSON (GetAssetResponseBody200Metadata_errorEnumFetch) = "fetch"
          toJSON (GetAssetResponseBody200Metadata_errorEnumParse) = "parse"
instance Data.Aeson.Types.FromJSON.FromJSON GetAssetResponseBody200Metadata_error
    where parseJSON val = GHC.Base.pure (if | val GHC.Classes.== "fetch" -> GetAssetResponseBody200Metadata_errorEnumFetch
                                            | val GHC.Classes.== "parse" -> GetAssetResponseBody200Metadata_errorEnumParse
                                            | GHC.Base.otherwise -> GetAssetResponseBody200Metadata_errorOther val)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/assets\/{policyId}\/{assetName}.GET.responses.404.content.application\/json.schema@ in the specification.
-- 
-- 
data GetAssetResponseBody404 = GetAssetResponseBody404 {
  -- | message: Occurs when requesting information about an asset which is not
  -- involved in any transaction related to the wallet.
  getAssetResponseBody404Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetAssetResponseBody404
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getAssetResponseBody404Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "asset_not_present"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getAssetResponseBody404Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "asset_not_present"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetAssetResponseBody404
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetAssetResponseBody404" (\obj -> GHC.Base.pure GetAssetResponseBody404 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetAssetResponseBody404' with all required fields.
mkGetAssetResponseBody404 :: Data.Text.Internal.Text -- ^ 'getAssetResponseBody404Message'
  -> GetAssetResponseBody404
mkGetAssetResponseBody404 getAssetResponseBody404Message = GetAssetResponseBody404{getAssetResponseBody404Message = getAssetResponseBody404Message}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/assets\/{policyId}\/{assetName}.GET.responses.406.content.application\/json.schema@ in the specification.
-- 
-- 
data GetAssetResponseBody406 = GetAssetResponseBody406 {
  -- | message: May occur when providing an invalid \'Accept\' header.
  getAssetResponseBody406Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetAssetResponseBody406
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getAssetResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getAssetResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetAssetResponseBody406
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetAssetResponseBody406" (\obj -> GHC.Base.pure GetAssetResponseBody406 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetAssetResponseBody406' with all required fields.
mkGetAssetResponseBody406 :: Data.Text.Internal.Text -- ^ 'getAssetResponseBody406Message'
  -> GetAssetResponseBody406
mkGetAssetResponseBody406 getAssetResponseBody406Message = GetAssetResponseBody406{getAssetResponseBody406Message = getAssetResponseBody406Message}
-- | > GET /wallets/{walletId}/assets/{policyId}/{assetName}
-- 
-- The same as 'getAsset' but accepts an explicit configuration.
getAssetWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> GetAssetParameters -- ^ Contains all available parameters of this operation (query and path parameters)
  -> m (Network.HTTP.Client.Types.Response GetAssetResponse) -- ^ Monadic computation which returns the result of the operation
getAssetWithConfiguration config
                          parameters = GHC.Base.fmap (\response_4 -> GHC.Base.fmap (Data.Either.either GetAssetResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_5 -> Network.HTTP.Types.Status.statusCode status_5 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> GetAssetResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                  GetAssetResponseBody200)
                                                                                                                                                                          | (\status_6 -> Network.HTTP.Types.Status.statusCode status_6 GHC.Classes.== 404) (Network.HTTP.Client.Types.responseStatus response) -> GetAssetResponse404 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                  GetAssetResponseBody404)
                                                                                                                                                                          | (\status_7 -> Network.HTTP.Types.Status.statusCode status_7 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> GetAssetResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                  GetAssetResponseBody406)
                                                                                                                                                                          | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_4) response_4) (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathWalletId parameters))) GHC.Base.<> ("/assets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathPolicyId parameters))) GHC.Base.<> ("/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathAssetName parameters))) GHC.Base.<> "")))))) GHC.Base.mempty)
-- | > GET /wallets/{walletId}/assets/{policyId}/{assetName}
-- 
-- The same as 'getAsset' but returns the raw 'Data.ByteString.ByteString'.
getAssetRaw :: forall m . Wallet.Common.MonadHTTP m => GetAssetParameters -- ^ Contains all available parameters of this operation (query and path parameters)
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
getAssetRaw parameters = GHC.Base.id (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathWalletId parameters))) GHC.Base.<> ("/assets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathPolicyId parameters))) GHC.Base.<> ("/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathAssetName parameters))) GHC.Base.<> "")))))) GHC.Base.mempty)
-- | > GET /wallets/{walletId}/assets/{policyId}/{assetName}
-- 
-- The same as 'getAsset' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
getAssetWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> GetAssetParameters -- ^ Contains all available parameters of this operation (query and path parameters)
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
getAssetWithConfigurationRaw config
                             parameters = GHC.Base.id (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathWalletId parameters))) GHC.Base.<> ("/assets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathPolicyId parameters))) GHC.Base.<> ("/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (getAssetParametersPathAssetName parameters))) GHC.Base.<> "")))))) GHC.Base.mempty)