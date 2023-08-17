-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation getPolicyKey
module Wallet.Operations.GetPolicyKey where

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

-- | > GET /wallets/{walletId}/policy-key
-- 
-- \<p align=\"right\">status: \<strong>stable\<\/strong>\<\/p>
-- Return a policy key for a derivation index = 0.
-- 
-- To get a hash of the policy key instead of the policy key,
-- use query parameter \`hash=true\`.
getPolicyKey :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response GetPolicyKeyResponse) -- ^ Monadic computation which returns the result of the operation
getPolicyKey walletId = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either GetPolicyKeyResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                           Data.Text.Internal.Text)
                                                                                                                                                               | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                           GetPolicyKeyResponseBody400)
                                                                                                                                                               | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 403) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse403 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                           GetPolicyKeyResponseBody403Variants)
                                                                                                                                                               | (\status_4 -> Network.HTTP.Types.Status.statusCode status_4 GHC.Classes.== 404) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse404 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                           GetPolicyKeyResponseBody404)
                                                                                                                                                               | (\status_5 -> Network.HTTP.Types.Status.statusCode status_5 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                           GetPolicyKeyResponseBody406)
                                                                                                                                                               | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/policy-key")) GHC.Base.mempty)
-- | Represents a response of the operation 'getPolicyKey'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetPolicyKeyResponseError' is used.
data GetPolicyKeyResponse =
   GetPolicyKeyResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | GetPolicyKeyResponse200 Data.Text.Internal.Text -- ^ Ok
  | GetPolicyKeyResponse400 GetPolicyKeyResponseBody400 -- ^ Bad Request
  | GetPolicyKeyResponse403 GetPolicyKeyResponseBody403Variants -- ^ Forbidden
  | GetPolicyKeyResponse404 GetPolicyKeyResponseBody404 -- ^ Not Found
  | GetPolicyKeyResponse406 GetPolicyKeyResponseBody406 -- ^ Not Acceptable
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/policy-key.GET.responses.400.content.application\/json.schema@ in the specification.
-- 
-- 
data GetPolicyKeyResponseBody400 = GetPolicyKeyResponseBody400 {
  -- | message: May occur when a request is not well-formed; that is, it fails to parse
  -- successfully. This could be the case when some required parameters
  -- are missing or, when malformed values are provided.
  getPolicyKeyResponseBody400Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetPolicyKeyResponseBody400
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetPolicyKeyResponseBody400
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPolicyKeyResponseBody400" (\obj -> GHC.Base.pure GetPolicyKeyResponseBody400 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetPolicyKeyResponseBody400' with all required fields.
mkGetPolicyKeyResponseBody400 :: Data.Text.Internal.Text -- ^ 'getPolicyKeyResponseBody400Message'
  -> GetPolicyKeyResponseBody400
mkGetPolicyKeyResponseBody400 getPolicyKeyResponseBody400Message = GetPolicyKeyResponseBody400{getPolicyKeyResponseBody400Message = getPolicyKeyResponseBody400Message}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/policy-key.GET.responses.403.content.application\/json.schema.oneOf@ in the specification.
-- 
-- 
data GetPolicyKeyResponseBody403OneOf1 = GetPolicyKeyResponseBody403OneOf1 {
  -- | message: May occur when trying to perform an operation not supported by this type of wallet.
  getPolicyKeyResponseBody403OneOf1Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetPolicyKeyResponseBody403OneOf1
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody403OneOf1Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "invalid_wallet_type"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody403OneOf1Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "invalid_wallet_type"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetPolicyKeyResponseBody403OneOf1
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPolicyKeyResponseBody403OneOf1" (\obj -> GHC.Base.pure GetPolicyKeyResponseBody403OneOf1 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetPolicyKeyResponseBody403OneOf1' with all required fields.
mkGetPolicyKeyResponseBody403OneOf1 :: Data.Text.Internal.Text -- ^ 'getPolicyKeyResponseBody403OneOf1Message'
  -> GetPolicyKeyResponseBody403OneOf1
mkGetPolicyKeyResponseBody403OneOf1 getPolicyKeyResponseBody403OneOf1Message = GetPolicyKeyResponseBody403OneOf1{getPolicyKeyResponseBody403OneOf1Message = getPolicyKeyResponseBody403OneOf1Message}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/policy-key.GET.responses.403.content.application\/json.schema.oneOf@ in the specification.
-- 
-- 
data GetPolicyKeyResponseBody403OneOf2 = GetPolicyKeyResponseBody403OneOf2 {
  -- | message: Occurs when trying to construct with minting\/burning on shelley wallet without policy public key.
  getPolicyKeyResponseBody403OneOf2Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetPolicyKeyResponseBody403OneOf2
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody403OneOf2Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "missing_policy_public_key"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody403OneOf2Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "missing_policy_public_key"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetPolicyKeyResponseBody403OneOf2
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPolicyKeyResponseBody403OneOf2" (\obj -> GHC.Base.pure GetPolicyKeyResponseBody403OneOf2 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetPolicyKeyResponseBody403OneOf2' with all required fields.
mkGetPolicyKeyResponseBody403OneOf2 :: Data.Text.Internal.Text -- ^ 'getPolicyKeyResponseBody403OneOf2Message'
  -> GetPolicyKeyResponseBody403OneOf2
mkGetPolicyKeyResponseBody403OneOf2 getPolicyKeyResponseBody403OneOf2Message = GetPolicyKeyResponseBody403OneOf2{getPolicyKeyResponseBody403OneOf2Message = getPolicyKeyResponseBody403OneOf2Message}
-- | Defines the oneOf schema located at @paths.\/wallets\/{walletId}\/policy-key.GET.responses.403.content.application\/json.schema.oneOf@ in the specification.
-- 
-- 
data GetPolicyKeyResponseBody403Variants =
   GetPolicyKeyResponseBody403Variant1 GetPolicyKeyResponseBody403OneOf1
  | GetPolicyKeyResponseBody403Variant2 GetPolicyKeyResponseBody403OneOf2
  deriving (GHC.Show.Show, GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetPolicyKeyResponseBody403Variants
    where toJSON (GetPolicyKeyResponseBody403Variant1 a) = Data.Aeson.Types.ToJSON.toJSON a
          toJSON (GetPolicyKeyResponseBody403Variant2 a) = Data.Aeson.Types.ToJSON.toJSON a
instance Data.Aeson.Types.FromJSON.FromJSON GetPolicyKeyResponseBody403Variants
    where parseJSON val = case (GetPolicyKeyResponseBody403Variant1 Data.Functor.<$> Data.Aeson.Types.FromJSON.fromJSON val) GHC.Base.<|> ((GetPolicyKeyResponseBody403Variant2 Data.Functor.<$> Data.Aeson.Types.FromJSON.fromJSON val) GHC.Base.<|> Data.Aeson.Types.Internal.Error "No variant matched") of
                              Data.Aeson.Types.Internal.Success a -> GHC.Base.pure a
                              Data.Aeson.Types.Internal.Error a -> Control.Monad.Fail.fail a
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/policy-key.GET.responses.404.content.application\/json.schema@ in the specification.
-- 
-- 
data GetPolicyKeyResponseBody404 = GetPolicyKeyResponseBody404 {
  -- | code: A specific error code for this error, more precise than HTTP ones.
  getPolicyKeyResponseBody404Code :: Data.Text.Internal.Text
  -- | message: A descriptive error message.
  , getPolicyKeyResponseBody404Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetPolicyKeyResponseBody404
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["code" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody404Code obj] : ["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody404Message obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["code" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody404Code obj] : ["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody404Message obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetPolicyKeyResponseBody404
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPolicyKeyResponseBody404" (\obj -> (GHC.Base.pure GetPolicyKeyResponseBody404 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "code")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetPolicyKeyResponseBody404' with all required fields.
mkGetPolicyKeyResponseBody404 :: Data.Text.Internal.Text -- ^ 'getPolicyKeyResponseBody404Code'
  -> Data.Text.Internal.Text -- ^ 'getPolicyKeyResponseBody404Message'
  -> GetPolicyKeyResponseBody404
mkGetPolicyKeyResponseBody404 getPolicyKeyResponseBody404Code getPolicyKeyResponseBody404Message = GetPolicyKeyResponseBody404{getPolicyKeyResponseBody404Code = getPolicyKeyResponseBody404Code,
                                                                                                                               getPolicyKeyResponseBody404Message = getPolicyKeyResponseBody404Message}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/policy-key.GET.responses.406.content.application\/json.schema@ in the specification.
-- 
-- 
data GetPolicyKeyResponseBody406 = GetPolicyKeyResponseBody406 {
  -- | message: May occur when providing an invalid \'Accept\' header.
  getPolicyKeyResponseBody406Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetPolicyKeyResponseBody406
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getPolicyKeyResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetPolicyKeyResponseBody406
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPolicyKeyResponseBody406" (\obj -> GHC.Base.pure GetPolicyKeyResponseBody406 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetPolicyKeyResponseBody406' with all required fields.
mkGetPolicyKeyResponseBody406 :: Data.Text.Internal.Text -- ^ 'getPolicyKeyResponseBody406Message'
  -> GetPolicyKeyResponseBody406
mkGetPolicyKeyResponseBody406 getPolicyKeyResponseBody406Message = GetPolicyKeyResponseBody406{getPolicyKeyResponseBody406Message = getPolicyKeyResponseBody406Message}
-- | > GET /wallets/{walletId}/policy-key
-- 
-- The same as 'getPolicyKey' but accepts an explicit configuration.
getPolicyKeyWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> m (Network.HTTP.Client.Types.Response GetPolicyKeyResponse) -- ^ Monadic computation which returns the result of the operation
getPolicyKeyWithConfiguration config
                              walletId = GHC.Base.fmap (\response_6 -> GHC.Base.fmap (Data.Either.either GetPolicyKeyResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_7 -> Network.HTTP.Types.Status.statusCode status_7 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                            Data.Text.Internal.Text)
                                                                                                                                                                                | (\status_8 -> Network.HTTP.Types.Status.statusCode status_8 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                            GetPolicyKeyResponseBody400)
                                                                                                                                                                                | (\status_9 -> Network.HTTP.Types.Status.statusCode status_9 GHC.Classes.== 403) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse403 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                            GetPolicyKeyResponseBody403Variants)
                                                                                                                                                                                | (\status_10 -> Network.HTTP.Types.Status.statusCode status_10 GHC.Classes.== 404) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse404 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                              GetPolicyKeyResponseBody404)
                                                                                                                                                                                | (\status_11 -> Network.HTTP.Types.Status.statusCode status_11 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> GetPolicyKeyResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                              GetPolicyKeyResponseBody406)
                                                                                                                                                                                | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_6) response_6) (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/policy-key")) GHC.Base.mempty)
-- | > GET /wallets/{walletId}/policy-key
-- 
-- The same as 'getPolicyKey' but returns the raw 'Data.ByteString.ByteString'.
getPolicyKeyRaw :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
getPolicyKeyRaw walletId = GHC.Base.id (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/policy-key")) GHC.Base.mempty)
-- | > GET /wallets/{walletId}/policy-key
-- 
-- The same as 'getPolicyKey' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
getPolicyKeyWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
getPolicyKeyWithConfigurationRaw config
                                 walletId = GHC.Base.id (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/policy-key")) GHC.Base.mempty)
