-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation putSettings
module Wallet.Operations.PutSettings where

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

-- | > PUT /settings
-- 
-- \<p align=\"right\">status: \<strong>stable\<\/strong>\<\/p>
-- 
-- Overwrite current settings.
putSettings :: forall m . Wallet.Common.MonadHTTP m => PutSettingsRequestBody -- ^ The request body to send
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response PutSettingsResponse) -- ^ Monadic computation which returns the result of the operation
putSettings body = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either PutSettingsResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 204) (Network.HTTP.Client.Types.responseStatus response) -> Data.Either.Right PutSettingsResponse204
                                                                                                                                                         | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> PutSettingsResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                    PutSettingsResponseBody400)
                                                                                                                                                         | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 415) (Network.HTTP.Client.Types.responseStatus response) -> PutSettingsResponse415 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                    PutSettingsResponseBody415)
                                                                                                                                                         | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "PUT") "/settings" GHC.Base.mempty (GHC.Maybe.Just body) Wallet.Common.RequestBodyEncodingJSON)
-- | Defines the object schema located at @paths.\/settings.PUT.requestBody.content.application\/json.schema@ in the specification.
-- 
-- 
data PutSettingsRequestBody = PutSettingsRequestBody {
  -- | settings: Settings
  putSettingsRequestBodySettings :: (GHC.Maybe.Maybe PutSettingsRequestBodySettings)
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PutSettingsRequestBody
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("settings" Data.Aeson.Types.ToJSON..=)) (putSettingsRequestBodySettings obj) : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("settings" Data.Aeson.Types.ToJSON..=)) (putSettingsRequestBodySettings obj) : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PutSettingsRequestBody
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PutSettingsRequestBody" (\obj -> GHC.Base.pure PutSettingsRequestBody GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "settings"))
-- | Create a new 'PutSettingsRequestBody' with all required fields.
mkPutSettingsRequestBody :: PutSettingsRequestBody
mkPutSettingsRequestBody = PutSettingsRequestBody{putSettingsRequestBodySettings = GHC.Maybe.Nothing}
-- | Defines the object schema located at @paths.\/settings.PUT.requestBody.content.application\/json.schema.properties.settings@ in the specification.
-- 
-- Settings
data PutSettingsRequestBodySettings = PutSettingsRequestBodySettings {
  -- | pool_metadata_source: Select stake pool metadata fetching strategy:
  --   - \`none\` - metadata is not fetched at all,
  --   - \`direct\` - metadata is fetched directly URLs registered on chain,
  --   - \`uri\` - metadata is fetched from an external Stake-Pool Metadata Aggregation Server (SMASH)
  -- 
  -- After update existing metadata will be dropped forcing it to re-sync automatically with the new setting.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Must match pattern \'^(none|direct|https?:\\\/\\\/[a-zA-Z0-9-_~.]+(:[0-9]+)?\/?)\$\'
  putSettingsRequestBodySettingsPool_metadata_source :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PutSettingsRequestBodySettings
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["pool_metadata_source" Data.Aeson.Types.ToJSON..= putSettingsRequestBodySettingsPool_metadata_source obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["pool_metadata_source" Data.Aeson.Types.ToJSON..= putSettingsRequestBodySettingsPool_metadata_source obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PutSettingsRequestBodySettings
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PutSettingsRequestBodySettings" (\obj -> GHC.Base.pure PutSettingsRequestBodySettings GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pool_metadata_source"))
-- | Create a new 'PutSettingsRequestBodySettings' with all required fields.
mkPutSettingsRequestBodySettings :: Data.Text.Internal.Text -- ^ 'putSettingsRequestBodySettingsPool_metadata_source'
  -> PutSettingsRequestBodySettings
mkPutSettingsRequestBodySettings putSettingsRequestBodySettingsPool_metadata_source = PutSettingsRequestBodySettings{putSettingsRequestBodySettingsPool_metadata_source = putSettingsRequestBodySettingsPool_metadata_source}
-- | Represents a response of the operation 'putSettings'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'PutSettingsResponseError' is used.
data PutSettingsResponse =
   PutSettingsResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | PutSettingsResponse204 -- ^ No Content
  | PutSettingsResponse400 PutSettingsResponseBody400 -- ^ Bad Request
  | PutSettingsResponse415 PutSettingsResponseBody415 -- ^ Unsupported Media Type
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/settings.PUT.responses.400.content.application\/json.schema@ in the specification.
-- 
-- 
data PutSettingsResponseBody400 = PutSettingsResponseBody400 {
  -- | message: May occur when a request is not well-formed; that is, it fails to parse
  -- successfully. This could be the case when some required parameters
  -- are missing or, when malformed values are provided.
  putSettingsResponseBody400Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PutSettingsResponseBody400
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= putSettingsResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= putSettingsResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PutSettingsResponseBody400
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PutSettingsResponseBody400" (\obj -> GHC.Base.pure PutSettingsResponseBody400 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PutSettingsResponseBody400' with all required fields.
mkPutSettingsResponseBody400 :: Data.Text.Internal.Text -- ^ 'putSettingsResponseBody400Message'
  -> PutSettingsResponseBody400
mkPutSettingsResponseBody400 putSettingsResponseBody400Message = PutSettingsResponseBody400{putSettingsResponseBody400Message = putSettingsResponseBody400Message}
-- | Defines the object schema located at @paths.\/settings.PUT.responses.415.content.application\/json.schema@ in the specification.
-- 
-- 
data PutSettingsResponseBody415 = PutSettingsResponseBody415 {
  -- | message: May occur when providing an invalid \'Content-Type\' header.
  putSettingsResponseBody415Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PutSettingsResponseBody415
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= putSettingsResponseBody415Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "unsupported_media_type"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= putSettingsResponseBody415Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "unsupported_media_type"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PutSettingsResponseBody415
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PutSettingsResponseBody415" (\obj -> GHC.Base.pure PutSettingsResponseBody415 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PutSettingsResponseBody415' with all required fields.
mkPutSettingsResponseBody415 :: Data.Text.Internal.Text -- ^ 'putSettingsResponseBody415Message'
  -> PutSettingsResponseBody415
mkPutSettingsResponseBody415 putSettingsResponseBody415Message = PutSettingsResponseBody415{putSettingsResponseBody415Message = putSettingsResponseBody415Message}
-- | > PUT /settings
-- 
-- The same as 'putSettings' but accepts an explicit configuration.
putSettingsWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> PutSettingsRequestBody -- ^ The request body to send
  -> m (Network.HTTP.Client.Types.Response PutSettingsResponse) -- ^ Monadic computation which returns the result of the operation
putSettingsWithConfiguration config
                             body = GHC.Base.fmap (\response_4 -> GHC.Base.fmap (Data.Either.either PutSettingsResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_5 -> Network.HTTP.Types.Status.statusCode status_5 GHC.Classes.== 204) (Network.HTTP.Client.Types.responseStatus response) -> Data.Either.Right PutSettingsResponse204
                                                                                                                                                                          | (\status_6 -> Network.HTTP.Types.Status.statusCode status_6 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> PutSettingsResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                     PutSettingsResponseBody400)
                                                                                                                                                                          | (\status_7 -> Network.HTTP.Types.Status.statusCode status_7 GHC.Classes.== 415) (Network.HTTP.Client.Types.responseStatus response) -> PutSettingsResponse415 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                     PutSettingsResponseBody415)
                                                                                                                                                                          | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_4) response_4) (Wallet.Common.doBodyCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "PUT") "/settings" GHC.Base.mempty (GHC.Maybe.Just body) Wallet.Common.RequestBodyEncodingJSON)
-- | > PUT /settings
-- 
-- The same as 'putSettings' but returns the raw 'Data.ByteString.ByteString'.
putSettingsRaw :: forall m . Wallet.Common.MonadHTTP m => PutSettingsRequestBody -- ^ The request body to send
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
putSettingsRaw body = GHC.Base.id (Wallet.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "PUT") "/settings" GHC.Base.mempty (GHC.Maybe.Just body) Wallet.Common.RequestBodyEncodingJSON)
-- | > PUT /settings
-- 
-- The same as 'putSettings' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
putSettingsWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> PutSettingsRequestBody -- ^ The request body to send
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
putSettingsWithConfigurationRaw config
                                body = GHC.Base.id (Wallet.Common.doBodyCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "PUT") "/settings" GHC.Base.mempty (GHC.Maybe.Just body) Wallet.Common.RequestBodyEncodingJSON)
