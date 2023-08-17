-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation postExternalTransaction
module Wallet.Operations.PostExternalTransaction where

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

-- | > POST /proxy/transactions
-- 
-- \<p align=\"right\">status: \<strong>stable\<\/strong>\<\/p>
-- 
-- Submits a transaction that was created and signed outside of cardano-wallet.
-- 
-- NOTE: Unlike the \`submitTransaction\` endpoint, there are no
-- guarantees that a transaction accepted by this endpoint will
-- actually be included in the chain. It\'s up to the caller to
-- retry submission until the transaction is confirmed.
postExternalTransaction :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response PostExternalTransactionResponse) -- ^ Monadic computation which returns the result of the operation
postExternalTransaction = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either PostExternalTransactionResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 202) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse202 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                   PostExternalTransactionResponseBody202)
                                                                                                                                                                            | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                   PostExternalTransactionResponseBody400)
                                                                                                                                                                            | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                   PostExternalTransactionResponseBody406)
                                                                                                                                                                            | (\status_4 -> Network.HTTP.Types.Status.statusCode status_4 GHC.Classes.== 415) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse415 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                   PostExternalTransactionResponseBody415)
                                                                                                                                                                            | (\status_5 -> Network.HTTP.Types.Status.statusCode status_5 GHC.Classes.== 425) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse425 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                   PostExternalTransactionResponseBody425)
                                                                                                                                                                            | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") "/proxy/transactions" GHC.Base.mempty)
-- | Represents a response of the operation 'postExternalTransaction'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'PostExternalTransactionResponseError' is used.
data PostExternalTransactionResponse =
   PostExternalTransactionResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | PostExternalTransactionResponse202 PostExternalTransactionResponseBody202 -- ^ Accepted
  | PostExternalTransactionResponse400 PostExternalTransactionResponseBody400 -- ^ Bad Request
  | PostExternalTransactionResponse406 PostExternalTransactionResponseBody406 -- ^ Not Acceptable
  | PostExternalTransactionResponse415 PostExternalTransactionResponseBody415 -- ^ Unsupported Media Type
  | PostExternalTransactionResponse425 PostExternalTransactionResponseBody425 -- ^ Mempool is Full
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/proxy\/transactions.POST.responses.202.content.application\/json.schema@ in the specification.
-- 
-- 
data PostExternalTransactionResponseBody202 = PostExternalTransactionResponseBody202 {
  -- | id: A unique identifier for this transaction
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 64
  -- * Minimum length of 64
  postExternalTransactionResponseBody202Id :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostExternalTransactionResponseBody202
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["id" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody202Id obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["id" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody202Id obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostExternalTransactionResponseBody202
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostExternalTransactionResponseBody202" (\obj -> GHC.Base.pure PostExternalTransactionResponseBody202 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "id"))
-- | Create a new 'PostExternalTransactionResponseBody202' with all required fields.
mkPostExternalTransactionResponseBody202 :: Data.Text.Internal.Text -- ^ 'postExternalTransactionResponseBody202Id'
  -> PostExternalTransactionResponseBody202
mkPostExternalTransactionResponseBody202 postExternalTransactionResponseBody202Id = PostExternalTransactionResponseBody202{postExternalTransactionResponseBody202Id = postExternalTransactionResponseBody202Id}
-- | Defines the object schema located at @paths.\/proxy\/transactions.POST.responses.400.content.application\/json.schema@ in the specification.
-- 
-- 
data PostExternalTransactionResponseBody400 = PostExternalTransactionResponseBody400 {
  -- | message: May occur when a request is not well-formed; that is, it fails to parse
  -- successfully. This could be the case when some required parameters
  -- are missing or, when malformed values are provided.
  postExternalTransactionResponseBody400Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostExternalTransactionResponseBody400
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostExternalTransactionResponseBody400
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostExternalTransactionResponseBody400" (\obj -> GHC.Base.pure PostExternalTransactionResponseBody400 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PostExternalTransactionResponseBody400' with all required fields.
mkPostExternalTransactionResponseBody400 :: Data.Text.Internal.Text -- ^ 'postExternalTransactionResponseBody400Message'
  -> PostExternalTransactionResponseBody400
mkPostExternalTransactionResponseBody400 postExternalTransactionResponseBody400Message = PostExternalTransactionResponseBody400{postExternalTransactionResponseBody400Message = postExternalTransactionResponseBody400Message}
-- | Defines the object schema located at @paths.\/proxy\/transactions.POST.responses.406.content.application\/json.schema@ in the specification.
-- 
-- 
data PostExternalTransactionResponseBody406 = PostExternalTransactionResponseBody406 {
  -- | message: May occur when providing an invalid \'Accept\' header.
  postExternalTransactionResponseBody406Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostExternalTransactionResponseBody406
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostExternalTransactionResponseBody406
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostExternalTransactionResponseBody406" (\obj -> GHC.Base.pure PostExternalTransactionResponseBody406 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PostExternalTransactionResponseBody406' with all required fields.
mkPostExternalTransactionResponseBody406 :: Data.Text.Internal.Text -- ^ 'postExternalTransactionResponseBody406Message'
  -> PostExternalTransactionResponseBody406
mkPostExternalTransactionResponseBody406 postExternalTransactionResponseBody406Message = PostExternalTransactionResponseBody406{postExternalTransactionResponseBody406Message = postExternalTransactionResponseBody406Message}
-- | Defines the object schema located at @paths.\/proxy\/transactions.POST.responses.415.content.application\/json.schema@ in the specification.
-- 
-- 
data PostExternalTransactionResponseBody415 = PostExternalTransactionResponseBody415 {
  -- | message: May occur when providing an invalid \'Content-Type\' header.
  postExternalTransactionResponseBody415Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostExternalTransactionResponseBody415
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody415Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "unsupported_media_type"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody415Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "unsupported_media_type"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostExternalTransactionResponseBody415
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostExternalTransactionResponseBody415" (\obj -> GHC.Base.pure PostExternalTransactionResponseBody415 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PostExternalTransactionResponseBody415' with all required fields.
mkPostExternalTransactionResponseBody415 :: Data.Text.Internal.Text -- ^ 'postExternalTransactionResponseBody415Message'
  -> PostExternalTransactionResponseBody415
mkPostExternalTransactionResponseBody415 postExternalTransactionResponseBody415Message = PostExternalTransactionResponseBody415{postExternalTransactionResponseBody415Message = postExternalTransactionResponseBody415Message}
-- | Defines the object schema located at @paths.\/proxy\/transactions.POST.responses.425.content.application\/json.schema@ in the specification.
-- 
-- 
data PostExternalTransactionResponseBody425 = PostExternalTransactionResponseBody425 {
  -- | message: May occur when submitting a serialized transaction to a node with full mempool.
  postExternalTransactionResponseBody425Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostExternalTransactionResponseBody425
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody425Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "mempool_is_full"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postExternalTransactionResponseBody425Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "mempool_is_full"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostExternalTransactionResponseBody425
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostExternalTransactionResponseBody425" (\obj -> GHC.Base.pure PostExternalTransactionResponseBody425 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PostExternalTransactionResponseBody425' with all required fields.
mkPostExternalTransactionResponseBody425 :: Data.Text.Internal.Text -- ^ 'postExternalTransactionResponseBody425Message'
  -> PostExternalTransactionResponseBody425
mkPostExternalTransactionResponseBody425 postExternalTransactionResponseBody425Message = PostExternalTransactionResponseBody425{postExternalTransactionResponseBody425Message = postExternalTransactionResponseBody425Message}
-- | > POST /proxy/transactions
-- 
-- The same as 'postExternalTransaction' but accepts an explicit configuration.
postExternalTransactionWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> m (Network.HTTP.Client.Types.Response PostExternalTransactionResponse) -- ^ Monadic computation which returns the result of the operation
postExternalTransactionWithConfiguration config = GHC.Base.fmap (\response_6 -> GHC.Base.fmap (Data.Either.either PostExternalTransactionResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_7 -> Network.HTTP.Types.Status.statusCode status_7 GHC.Classes.== 202) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse202 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                                           PostExternalTransactionResponseBody202)
                                                                                                                                                                                                    | (\status_8 -> Network.HTTP.Types.Status.statusCode status_8 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                                           PostExternalTransactionResponseBody400)
                                                                                                                                                                                                    | (\status_9 -> Network.HTTP.Types.Status.statusCode status_9 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                                           PostExternalTransactionResponseBody406)
                                                                                                                                                                                                    | (\status_10 -> Network.HTTP.Types.Status.statusCode status_10 GHC.Classes.== 415) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse415 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                                             PostExternalTransactionResponseBody415)
                                                                                                                                                                                                    | (\status_11 -> Network.HTTP.Types.Status.statusCode status_11 GHC.Classes.== 425) (Network.HTTP.Client.Types.responseStatus response) -> PostExternalTransactionResponse425 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                                             PostExternalTransactionResponseBody425)
                                                                                                                                                                                                    | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_6) response_6) (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") "/proxy/transactions" GHC.Base.mempty)
-- | > POST /proxy/transactions
-- 
-- The same as 'postExternalTransaction' but returns the raw 'Data.ByteString.ByteString'.
postExternalTransactionRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
postExternalTransactionRaw = GHC.Base.id (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") "/proxy/transactions" GHC.Base.mempty)
-- | > POST /proxy/transactions
-- 
-- The same as 'postExternalTransaction' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
postExternalTransactionWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
postExternalTransactionWithConfigurationRaw config = GHC.Base.id (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") "/proxy/transactions" GHC.Base.mempty)
