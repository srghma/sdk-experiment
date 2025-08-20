-- | This file is auto-generated. Do not edit manually.
module Auth.Client where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Data.Maybe (Maybe(..))
import Data.Either (Either(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Aff (Aff, throwError)
import Effect.Class (liftEffect)
import Foreign.Object (Object)
import Web.File.Blob (Blob)
import JSON as J
import JSON.Object as JO
import Data.Codec.JSON.Common as CJ
import Data.Codec.JSON.Record as CJR
import Data.Codec.JSON.Strict as CJS

-- | The attestation statement format
data AttestationFormat
  = AttestationFormat_Packed
  | AttestationFormat_Tpm
  | AttestationFormat_AndroidKey
  | AttestationFormat_AndroidSafetynet
  | AttestationFormat_FidoU2f
  | AttestationFormat_Apple
  | AttestationFormat_None

derive instance genericAttestationFormat :: Generic AttestationFormat _
derive instance eqAttestationFormat :: Eq AttestationFormat
derive instance ordAttestationFormat :: Ord AttestationFormat

instance showAttestationFormat :: Show AttestationFormat where
  show = genericShow

attestationformatCodec :: CJ.Codec AttestationFormat
attestationformatCodec = CJ.prismaticCodec "AttestationFormat" dec enc CJ.string
  where
    dec = case _ of
      "Packed" -> Just AttestationFormat_Packed
      "Tpm" -> Just AttestationFormat_Tpm
      "AndroidKey" -> Just AttestationFormat_AndroidKey
      "AndroidSafetynet" -> Just AttestationFormat_AndroidSafetynet
      "FidoU2f" -> Just AttestationFormat_FidoU2f
      "Apple" -> Just AttestationFormat_Apple
      "None" -> Just AttestationFormat_None
      _ -> Nothing

    enc = case _ of
      AttestationFormat_Packed -> "Packed"
      AttestationFormat_Tpm -> "Tpm"
      AttestationFormat_AndroidKey -> "AndroidKey"
      AttestationFormat_AndroidSafetynet -> "AndroidSafetynet"
      AttestationFormat_FidoU2f -> "FidoU2f"
      AttestationFormat_Apple -> "Apple"
      AttestationFormat_None -> "None"
-- | Map of extension outputs from the client
-- |
-- | * `appid` (Optional): `Boolean` -
-- | Application identifier extension output
-- | * `credprops` (Optional): `CredentialPropertiesOutput` -
-- | Credential properties extension output
-- | * `hmaccreatesecret` (Optional): `Boolean` -
-- | HMAC secret extension output
type AuthenticationExtensionsClientOutputs =
  {appid :: Maybe (Boolean) --
-- | Application identifier extension output
  , credprops :: Maybe (CredentialPropertiesOutput) --
-- | Credential properties extension output
  , hmaccreatesecret :: Maybe (Boolean) --
-- | HMAC secret extension output
  }

-- JSON instances for AuthenticationExtensionsClientOutputs
instance encodeJsonAuthenticationExtensionsClientOutputs :: EncodeJson AuthenticationExtensionsClientOutputs where
  encodeJson record =
    "appid" := record.appid

    ~> "credprops" := record.credprops

    ~> "hmaccreatesecret" := record.hmaccreatesecret
    ~> jsonEmptyObject

instance decodeJsonAuthenticationExtensionsClientOutputs :: DecodeJson AuthenticationExtensionsClientOutputs where
  decodeJson json = do
    obj <- decodeJson json
    appid <- obj .:? "appid"
    credprops <- obj .:? "credprops"
    hmaccreatesecret <- obj .:? "hmaccreatesecret"
    pure { appid, credprops, hmaccreatesecret }
-- |
-- |
-- | * `clientdatajson`: `String` -
-- | Base64url encoded client data JSON
-- | * `authenticatordata`: `String` -
-- | Base64url encoded authenticator data
-- | * `signature`: `String` -
-- | Base64url encoded assertion signature
-- | * `userhandle` (Optional): `String` -
-- | Base64url encoded user handle
type AuthenticatorAssertionResponse =
  {clientdatajson :: String --
-- | Base64url encoded client data JSON
  , authenticatordata :: String --
-- | Base64url encoded authenticator data
  , signature :: String --
-- | Base64url encoded assertion signature
  , userhandle :: Maybe (String) --
-- | Base64url encoded user handle
  }

-- JSON instances for AuthenticatorAssertionResponse
instance encodeJsonAuthenticatorAssertionResponse :: EncodeJson AuthenticatorAssertionResponse where
  encodeJson record =
    "clientdatajson" := record.clientdatajson

    ~> "authenticatordata" := record.authenticatordata

    ~> "signature" := record.signature

    ~> "userhandle" := record.userhandle
    ~> jsonEmptyObject

instance decodeJsonAuthenticatorAssertionResponse :: DecodeJson AuthenticatorAssertionResponse where
  decodeJson json = do
    obj <- decodeJson json
    clientdatajson <- obj .: "clientdatajson"
    authenticatordata <- obj .: "authenticatordata"
    signature <- obj .: "signature"
    userhandle <- obj .:? "userhandle"
    pure { clientdatajson, authenticatordata, signature, userhandle }

-- | The authenticator attachment modality
data AuthenticatorAttachment
  = AuthenticatorAttachment_Platform
  | AuthenticatorAttachment_CrossPlatform

derive instance genericAuthenticatorAttachment :: Generic AuthenticatorAttachment _
derive instance eqAuthenticatorAttachment :: Eq AuthenticatorAttachment
derive instance ordAuthenticatorAttachment :: Ord AuthenticatorAttachment

instance showAuthenticatorAttachment :: Show AuthenticatorAttachment where
  show = genericShow

authenticatorattachmentCodec :: CJ.Codec AuthenticatorAttachment
authenticatorattachmentCodec = CJ.prismaticCodec "AuthenticatorAttachment" dec enc CJ.string
  where
    dec = case _ of
      "Platform" -> Just AuthenticatorAttachment_Platform
      "CrossPlatform" -> Just AuthenticatorAttachment_CrossPlatform
      _ -> Nothing

    enc = case _ of
      AuthenticatorAttachment_Platform -> "Platform"
      AuthenticatorAttachment_CrossPlatform -> "CrossPlatform"
-- |
-- |
-- | * `clientdatajson`: `String` -
-- | Base64url-encoded binary data
-- | Format: byte
-- | * `transports` (Optional): `Array String` -
-- | The authenticator transports
-- | * `authenticatordata` (Optional): `String` -
-- | Base64url-encoded binary data
-- | Format: byte
-- | * `publickey` (Optional): `String` -
-- | Base64url-encoded binary data
-- | Format: byte
-- | * `publickeyalgorithm` (Optional): `Int` -
-- | The public key algorithm identifier
-- | Format: int64
-- | * `attestationobject`: `String` -
-- | Base64url-encoded binary data
-- | Format: byte
type AuthenticatorAttestationResponse =
  {clientdatajson :: String --
-- | Base64url-encoded binary data
-- | Format: byte
  , transports :: Maybe (Array String) --
-- | The authenticator transports
  , authenticatordata :: Maybe (String) --
-- | Base64url-encoded binary data
-- | Format: byte
  , publickey :: Maybe (String) --
-- | Base64url-encoded binary data
-- | Format: byte
  , publickeyalgorithm :: Maybe (Int) --
-- | The public key algorithm identifier
-- | Format: int64
  , attestationobject :: String --
-- | Base64url-encoded binary data
-- | Format: byte
  }

-- JSON instances for AuthenticatorAttestationResponse
instance encodeJsonAuthenticatorAttestationResponse :: EncodeJson AuthenticatorAttestationResponse where
  encodeJson record =
    "clientdatajson" := record.clientdatajson

    ~> "transports" := record.transports

    ~> "authenticatordata" := record.authenticatordata

    ~> "publickey" := record.publickey

    ~> "publickeyalgorithm" := record.publickeyalgorithm

    ~> "attestationobject" := record.attestationobject
    ~> jsonEmptyObject

instance decodeJsonAuthenticatorAttestationResponse :: DecodeJson AuthenticatorAttestationResponse where
  decodeJson json = do
    obj <- decodeJson json
    clientdatajson <- obj .: "clientdatajson"
    transports <- obj .:? "transports"
    authenticatordata <- obj .:? "authenticatordata"
    publickey <- obj .:? "publickey"
    publickeyalgorithm <- obj .:? "publickeyalgorithm"
    attestationobject <- obj .: "attestationobject"
    pure { clientdatajson, transports, authenticatordata, publickey, publickeyalgorithm, attestationobject }
-- |
-- |
-- | * `authenticatorattachment` (Optional): `AuthenticatorAttachment` -
-- | The authenticator attachment modality
-- | * `requireresidentkey` (Optional): `Boolean` -
-- | Whether the authenticator must create a client-side-resident public key credential source
-- | * `residentkey` (Optional): `ResidentKeyRequirement` -
-- | The resident key requirement
-- | * `userverification` (Optional): `UserVerificationRequirement` -
-- | A requirement for user verification for the operation
type AuthenticatorSelection =
  {authenticatorattachment :: Maybe (AuthenticatorAttachment) --
-- | The authenticator attachment modality
  , requireresidentkey :: Maybe (Boolean) --
-- | Whether the authenticator must create a client-side-resident public key credential source
  , residentkey :: Maybe (ResidentKeyRequirement) --
-- | The resident key requirement
  , userverification :: Maybe (UserVerificationRequirement) --
-- | A requirement for user verification for the operation
  }

-- JSON instances for AuthenticatorSelection
instance encodeJsonAuthenticatorSelection :: EncodeJson AuthenticatorSelection where
  encodeJson record =
    "authenticatorattachment" := record.authenticatorattachment

    ~> "requireresidentkey" := record.requireresidentkey

    ~> "residentkey" := record.residentkey

    ~> "userverification" := record.userverification
    ~> jsonEmptyObject

instance decodeJsonAuthenticatorSelection :: DecodeJson AuthenticatorSelection where
  decodeJson json = do
    obj <- decodeJson json
    authenticatorattachment <- obj .:? "authenticatorattachment"
    requireresidentkey <- obj .:? "requireresidentkey"
    residentkey <- obj .:? "residentkey"
    userverification <- obj .:? "userverification"
    pure { authenticatorattachment, requireresidentkey, residentkey, userverification }

-- | The authenticator transports that can be used
data AuthenticatorTransport
  = AuthenticatorTransport_Usb
  | AuthenticatorTransport_Nfc
  | AuthenticatorTransport_Ble
  | AuthenticatorTransport_SmartCard
  | AuthenticatorTransport_Hybrid
  | AuthenticatorTransport_Internal

derive instance genericAuthenticatorTransport :: Generic AuthenticatorTransport _
derive instance eqAuthenticatorTransport :: Eq AuthenticatorTransport
derive instance ordAuthenticatorTransport :: Ord AuthenticatorTransport

instance showAuthenticatorTransport :: Show AuthenticatorTransport where
  show = genericShow

authenticatortransportCodec :: CJ.Codec AuthenticatorTransport
authenticatortransportCodec = CJ.prismaticCodec "AuthenticatorTransport" dec enc CJ.string
  where
    dec = case _ of
      "Usb" -> Just AuthenticatorTransport_Usb
      "Nfc" -> Just AuthenticatorTransport_Nfc
      "Ble" -> Just AuthenticatorTransport_Ble
      "SmartCard" -> Just AuthenticatorTransport_SmartCard
      "Hybrid" -> Just AuthenticatorTransport_Hybrid
      "Internal" -> Just AuthenticatorTransport_Internal
      _ -> Nothing

    enc = case _ of
      AuthenticatorTransport_Usb -> "Usb"
      AuthenticatorTransport_Nfc -> "Nfc"
      AuthenticatorTransport_Ble -> "Ble"
      AuthenticatorTransport_SmartCard -> "SmartCard"
      AuthenticatorTransport_Hybrid -> "Hybrid"
      AuthenticatorTransport_Internal -> "Internal"

-- | The attestation conveyance preference
data ConveyancePreference
  = ConveyancePreference_None
  | ConveyancePreference_Indirect
  | ConveyancePreference_Direct
  | ConveyancePreference_Enterprise

derive instance genericConveyancePreference :: Generic ConveyancePreference _
derive instance eqConveyancePreference :: Eq ConveyancePreference
derive instance ordConveyancePreference :: Ord ConveyancePreference

instance showConveyancePreference :: Show ConveyancePreference where
  show = genericShow

conveyancepreferenceCodec :: CJ.Codec ConveyancePreference
conveyancepreferenceCodec = CJ.prismaticCodec "ConveyancePreference" dec enc CJ.string
  where
    dec = case _ of
      "None" -> Just ConveyancePreference_None
      "Indirect" -> Just ConveyancePreference_Indirect
      "Direct" -> Just ConveyancePreference_Direct
      "Enterprise" -> Just ConveyancePreference_Enterprise
      _ -> Nothing

    enc = case _ of
      ConveyancePreference_None -> "None"
      ConveyancePreference_Indirect -> "Indirect"
      ConveyancePreference_Direct -> "Direct"
      ConveyancePreference_Enterprise -> "Enterprise"
-- |
-- |
-- | * `expiresat`: `String` -
-- | Expiration date of the PAT
-- | Format: date-time
-- | * `metadata` (Optional): `Object` -
-- | Example: `{"name":"my-pat","used-by":"my-app-cli"}`
type CreatePATRequest =
  {expiresat :: String --
-- | Expiration date of the PAT
-- | Format: date-time
  , metadata :: Maybe (Object) --
-- | Example: `{"name":"my-pat","used-by":"my-app-cli"}`
  }

-- JSON instances for CreatePATRequest
instance encodeJsonCreatePATRequest :: EncodeJson CreatePATRequest where
  encodeJson record =
    "expiresat" := record.expiresat

    ~> "metadata" := record.metadata
    ~> jsonEmptyObject

instance decodeJsonCreatePATRequest :: DecodeJson CreatePATRequest where
  decodeJson json = do
    obj <- decodeJson json
    expiresat <- obj .: "expiresat"
    metadata <- obj .:? "metadata"
    pure { expiresat, metadata }
-- |
-- |
-- | * `id`: `String` -
-- | ID of the PAT
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
-- | * `personalaccesstoken`: `String` -
-- | PAT
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
type CreatePATResponse =
  {id :: String --
-- | ID of the PAT
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
  , personalaccesstoken :: String --
-- | PAT
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
  }

-- JSON instances for CreatePATResponse
instance encodeJsonCreatePATResponse :: EncodeJson CreatePATResponse where
  encodeJson record =
    "id" := record.id

    ~> "personalaccesstoken" := record.personalaccesstoken
    ~> jsonEmptyObject

instance decodeJsonCreatePATResponse :: DecodeJson CreatePATResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .: "id"
    personalaccesstoken <- obj .: "personalaccesstoken"
    pure { id, personalaccesstoken }
-- |
-- |
-- | * `id`: `String` -
-- | The credential's identifier
-- | * `type_`: `String` -
-- | The credential type represented by this object
-- | * `rawid`: `String` -
-- | Base64url-encoded binary data
-- | Format: byte
-- | * `clientextensionresults` (Optional): `AuthenticationExtensionsClientOutputs` -
-- | Map of extension outputs from the client
-- | * `authenticatorattachment` (Optional): `String` -
-- | The authenticator attachment
-- | * `response`: `AuthenticatorAssertionResponse` -
type CredentialAssertionResponse =
  {id :: String --
-- | The credential's identifier
  , type_ :: String --
-- | The credential type represented by this object
  , rawid :: String --
-- | Base64url-encoded binary data
-- | Format: byte
  , clientextensionresults :: Maybe (AuthenticationExtensionsClientOutputs) --
-- | Map of extension outputs from the client
  , authenticatorattachment :: Maybe (String) --
-- | The authenticator attachment
  , response :: AuthenticatorAssertionResponse --
  }

-- JSON instances for CredentialAssertionResponse
instance encodeJsonCredentialAssertionResponse :: EncodeJson CredentialAssertionResponse where
  encodeJson record =
    "id" := record.id

    ~> "type_" := record.type_

    ~> "rawid" := record.rawid

    ~> "clientextensionresults" := record.clientextensionresults

    ~> "authenticatorattachment" := record.authenticatorattachment

    ~> "response" := record.response
    ~> jsonEmptyObject

instance decodeJsonCredentialAssertionResponse :: DecodeJson CredentialAssertionResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .: "id"
    type_ <- obj .: "type_"
    rawid <- obj .: "rawid"
    clientextensionresults <- obj .:? "clientextensionresults"
    authenticatorattachment <- obj .:? "authenticatorattachment"
    response <- obj .: "response"
    pure { id, type_, rawid, clientextensionresults, authenticatorattachment, response }
-- |
-- |
-- | * `id`: `String` -
-- | The credential's identifier
-- | * `type_`: `String` -
-- | The credential type represented by this object
-- | * `rawid`: `String` -
-- | Base64url-encoded binary data
-- | Format: byte
-- | * `clientextensionresults` (Optional): `AuthenticationExtensionsClientOutputs` -
-- | Map of extension outputs from the client
-- | * `authenticatorattachment` (Optional): `String` -
-- | The authenticator attachment
-- | * `response`: `AuthenticatorAttestationResponse` -
type CredentialCreationResponse =
  {id :: String --
-- | The credential's identifier
  , type_ :: String --
-- | The credential type represented by this object
  , rawid :: String --
-- | Base64url-encoded binary data
-- | Format: byte
  , clientextensionresults :: Maybe (AuthenticationExtensionsClientOutputs) --
-- | Map of extension outputs from the client
  , authenticatorattachment :: Maybe (String) --
-- | The authenticator attachment
  , response :: AuthenticatorAttestationResponse --
  }

-- JSON instances for CredentialCreationResponse
instance encodeJsonCredentialCreationResponse :: EncodeJson CredentialCreationResponse where
  encodeJson record =
    "id" := record.id

    ~> "type_" := record.type_

    ~> "rawid" := record.rawid

    ~> "clientextensionresults" := record.clientextensionresults

    ~> "authenticatorattachment" := record.authenticatorattachment

    ~> "response" := record.response
    ~> jsonEmptyObject

instance decodeJsonCredentialCreationResponse :: DecodeJson CredentialCreationResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .: "id"
    type_ <- obj .: "type_"
    rawid <- obj .: "rawid"
    clientextensionresults <- obj .:? "clientextensionresults"
    authenticatorattachment <- obj .:? "authenticatorattachment"
    response <- obj .: "response"
    pure { id, type_, rawid, clientextensionresults, authenticatorattachment, response }
-- |
-- |
-- | * `type_`: `CredentialType` -
-- | The valid credential types
-- | * `alg`: `Int` -
-- | The cryptographic algorithm identifier
type CredentialParameter =
  {type_ :: CredentialType --
-- | The valid credential types
  , alg :: Int --
-- | The cryptographic algorithm identifier
  }

-- JSON instances for CredentialParameter
instance encodeJsonCredentialParameter :: EncodeJson CredentialParameter where
  encodeJson record =
    "type_" := record.type_

    ~> "alg" := record.alg
    ~> jsonEmptyObject

instance decodeJsonCredentialParameter :: DecodeJson CredentialParameter where
  decodeJson json = do
    obj <- decodeJson json
    type_ <- obj .: "type_"
    alg <- obj .: "alg"
    pure { type_, alg }
-- | Credential properties extension output
-- |
-- | * `rk` (Optional): `Boolean` -
-- | Indicates if the credential is a resident key
type CredentialPropertiesOutput =
  {rk :: Maybe (Boolean) --
-- | Indicates if the credential is a resident key
  }

-- JSON instances for CredentialPropertiesOutput
instance encodeJsonCredentialPropertiesOutput :: EncodeJson CredentialPropertiesOutput where
  encodeJson record =
    "rk" := record.rk
    ~> jsonEmptyObject

instance decodeJsonCredentialPropertiesOutput :: DecodeJson CredentialPropertiesOutput where
  decodeJson json = do
    obj <- decodeJson json
    rk <- obj .:? "rk"
    pure { rk }

-- | The valid credential types
data CredentialType
  = CredentialType_PublicKey

derive instance genericCredentialType :: Generic CredentialType _
derive instance eqCredentialType :: Eq CredentialType
derive instance ordCredentialType :: Ord CredentialType

instance showCredentialType :: Show CredentialType where
  show = genericShow

credentialtypeCodec :: CJ.Codec CredentialType
credentialtypeCodec = CJ.prismaticCodec "CredentialType" dec enc CJ.string
  where
    dec = case _ of
      "PublicKey" -> Just CredentialType_PublicKey
      _ -> Nothing

    enc = case _ of
      CredentialType_PublicKey -> "PublicKey"

-- | Error code identifying the specific application error
data ErrorResponseError
  = ErrorResponseError_DefaultRoleMustBeInAllowedRoles
  | ErrorResponseError_DisabledEndpoint
  | ErrorResponseError_DisabledUser
  | ErrorResponseError_EmailAlreadyInUse
  | ErrorResponseError_EmailAlreadyVerified
  | ErrorResponseError_ForbiddenAnonymous
  | ErrorResponseError_InternalServerError
  | ErrorResponseError_InvalidEmailPassword
  | ErrorResponseError_InvalidRequest
  | ErrorResponseError_LocaleNotAllowed
  | ErrorResponseError_PasswordTooShort
  | ErrorResponseError_PasswordInHibpDatabase
  | ErrorResponseError_RedirectToNotAllowed
  | ErrorResponseError_RoleNotAllowed
  | ErrorResponseError_SignupDisabled
  | ErrorResponseError_UnverifiedUser
  | ErrorResponseError_UserNotAnonymous
  | ErrorResponseError_InvalidPat
  | ErrorResponseError_InvalidRefreshToken
  | ErrorResponseError_InvalidTicket
  | ErrorResponseError_DisabledMfaTotp
  | ErrorResponseError_NoTotpSecret
  | ErrorResponseError_InvalidTotp
  | ErrorResponseError_MfaTypeNotFound
  | ErrorResponseError_TotpAlreadyActive
  | ErrorResponseError_InvalidState
  | ErrorResponseError_OauthTokenEchangeFailed
  | ErrorResponseError_OauthProfileFetchFailed
  | ErrorResponseError_OauthProviderError
  | ErrorResponseError_InvalidOtp
  | ErrorResponseError_CannotSendSms

derive instance genericErrorResponseError :: Generic ErrorResponseError _
derive instance eqErrorResponseError :: Eq ErrorResponseError
derive instance ordErrorResponseError :: Ord ErrorResponseError

instance showErrorResponseError :: Show ErrorResponseError where
  show = genericShow

errorresponseerrorCodec :: CJ.Codec ErrorResponseError
errorresponseerrorCodec = CJ.prismaticCodec "ErrorResponseError" dec enc CJ.string
  where
    dec = case _ of
      "DefaultRoleMustBeInAllowedRoles" -> Just ErrorResponseError_DefaultRoleMustBeInAllowedRoles
      "DisabledEndpoint" -> Just ErrorResponseError_DisabledEndpoint
      "DisabledUser" -> Just ErrorResponseError_DisabledUser
      "EmailAlreadyInUse" -> Just ErrorResponseError_EmailAlreadyInUse
      "EmailAlreadyVerified" -> Just ErrorResponseError_EmailAlreadyVerified
      "ForbiddenAnonymous" -> Just ErrorResponseError_ForbiddenAnonymous
      "InternalServerError" -> Just ErrorResponseError_InternalServerError
      "InvalidEmailPassword" -> Just ErrorResponseError_InvalidEmailPassword
      "InvalidRequest" -> Just ErrorResponseError_InvalidRequest
      "LocaleNotAllowed" -> Just ErrorResponseError_LocaleNotAllowed
      "PasswordTooShort" -> Just ErrorResponseError_PasswordTooShort
      "PasswordInHibpDatabase" -> Just ErrorResponseError_PasswordInHibpDatabase
      "RedirectToNotAllowed" -> Just ErrorResponseError_RedirectToNotAllowed
      "RoleNotAllowed" -> Just ErrorResponseError_RoleNotAllowed
      "SignupDisabled" -> Just ErrorResponseError_SignupDisabled
      "UnverifiedUser" -> Just ErrorResponseError_UnverifiedUser
      "UserNotAnonymous" -> Just ErrorResponseError_UserNotAnonymous
      "InvalidPat" -> Just ErrorResponseError_InvalidPat
      "InvalidRefreshToken" -> Just ErrorResponseError_InvalidRefreshToken
      "InvalidTicket" -> Just ErrorResponseError_InvalidTicket
      "DisabledMfaTotp" -> Just ErrorResponseError_DisabledMfaTotp
      "NoTotpSecret" -> Just ErrorResponseError_NoTotpSecret
      "InvalidTotp" -> Just ErrorResponseError_InvalidTotp
      "MfaTypeNotFound" -> Just ErrorResponseError_MfaTypeNotFound
      "TotpAlreadyActive" -> Just ErrorResponseError_TotpAlreadyActive
      "InvalidState" -> Just ErrorResponseError_InvalidState
      "OauthTokenEchangeFailed" -> Just ErrorResponseError_OauthTokenEchangeFailed
      "OauthProfileFetchFailed" -> Just ErrorResponseError_OauthProfileFetchFailed
      "OauthProviderError" -> Just ErrorResponseError_OauthProviderError
      "InvalidOtp" -> Just ErrorResponseError_InvalidOtp
      "CannotSendSms" -> Just ErrorResponseError_CannotSendSms
      _ -> Nothing

    enc = case _ of
      ErrorResponseError_DefaultRoleMustBeInAllowedRoles -> "DefaultRoleMustBeInAllowedRoles"
      ErrorResponseError_DisabledEndpoint -> "DisabledEndpoint"
      ErrorResponseError_DisabledUser -> "DisabledUser"
      ErrorResponseError_EmailAlreadyInUse -> "EmailAlreadyInUse"
      ErrorResponseError_EmailAlreadyVerified -> "EmailAlreadyVerified"
      ErrorResponseError_ForbiddenAnonymous -> "ForbiddenAnonymous"
      ErrorResponseError_InternalServerError -> "InternalServerError"
      ErrorResponseError_InvalidEmailPassword -> "InvalidEmailPassword"
      ErrorResponseError_InvalidRequest -> "InvalidRequest"
      ErrorResponseError_LocaleNotAllowed -> "LocaleNotAllowed"
      ErrorResponseError_PasswordTooShort -> "PasswordTooShort"
      ErrorResponseError_PasswordInHibpDatabase -> "PasswordInHibpDatabase"
      ErrorResponseError_RedirectToNotAllowed -> "RedirectToNotAllowed"
      ErrorResponseError_RoleNotAllowed -> "RoleNotAllowed"
      ErrorResponseError_SignupDisabled -> "SignupDisabled"
      ErrorResponseError_UnverifiedUser -> "UnverifiedUser"
      ErrorResponseError_UserNotAnonymous -> "UserNotAnonymous"
      ErrorResponseError_InvalidPat -> "InvalidPat"
      ErrorResponseError_InvalidRefreshToken -> "InvalidRefreshToken"
      ErrorResponseError_InvalidTicket -> "InvalidTicket"
      ErrorResponseError_DisabledMfaTotp -> "DisabledMfaTotp"
      ErrorResponseError_NoTotpSecret -> "NoTotpSecret"
      ErrorResponseError_InvalidTotp -> "InvalidTotp"
      ErrorResponseError_MfaTypeNotFound -> "MfaTypeNotFound"
      ErrorResponseError_TotpAlreadyActive -> "TotpAlreadyActive"
      ErrorResponseError_InvalidState -> "InvalidState"
      ErrorResponseError_OauthTokenEchangeFailed -> "OauthTokenEchangeFailed"
      ErrorResponseError_OauthProfileFetchFailed -> "OauthProfileFetchFailed"
      ErrorResponseError_OauthProviderError -> "OauthProviderError"
      ErrorResponseError_InvalidOtp -> "InvalidOtp"
      ErrorResponseError_CannotSendSms -> "CannotSendSms"
-- | Standardized error response
-- |
-- | * `status`: `Int` -
-- | HTTP status error code
-- | Example: `400`
-- | * `message`: `String` -
-- | Human-friendly error message
-- | Example: `"Invalid email format"`
-- | * `error`: `ErrorResponseError` -
-- | Error code identifying the specific application error
type ErrorResponse =
  {status :: Int --
-- | HTTP status error code
-- | Example: `400`
  , message :: String --
-- | Human-friendly error message
-- | Example: `"Invalid email format"`
  , error :: ErrorResponseError --
-- | Error code identifying the specific application error
  }

-- JSON instances for ErrorResponse
instance encodeJsonErrorResponse :: EncodeJson ErrorResponse where
  encodeJson record =
    "status" := record.status

    ~> "message" := record.message

    ~> "error" := record.error
    ~> jsonEmptyObject

instance decodeJsonErrorResponse :: DecodeJson ErrorResponse where
  decodeJson json = do
    obj <- decodeJson json
    status <- obj .: "status"
    message <- obj .: "message"
    error <- obj .: "error"
    pure { status, message, error }

data IdTokenProvider
  = IdTokenProvider_Apple
  | IdTokenProvider_Google

derive instance genericIdTokenProvider :: Generic IdTokenProvider _
derive instance eqIdTokenProvider :: Eq IdTokenProvider
derive instance ordIdTokenProvider :: Ord IdTokenProvider

instance showIdTokenProvider :: Show IdTokenProvider where
  show = genericShow

idtokenproviderCodec :: CJ.Codec IdTokenProvider
idtokenproviderCodec = CJ.prismaticCodec "IdTokenProvider" dec enc CJ.string
  where
    dec = case _ of
      "Apple" -> Just IdTokenProvider_Apple
      "Google" -> Just IdTokenProvider_Google
      _ -> Nothing

    enc = case _ of
      IdTokenProvider_Apple -> "Apple"
      IdTokenProvider_Google -> "Google"
-- | JSON Web Key for JWT verification
-- |
-- | * `alg`: `String` -
-- | Algorithm used with this key
-- | Example: `"RS256"`
-- | * `e`: `String` -
-- | RSA public exponent
-- | Example: `"AQAB"`
-- | * `kid`: `String` -
-- | Key ID
-- | Example: `"key-id-1"`
-- | * `kty`: `String` -
-- | Key type
-- | Example: `"RSA"`
-- | * `n`: `String` -
-- | RSA modulus
-- | Example: `"abcd1234..."`
-- | * `use`: `String` -
-- | Key usage
-- | Example: `"sig"`
type JWK =
  {alg :: String --
-- | Algorithm used with this key
-- | Example: `"RS256"`
  , e :: String --
-- | RSA public exponent
-- | Example: `"AQAB"`
  , kid :: String --
-- | Key ID
-- | Example: `"key-id-1"`
  , kty :: String --
-- | Key type
-- | Example: `"RSA"`
  , n :: String --
-- | RSA modulus
-- | Example: `"abcd1234..."`
  , use :: String --
-- | Key usage
-- | Example: `"sig"`
  }

-- JSON instances for JWK
instance encodeJsonJWK :: EncodeJson JWK where
  encodeJson record =
    "alg" := record.alg

    ~> "e" := record.e

    ~> "kid" := record.kid

    ~> "kty" := record.kty

    ~> "n" := record.n

    ~> "use" := record.use
    ~> jsonEmptyObject

instance decodeJsonJWK :: DecodeJson JWK where
  decodeJson json = do
    obj <- decodeJson json
    alg <- obj .: "alg"
    e <- obj .: "e"
    kid <- obj .: "kid"
    kty <- obj .: "kty"
    n <- obj .: "n"
    use <- obj .: "use"
    pure { alg, e, kid, kty, n, use }
-- | JSON Web Key Set for verifying JWT signatures
-- |
-- | * `keys`: `Array JWK` -
-- | Array of public keys
type JWKSet =
  {keys :: Array JWK --
-- | Array of public keys
  }

-- JSON instances for JWKSet
instance encodeJsonJWKSet :: EncodeJson JWKSet where
  encodeJson record =
    "keys" := record.keys
    ~> jsonEmptyObject

instance decodeJsonJWKSet :: DecodeJson JWKSet where
  decodeJson json = do
    obj <- decodeJson json
    keys <- obj .: "keys"
    pure { keys }
-- |
-- |
-- | * `provider`: `IdTokenProvider` -
-- | * `idtoken`: `String` -
-- | Apple ID token
-- | * `nonce` (Optional): `String` -
-- | Nonce used during sign in process
type LinkIdTokenRequest =
  {provider :: IdTokenProvider --
  , idtoken :: String --
-- | Apple ID token
  , nonce :: Maybe (String) --
-- | Nonce used during sign in process
  }

-- JSON instances for LinkIdTokenRequest
instance encodeJsonLinkIdTokenRequest :: EncodeJson LinkIdTokenRequest where
  encodeJson record =
    "provider" := record.provider

    ~> "idtoken" := record.idtoken

    ~> "nonce" := record.nonce
    ~> jsonEmptyObject

instance decodeJsonLinkIdTokenRequest :: DecodeJson LinkIdTokenRequest where
  decodeJson json = do
    obj <- decodeJson json
    provider <- obj .: "provider"
    idtoken <- obj .: "idtoken"
    nonce <- obj .:? "nonce"
    pure { provider, idtoken, nonce }
-- | Challenge payload for multi-factor authentication
-- |
-- | * `ticket`: `String` -
-- | Ticket to use when completing the MFA challenge
-- | Example: `"mfaTotp:abc123def456"`
type MFAChallengePayload =
  {ticket :: String --
-- | Ticket to use when completing the MFA challenge
-- | Example: `"mfaTotp:abc123def456"`
  }

-- JSON instances for MFAChallengePayload
instance encodeJsonMFAChallengePayload :: EncodeJson MFAChallengePayload where
  encodeJson record =
    "ticket" := record.ticket
    ~> jsonEmptyObject

instance decodeJsonMFAChallengePayload :: DecodeJson MFAChallengePayload where
  decodeJson json = do
    obj <- decodeJson json
    ticket <- obj .: "ticket"
    pure { ticket }

data OKResponse
  = OKResponse_OK

derive instance genericOKResponse :: Generic OKResponse _
derive instance eqOKResponse :: Eq OKResponse
derive instance ordOKResponse :: Ord OKResponse

instance showOKResponse :: Show OKResponse where
  show = genericShow

okresponseCodec :: CJ.Codec OKResponse
okresponseCodec = CJ.prismaticCodec "OKResponse" dec enc CJ.string
  where
    dec = case _ of
      "OK" -> Just OKResponse_OK
      _ -> Nothing

    enc = case _ of
      OKResponse_OK -> "OK"
-- |
-- |
-- | * `redirectto` (Optional): `String` -
-- | Example: `"https://my-app.com/catch-redirection"`
-- | Format: uri
type OptionsRedirectTo =
  {redirectto :: Maybe (String) --
-- | Example: `"https://my-app.com/catch-redirection"`
-- | Format: uri
  }

-- JSON instances for OptionsRedirectTo
instance encodeJsonOptionsRedirectTo :: EncodeJson OptionsRedirectTo where
  encodeJson record =
    "redirectto" := record.redirectto
    ~> jsonEmptyObject

instance decodeJsonOptionsRedirectTo :: DecodeJson OptionsRedirectTo where
  decodeJson json = do
    obj <- decodeJson json
    redirectto <- obj .:? "redirectto"
    pure { redirectto }
-- |
-- |
-- | * `rp`: `RelyingPartyEntity` -
-- | * `user`: `UserEntity` -
-- | * `challenge`: `String` -
-- | Base64url-encoded binary data
-- | Format: byte
-- | * `pubkeycredparams`: `Array CredentialParameter` -
-- | The desired credential types and their respective cryptographic parameters
-- | * `timeout` (Optional): `Int` -
-- | A time, in milliseconds, that the caller is willing to wait for the call to complete
-- | * `excludecredentials` (Optional): `Array PublicKeyCredentialDescriptor` -
-- | A list of PublicKeyCredentialDescriptor objects representing public key credentials that are not acceptable to the caller
-- | * `authenticatorselection` (Optional): `AuthenticatorSelection` -
-- | * `hints` (Optional): `Array PublicKeyCredentialHints` -
-- | Hints to help guide the user through the experience
-- | * `attestation` (Optional): `ConveyancePreference` -
-- | The attestation conveyance preference
-- | * `attestationformats` (Optional): `Array AttestationFormat` -
-- | The preferred attestation statement formats
-- | * `extensions` (Optional): `Object` -
-- | Additional parameters requesting additional processing by the client and authenticator
type PublicKeyCredentialCreationOptions =
  {rp :: RelyingPartyEntity --
  , user :: UserEntity --
  , challenge :: String --
-- | Base64url-encoded binary data
-- | Format: byte
  , pubkeycredparams :: Array CredentialParameter --
-- | The desired credential types and their respective cryptographic parameters
  , timeout :: Maybe (Int) --
-- | A time, in milliseconds, that the caller is willing to wait for the call to complete
  , excludecredentials :: Maybe (Array PublicKeyCredentialDescriptor) --
-- | A list of PublicKeyCredentialDescriptor objects representing public key credentials that are not acceptable to the caller
  , authenticatorselection :: Maybe (AuthenticatorSelection) --
  , hints :: Maybe (Array PublicKeyCredentialHints) --
-- | Hints to help guide the user through the experience
  , attestation :: Maybe (ConveyancePreference) --
-- | The attestation conveyance preference
  , attestationformats :: Maybe (Array AttestationFormat) --
-- | The preferred attestation statement formats
  , extensions :: Maybe (Object) --
-- | Additional parameters requesting additional processing by the client and authenticator
  }

-- JSON instances for PublicKeyCredentialCreationOptions
instance encodeJsonPublicKeyCredentialCreationOptions :: EncodeJson PublicKeyCredentialCreationOptions where
  encodeJson record =
    "rp" := record.rp

    ~> "user" := record.user

    ~> "challenge" := record.challenge

    ~> "pubkeycredparams" := record.pubkeycredparams

    ~> "timeout" := record.timeout

    ~> "excludecredentials" := record.excludecredentials

    ~> "authenticatorselection" := record.authenticatorselection

    ~> "hints" := record.hints

    ~> "attestation" := record.attestation

    ~> "attestationformats" := record.attestationformats

    ~> "extensions" := record.extensions
    ~> jsonEmptyObject

instance decodeJsonPublicKeyCredentialCreationOptions :: DecodeJson PublicKeyCredentialCreationOptions where
  decodeJson json = do
    obj <- decodeJson json
    rp <- obj .: "rp"
    user <- obj .: "user"
    challenge <- obj .: "challenge"
    pubkeycredparams <- obj .: "pubkeycredparams"
    timeout <- obj .:? "timeout"
    excludecredentials <- obj .:? "excludecredentials"
    authenticatorselection <- obj .:? "authenticatorselection"
    hints <- obj .:? "hints"
    attestation <- obj .:? "attestation"
    attestationformats <- obj .:? "attestationformats"
    extensions <- obj .:? "extensions"
    pure { rp, user, challenge, pubkeycredparams, timeout, excludecredentials, authenticatorselection, hints, attestation, attestationformats, extensions }
-- |
-- |
-- | * `type_`: `CredentialType` -
-- | The valid credential types
-- | * `id`: `String` -
-- | Base64url-encoded binary data
-- | Format: byte
-- | * `transports` (Optional): `Array AuthenticatorTransport` -
-- | The authenticator transports that can be used
type PublicKeyCredentialDescriptor =
  {type_ :: CredentialType --
-- | The valid credential types
  , id :: String --
-- | Base64url-encoded binary data
-- | Format: byte
  , transports :: Maybe (Array AuthenticatorTransport) --
-- | The authenticator transports that can be used
  }

-- JSON instances for PublicKeyCredentialDescriptor
instance encodeJsonPublicKeyCredentialDescriptor :: EncodeJson PublicKeyCredentialDescriptor where
  encodeJson record =
    "type_" := record.type_

    ~> "id" := record.id

    ~> "transports" := record.transports
    ~> jsonEmptyObject

instance decodeJsonPublicKeyCredentialDescriptor :: DecodeJson PublicKeyCredentialDescriptor where
  decodeJson json = do
    obj <- decodeJson json
    type_ <- obj .: "type_"
    id <- obj .: "id"
    transports <- obj .:? "transports"
    pure { type_, id, transports }

-- | Hints to help guide the user through the experience
data PublicKeyCredentialHints
  = PublicKeyCredentialHints_SecurityKey
  | PublicKeyCredentialHints_ClientDevice
  | PublicKeyCredentialHints_Hybrid

derive instance genericPublicKeyCredentialHints :: Generic PublicKeyCredentialHints _
derive instance eqPublicKeyCredentialHints :: Eq PublicKeyCredentialHints
derive instance ordPublicKeyCredentialHints :: Ord PublicKeyCredentialHints

instance showPublicKeyCredentialHints :: Show PublicKeyCredentialHints where
  show = genericShow

publickeycredentialhintsCodec :: CJ.Codec PublicKeyCredentialHints
publickeycredentialhintsCodec = CJ.prismaticCodec "PublicKeyCredentialHints" dec enc CJ.string
  where
    dec = case _ of
      "SecurityKey" -> Just PublicKeyCredentialHints_SecurityKey
      "ClientDevice" -> Just PublicKeyCredentialHints_ClientDevice
      "Hybrid" -> Just PublicKeyCredentialHints_Hybrid
      _ -> Nothing

    enc = case _ of
      PublicKeyCredentialHints_SecurityKey -> "SecurityKey"
      PublicKeyCredentialHints_ClientDevice -> "ClientDevice"
      PublicKeyCredentialHints_Hybrid -> "Hybrid"
-- |
-- |
-- | * `challenge`: `String` -
-- | Base64url-encoded binary data
-- | Format: byte
-- | * `timeout` (Optional): `Int` -
-- | A time, in milliseconds, that the caller is willing to wait for the call to complete
-- | * `rpid` (Optional): `String` -
-- | The RP ID the credential should be scoped to
-- | * `allowcredentials` (Optional): `Array PublicKeyCredentialDescriptor` -
-- | A list of CredentialDescriptor objects representing public key credentials acceptable to the caller
-- | * `userverification` (Optional): `UserVerificationRequirement` -
-- | A requirement for user verification for the operation
-- | * `hints` (Optional): `Array PublicKeyCredentialHints` -
-- | Hints to help guide the user through the experience
-- | * `extensions` (Optional): `Object` -
-- | Additional parameters requesting additional processing by the client and authenticator
type PublicKeyCredentialRequestOptions =
  {challenge :: String --
-- | Base64url-encoded binary data
-- | Format: byte
  , timeout :: Maybe (Int) --
-- | A time, in milliseconds, that the caller is willing to wait for the call to complete
  , rpid :: Maybe (String) --
-- | The RP ID the credential should be scoped to
  , allowcredentials :: Maybe (Array PublicKeyCredentialDescriptor) --
-- | A list of CredentialDescriptor objects representing public key credentials acceptable to the caller
  , userverification :: Maybe (UserVerificationRequirement) --
-- | A requirement for user verification for the operation
  , hints :: Maybe (Array PublicKeyCredentialHints) --
-- | Hints to help guide the user through the experience
  , extensions :: Maybe (Object) --
-- | Additional parameters requesting additional processing by the client and authenticator
  }

-- JSON instances for PublicKeyCredentialRequestOptions
instance encodeJsonPublicKeyCredentialRequestOptions :: EncodeJson PublicKeyCredentialRequestOptions where
  encodeJson record =
    "challenge" := record.challenge

    ~> "timeout" := record.timeout

    ~> "rpid" := record.rpid

    ~> "allowcredentials" := record.allowcredentials

    ~> "userverification" := record.userverification

    ~> "hints" := record.hints

    ~> "extensions" := record.extensions
    ~> jsonEmptyObject

instance decodeJsonPublicKeyCredentialRequestOptions :: DecodeJson PublicKeyCredentialRequestOptions where
  decodeJson json = do
    obj <- decodeJson json
    challenge <- obj .: "challenge"
    timeout <- obj .:? "timeout"
    rpid <- obj .:? "rpid"
    allowcredentials <- obj .:? "allowcredentials"
    userverification <- obj .:? "userverification"
    hints <- obj .:? "hints"
    extensions <- obj .:? "extensions"
    pure { challenge, timeout, rpid, allowcredentials, userverification, hints, extensions }
-- | Request to refresh an access token
-- |
-- | * `refreshtoken`: `String` -
-- | Refresh token used to generate a new access token
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
type RefreshTokenRequest =
  {refreshtoken :: String --
-- | Refresh token used to generate a new access token
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
  }

-- JSON instances for RefreshTokenRequest
instance encodeJsonRefreshTokenRequest :: EncodeJson RefreshTokenRequest where
  encodeJson record =
    "refreshtoken" := record.refreshtoken
    ~> jsonEmptyObject

instance decodeJsonRefreshTokenRequest :: DecodeJson RefreshTokenRequest where
  decodeJson json = do
    obj <- decodeJson json
    refreshtoken <- obj .: "refreshtoken"
    pure { refreshtoken }
-- |
-- |
-- | * `name`: `String` -
-- | A human-palatable name for the entity
-- | * `id`: `String` -
-- | A unique identifier for the Relying Party entity, which sets the RP ID
type RelyingPartyEntity =
  {name :: String --
-- | A human-palatable name for the entity
  , id :: String --
-- | A unique identifier for the Relying Party entity, which sets the RP ID
  }

-- JSON instances for RelyingPartyEntity
instance encodeJsonRelyingPartyEntity :: EncodeJson RelyingPartyEntity where
  encodeJson record =
    "name" := record.name

    ~> "id" := record.id
    ~> jsonEmptyObject

instance decodeJsonRelyingPartyEntity :: DecodeJson RelyingPartyEntity where
  decodeJson json = do
    obj <- decodeJson json
    name <- obj .: "name"
    id <- obj .: "id"
    pure { name, id }

-- | The resident key requirement
data ResidentKeyRequirement
  = ResidentKeyRequirement_Discouraged
  | ResidentKeyRequirement_Preferred
  | ResidentKeyRequirement_Required

derive instance genericResidentKeyRequirement :: Generic ResidentKeyRequirement _
derive instance eqResidentKeyRequirement :: Eq ResidentKeyRequirement
derive instance ordResidentKeyRequirement :: Ord ResidentKeyRequirement

instance showResidentKeyRequirement :: Show ResidentKeyRequirement where
  show = genericShow

residentkeyrequirementCodec :: CJ.Codec ResidentKeyRequirement
residentkeyrequirementCodec = CJ.prismaticCodec "ResidentKeyRequirement" dec enc CJ.string
  where
    dec = case _ of
      "Discouraged" -> Just ResidentKeyRequirement_Discouraged
      "Preferred" -> Just ResidentKeyRequirement_Preferred
      "Required" -> Just ResidentKeyRequirement_Required
      _ -> Nothing

    enc = case _ of
      ResidentKeyRequirement_Discouraged -> "Discouraged"
      ResidentKeyRequirement_Preferred -> "Preferred"
      ResidentKeyRequirement_Required -> "Required"
-- | User authentication session containing tokens and user information
-- |
-- | * `accesstoken`: `String` -
-- | JWT token for authenticating API requests
-- | Example: `"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."`
-- | * `accesstokenexpiresin`: `Int` -
-- | Expiration time of the access token in seconds
-- | Example: `900`
-- | Format: int64
-- | * `refreshtokenid`: `String` -
-- | Identifier for the refresh token
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
-- | * `refreshtoken`: `String` -
-- | Token used to refresh the access token
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
-- | * `user` (Optional): `User` -
-- | User profile and account information
type Session =
  {accesstoken :: String --
-- | JWT token for authenticating API requests
-- | Example: `"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."`
  , accesstokenexpiresin :: Int --
-- | Expiration time of the access token in seconds
-- | Example: `900`
-- | Format: int64
  , refreshtokenid :: String --
-- | Identifier for the refresh token
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
  , refreshtoken :: String --
-- | Token used to refresh the access token
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
  , user :: Maybe (User) --
-- | User profile and account information
  }

-- JSON instances for Session
instance encodeJsonSession :: EncodeJson Session where
  encodeJson record =
    "accesstoken" := record.accesstoken

    ~> "accesstokenexpiresin" := record.accesstokenexpiresin

    ~> "refreshtokenid" := record.refreshtokenid

    ~> "refreshtoken" := record.refreshtoken

    ~> "user" := record.user
    ~> jsonEmptyObject

instance decodeJsonSession :: DecodeJson Session where
  decodeJson json = do
    obj <- decodeJson json
    accesstoken <- obj .: "accesstoken"
    accesstokenexpiresin <- obj .: "accesstokenexpiresin"
    refreshtokenid <- obj .: "refreshtokenid"
    refreshtoken <- obj .: "refreshtoken"
    user <- obj .:? "user"
    pure { accesstoken, accesstokenexpiresin, refreshtokenid, refreshtoken, user }
-- | Container for session information
-- |
-- | * `session` (Optional): `Session` -
-- | User authentication session containing tokens and user information
type SessionPayload =
  {session :: Maybe (Session) --
-- | User authentication session containing tokens and user information
  }

-- JSON instances for SessionPayload
instance encodeJsonSessionPayload :: EncodeJson SessionPayload where
  encodeJson record =
    "session" := record.session
    ~> jsonEmptyObject

instance decodeJsonSessionPayload :: DecodeJson SessionPayload where
  decodeJson json = do
    obj <- decodeJson json
    session <- obj .:? "session"
    pure { session }
-- |
-- |
-- | * `displayname` (Optional): `String` -
-- | Example: `"John Smith"`
-- | * `locale` (Optional): `String` -
-- | A two-characters locale
-- | Example: `"en"`
-- | MinLength: 2
-- | MaxLength: 2
-- | * `metadata` (Optional): `Object` -
-- | Example: `{"firstName":"John","lastName":"Smith"}`
type SignInAnonymousRequest =
  {displayname :: Maybe (String) --
-- | Example: `"John Smith"`
  , locale :: Maybe (String) --
-- | A two-characters locale
-- | Example: `"en"`
-- | MinLength: 2
-- | MaxLength: 2
  , metadata :: Maybe (Object) --
-- | Example: `{"firstName":"John","lastName":"Smith"}`
  }

-- JSON instances for SignInAnonymousRequest
instance encodeJsonSignInAnonymousRequest :: EncodeJson SignInAnonymousRequest where
  encodeJson record =
    "displayname" := record.displayname

    ~> "locale" := record.locale

    ~> "metadata" := record.metadata
    ~> jsonEmptyObject

instance decodeJsonSignInAnonymousRequest :: DecodeJson SignInAnonymousRequest where
  decodeJson json = do
    obj <- decodeJson json
    displayname <- obj .:? "displayname"
    locale <- obj .:? "locale"
    metadata <- obj .:? "metadata"
    pure { displayname, locale, metadata }
-- | Request to authenticate using email and password
-- |
-- | * `email`: `String` -
-- | User's email address
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `password`: `String` -
-- | User's password
-- | Example: `"Str0ngPassw#ord-94|%"`
-- | MinLength: 3
-- | MaxLength: 50
type SignInEmailPasswordRequest =
  {email :: String --
-- | User's email address
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , password :: String --
-- | User's password
-- | Example: `"Str0ngPassw#ord-94|%"`
-- | MinLength: 3
-- | MaxLength: 50
  }

-- JSON instances for SignInEmailPasswordRequest
instance encodeJsonSignInEmailPasswordRequest :: EncodeJson SignInEmailPasswordRequest where
  encodeJson record =
    "email" := record.email

    ~> "password" := record.password
    ~> jsonEmptyObject

instance decodeJsonSignInEmailPasswordRequest :: DecodeJson SignInEmailPasswordRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .: "email"
    password <- obj .: "password"
    pure { email, password }
-- | Response for email-password authentication that may include a session or MFA challenge
-- |
-- | * `session` (Optional): `Session` -
-- | User authentication session containing tokens and user information
-- | * `mfa` (Optional): `MFAChallengePayload` -
-- | Challenge payload for multi-factor authentication
type SignInEmailPasswordResponse =
  {session :: Maybe (Session) --
-- | User authentication session containing tokens and user information
  , mfa :: Maybe (MFAChallengePayload) --
-- | Challenge payload for multi-factor authentication
  }

-- JSON instances for SignInEmailPasswordResponse
instance encodeJsonSignInEmailPasswordResponse :: EncodeJson SignInEmailPasswordResponse where
  encodeJson record =
    "session" := record.session

    ~> "mfa" := record.mfa
    ~> jsonEmptyObject

instance decodeJsonSignInEmailPasswordResponse :: DecodeJson SignInEmailPasswordResponse where
  decodeJson json = do
    obj <- decodeJson json
    session <- obj .:? "session"
    mfa <- obj .:? "mfa"
    pure { session, mfa }
-- |
-- |
-- | * `provider`: `IdTokenProvider` -
-- | * `idtoken`: `String` -
-- | Apple ID token
-- | * `nonce` (Optional): `String` -
-- | Nonce used during sign in process
-- | * `options` (Optional): `SignUpOptions` -
type SignInIdTokenRequest =
  {provider :: IdTokenProvider --
  , idtoken :: String --
-- | Apple ID token
  , nonce :: Maybe (String) --
-- | Nonce used during sign in process
  , options :: Maybe (SignUpOptions) --
  }

-- JSON instances for SignInIdTokenRequest
instance encodeJsonSignInIdTokenRequest :: EncodeJson SignInIdTokenRequest where
  encodeJson record =
    "provider" := record.provider

    ~> "idtoken" := record.idtoken

    ~> "nonce" := record.nonce

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonSignInIdTokenRequest :: DecodeJson SignInIdTokenRequest where
  decodeJson json = do
    obj <- decodeJson json
    provider <- obj .: "provider"
    idtoken <- obj .: "idtoken"
    nonce <- obj .:? "nonce"
    options <- obj .:? "options"
    pure { provider, idtoken, nonce, options }
-- |
-- |
-- | * `ticket`: `String` -
-- | Ticket
-- | Pattern: ^mfaTotp:.*$
-- | * `otp`: `String` -
-- | One time password
type SignInMfaTotpRequest =
  {ticket :: String --
-- | Ticket
-- | Pattern: ^mfaTotp:.*$
  , otp :: String --
-- | One time password
  }

-- JSON instances for SignInMfaTotpRequest
instance encodeJsonSignInMfaTotpRequest :: EncodeJson SignInMfaTotpRequest where
  encodeJson record =
    "ticket" := record.ticket

    ~> "otp" := record.otp
    ~> jsonEmptyObject

instance decodeJsonSignInMfaTotpRequest :: DecodeJson SignInMfaTotpRequest where
  decodeJson json = do
    obj <- decodeJson json
    ticket <- obj .: "ticket"
    otp <- obj .: "otp"
    pure { ticket, otp }
-- |
-- |
-- | * `email`: `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `options` (Optional): `SignUpOptions` -
type SignInOTPEmailRequest =
  {email :: String --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , options :: Maybe (SignUpOptions) --
  }

-- JSON instances for SignInOTPEmailRequest
instance encodeJsonSignInOTPEmailRequest :: EncodeJson SignInOTPEmailRequest where
  encodeJson record =
    "email" := record.email

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonSignInOTPEmailRequest :: DecodeJson SignInOTPEmailRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .: "email"
    options <- obj .:? "options"
    pure { email, options }
-- |
-- |
-- | * `otp`: `String` -
-- | One time password
-- | * `email`: `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
type SignInOTPEmailVerifyRequest =
  {otp :: String --
-- | One time password
  , email :: String --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  }

-- JSON instances for SignInOTPEmailVerifyRequest
instance encodeJsonSignInOTPEmailVerifyRequest :: EncodeJson SignInOTPEmailVerifyRequest where
  encodeJson record =
    "otp" := record.otp

    ~> "email" := record.email
    ~> jsonEmptyObject

instance decodeJsonSignInOTPEmailVerifyRequest :: DecodeJson SignInOTPEmailVerifyRequest where
  decodeJson json = do
    obj <- decodeJson json
    otp <- obj .: "otp"
    email <- obj .: "email"
    pure { otp, email }
-- |
-- |
-- | * `session` (Optional): `Session` -
-- | User authentication session containing tokens and user information
type SignInOTPEmailVerifyResponse =
  {session :: Maybe (Session) --
-- | User authentication session containing tokens and user information
  }

-- JSON instances for SignInOTPEmailVerifyResponse
instance encodeJsonSignInOTPEmailVerifyResponse :: EncodeJson SignInOTPEmailVerifyResponse where
  encodeJson record =
    "session" := record.session
    ~> jsonEmptyObject

instance decodeJsonSignInOTPEmailVerifyResponse :: DecodeJson SignInOTPEmailVerifyResponse where
  decodeJson json = do
    obj <- decodeJson json
    session <- obj .:? "session"
    pure { session }
-- |
-- |
-- | * `personalaccesstoken`: `String` -
-- | PAT
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
type SignInPATRequest =
  {personalaccesstoken :: String --
-- | PAT
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
  }

-- JSON instances for SignInPATRequest
instance encodeJsonSignInPATRequest :: EncodeJson SignInPATRequest where
  encodeJson record =
    "personalaccesstoken" := record.personalaccesstoken
    ~> jsonEmptyObject

instance decodeJsonSignInPATRequest :: DecodeJson SignInPATRequest where
  decodeJson json = do
    obj <- decodeJson json
    personalaccesstoken <- obj .: "personalaccesstoken"
    pure { personalaccesstoken }
-- |
-- |
-- | * `email`: `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `options` (Optional): `SignUpOptions` -
type SignInPasswordlessEmailRequest =
  {email :: String --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , options :: Maybe (SignUpOptions) --
  }

-- JSON instances for SignInPasswordlessEmailRequest
instance encodeJsonSignInPasswordlessEmailRequest :: EncodeJson SignInPasswordlessEmailRequest where
  encodeJson record =
    "email" := record.email

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonSignInPasswordlessEmailRequest :: DecodeJson SignInPasswordlessEmailRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .: "email"
    options <- obj .:? "options"
    pure { email, options }
-- |
-- |
-- | * `phonenumber`: `String` -
-- | Phone number of the user
-- | Example: `"+123456789"`
-- | * `otp`: `String` -
-- | One-time password received by SMS
type SignInPasswordlessSmsOtpRequest =
  {phonenumber :: String --
-- | Phone number of the user
-- | Example: `"+123456789"`
  , otp :: String --
-- | One-time password received by SMS
  }

-- JSON instances for SignInPasswordlessSmsOtpRequest
instance encodeJsonSignInPasswordlessSmsOtpRequest :: EncodeJson SignInPasswordlessSmsOtpRequest where
  encodeJson record =
    "phonenumber" := record.phonenumber

    ~> "otp" := record.otp
    ~> jsonEmptyObject

instance decodeJsonSignInPasswordlessSmsOtpRequest :: DecodeJson SignInPasswordlessSmsOtpRequest where
  decodeJson json = do
    obj <- decodeJson json
    phonenumber <- obj .: "phonenumber"
    otp <- obj .: "otp"
    pure { phonenumber, otp }
-- |
-- |
-- | * `session` (Optional): `Session` -
-- | User authentication session containing tokens and user information
-- | * `mfa` (Optional): `MFAChallengePayload` -
-- | Challenge payload for multi-factor authentication
type SignInPasswordlessSmsOtpResponse =
  {session :: Maybe (Session) --
-- | User authentication session containing tokens and user information
  , mfa :: Maybe (MFAChallengePayload) --
-- | Challenge payload for multi-factor authentication
  }

-- JSON instances for SignInPasswordlessSmsOtpResponse
instance encodeJsonSignInPasswordlessSmsOtpResponse :: EncodeJson SignInPasswordlessSmsOtpResponse where
  encodeJson record =
    "session" := record.session

    ~> "mfa" := record.mfa
    ~> jsonEmptyObject

instance decodeJsonSignInPasswordlessSmsOtpResponse :: DecodeJson SignInPasswordlessSmsOtpResponse where
  decodeJson json = do
    obj <- decodeJson json
    session <- obj .:? "session"
    mfa <- obj .:? "mfa"
    pure { session, mfa }
-- |
-- |
-- | * `phonenumber`: `String` -
-- | Phone number of the user
-- | Example: `"+123456789"`
-- | * `options` (Optional): `SignUpOptions` -
type SignInPasswordlessSmsRequest =
  {phonenumber :: String --
-- | Phone number of the user
-- | Example: `"+123456789"`
  , options :: Maybe (SignUpOptions) --
  }

-- JSON instances for SignInPasswordlessSmsRequest
instance encodeJsonSignInPasswordlessSmsRequest :: EncodeJson SignInPasswordlessSmsRequest where
  encodeJson record =
    "phonenumber" := record.phonenumber

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonSignInPasswordlessSmsRequest :: DecodeJson SignInPasswordlessSmsRequest where
  decodeJson json = do
    obj <- decodeJson json
    phonenumber <- obj .: "phonenumber"
    options <- obj .:? "options"
    pure { phonenumber, options }
-- |
-- |
-- | * `email` (Optional): `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
type SignInWebauthnRequest =
  {email :: Maybe (String) --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  }

-- JSON instances for SignInWebauthnRequest
instance encodeJsonSignInWebauthnRequest :: EncodeJson SignInWebauthnRequest where
  encodeJson record =
    "email" := record.email
    ~> jsonEmptyObject

instance decodeJsonSignInWebauthnRequest :: DecodeJson SignInWebauthnRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .:? "email"
    pure { email }
-- |
-- |
-- | * `email` (Optional): `String` -
-- | A valid email. Deprecated, no longer used
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `credential`: `CredentialAssertionResponse` -
type SignInWebauthnVerifyRequest =
  {email :: Maybe (String) --
-- | A valid email. Deprecated, no longer used
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , credential :: CredentialAssertionResponse --
  }

-- JSON instances for SignInWebauthnVerifyRequest
instance encodeJsonSignInWebauthnVerifyRequest :: EncodeJson SignInWebauthnVerifyRequest where
  encodeJson record =
    "email" := record.email

    ~> "credential" := record.credential
    ~> jsonEmptyObject

instance decodeJsonSignInWebauthnVerifyRequest :: DecodeJson SignInWebauthnVerifyRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .:? "email"
    credential <- obj .: "credential"
    pure { email, credential }
-- |
-- |
-- | * `refreshtoken` (Optional): `String` -
-- | Refresh token for the current session
-- | * `all` (Optional): `Boolean` -
-- | Sign out from all connected devices
type SignOutRequest =
  {refreshtoken :: Maybe (String) --
-- | Refresh token for the current session
  , all :: Maybe (Boolean) --
-- | Sign out from all connected devices
  }

-- JSON instances for SignOutRequest
instance encodeJsonSignOutRequest :: EncodeJson SignOutRequest where
  encodeJson record =
    "refreshtoken" := record.refreshtoken

    ~> "all" := record.all
    ~> jsonEmptyObject

instance decodeJsonSignOutRequest :: DecodeJson SignOutRequest where
  decodeJson json = do
    obj <- decodeJson json
    refreshtoken <- obj .:? "refreshtoken"
    all <- obj .:? "all"
    pure { refreshtoken, all }
-- | Request to register a new user with email and password
-- |
-- | * `email`: `String` -
-- | Email address for the new user account
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `password`: `String` -
-- | Password for the new user account
-- | Example: `"Str0ngPassw#ord-94|%"`
-- | MinLength: 3
-- | MaxLength: 50
-- | * `options` (Optional): `SignUpOptions` -
type SignUpEmailPasswordRequest =
  {email :: String --
-- | Email address for the new user account
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , password :: String --
-- | Password for the new user account
-- | Example: `"Str0ngPassw#ord-94|%"`
-- | MinLength: 3
-- | MaxLength: 50
  , options :: Maybe (SignUpOptions) --
  }

-- JSON instances for SignUpEmailPasswordRequest
instance encodeJsonSignUpEmailPasswordRequest :: EncodeJson SignUpEmailPasswordRequest where
  encodeJson record =
    "email" := record.email

    ~> "password" := record.password

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonSignUpEmailPasswordRequest :: DecodeJson SignUpEmailPasswordRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .: "email"
    password <- obj .: "password"
    options <- obj .:? "options"
    pure { email, password, options }
-- |
-- |
-- | * `allowedroles` (Optional): `Array String` -
-- | Example: `["me","user"]`
-- | * `defaultrole` (Optional): `String` -
-- | Example: `"user"`
-- | * `displayname` (Optional): `String` -
-- | Example: `"John Smith"`
-- | Pattern: ^[\p{L}\p{N}\p{S} ,.'-]+$
-- | MaxLength: 32
-- | * `locale` (Optional): `String` -
-- | A two-characters locale
-- | Example: `"en"`
-- | MinLength: 2
-- | MaxLength: 2
-- | * `metadata` (Optional): `Object` -
-- | Example: `{"firstName":"John","lastName":"Smith"}`
-- | * `redirectto` (Optional): `String` -
-- | Example: `"https://my-app.com/catch-redirection"`
-- | Format: uri
type SignUpOptions =
  {allowedroles :: Maybe (Array String) --
-- | Example: `["me","user"]`
  , defaultrole :: Maybe (String) --
-- | Example: `"user"`
  , displayname :: Maybe (String) --
-- | Example: `"John Smith"`
-- | Pattern: ^[\p{L}\p{N}\p{S} ,.'-]+$
-- | MaxLength: 32
  , locale :: Maybe (String) --
-- | A two-characters locale
-- | Example: `"en"`
-- | MinLength: 2
-- | MaxLength: 2
  , metadata :: Maybe (Object) --
-- | Example: `{"firstName":"John","lastName":"Smith"}`
  , redirectto :: Maybe (String) --
-- | Example: `"https://my-app.com/catch-redirection"`
-- | Format: uri
  }

-- JSON instances for SignUpOptions
instance encodeJsonSignUpOptions :: EncodeJson SignUpOptions where
  encodeJson record =
    "allowedroles" := record.allowedroles

    ~> "defaultrole" := record.defaultrole

    ~> "displayname" := record.displayname

    ~> "locale" := record.locale

    ~> "metadata" := record.metadata

    ~> "redirectto" := record.redirectto
    ~> jsonEmptyObject

instance decodeJsonSignUpOptions :: DecodeJson SignUpOptions where
  decodeJson json = do
    obj <- decodeJson json
    allowedroles <- obj .:? "allowedroles"
    defaultrole <- obj .:? "defaultrole"
    displayname <- obj .:? "displayname"
    locale <- obj .:? "locale"
    metadata <- obj .:? "metadata"
    redirectto <- obj .:? "redirectto"
    pure { allowedroles, defaultrole, displayname, locale, metadata, redirectto }
-- |
-- |
-- | * `email`: `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `options` (Optional): `SignUpOptions` -
type SignUpWebauthnRequest =
  {email :: String --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , options :: Maybe (SignUpOptions) --
  }

-- JSON instances for SignUpWebauthnRequest
instance encodeJsonSignUpWebauthnRequest :: EncodeJson SignUpWebauthnRequest where
  encodeJson record =
    "email" := record.email

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonSignUpWebauthnRequest :: DecodeJson SignUpWebauthnRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .: "email"
    options <- obj .:? "options"
    pure { email, options }
-- |
-- |
-- | * `credential`: `CredentialCreationResponse` -
-- | * `options` (Optional): `SignUpOptions` -
-- | * `nickname` (Optional): `String` -
-- | Nickname for the security key
type SignUpWebauthnVerifyRequest =
  {credential :: CredentialCreationResponse --
  , options :: Maybe (SignUpOptions) --
  , nickname :: Maybe (String) --
-- | Nickname for the security key
  }

-- JSON instances for SignUpWebauthnVerifyRequest
instance encodeJsonSignUpWebauthnVerifyRequest :: EncodeJson SignUpWebauthnVerifyRequest where
  encodeJson record =
    "credential" := record.credential

    ~> "options" := record.options

    ~> "nickname" := record.nickname
    ~> jsonEmptyObject

instance decodeJsonSignUpWebauthnVerifyRequest :: DecodeJson SignUpWebauthnVerifyRequest where
  decodeJson json = do
    obj <- decodeJson json
    credential <- obj .: "credential"
    options <- obj .:? "options"
    nickname <- obj .:? "nickname"
    pure { credential, options, nickname }
-- | Response containing TOTP setup information for MFA
-- |
-- | * `imageurl`: `String` -
-- | URL to QR code image for scanning with an authenticator app
-- | Example: `"data:image/png;base64,iVBORw0KGg..."`
-- | * `totpsecret`: `String` -
-- | TOTP secret key for manual setup with an authenticator app
-- | Example: `"ABCDEFGHIJK23456"`
type TotpGenerateResponse =
  {imageurl :: String --
-- | URL to QR code image for scanning with an authenticator app
-- | Example: `"data:image/png;base64,iVBORw0KGg..."`
  , totpsecret :: String --
-- | TOTP secret key for manual setup with an authenticator app
-- | Example: `"ABCDEFGHIJK23456"`
  }

-- JSON instances for TotpGenerateResponse
instance encodeJsonTotpGenerateResponse :: EncodeJson TotpGenerateResponse where
  encodeJson record =
    "imageurl" := record.imageurl

    ~> "totpsecret" := record.totpsecret
    ~> jsonEmptyObject

instance decodeJsonTotpGenerateResponse :: DecodeJson TotpGenerateResponse where
  decodeJson json = do
    obj <- decodeJson json
    imageurl <- obj .: "imageurl"
    totpsecret <- obj .: "totpsecret"
    pure { imageurl, totpsecret }

-- | Base64url-encoded binary data
type URLEncodedBase64 = String

urlencodedbase64Codec :: CJ.Codec URLEncodedBase64
urlencodedbase64Codec = CJ.string
-- | User profile and account information
-- |
-- | * `avatarurl`: `String` -
-- | URL to the user's profile picture
-- | Example: `"https://myapp.com/avatars/user123.jpg"`
-- | * `createdat`: `String` -
-- | Timestamp when the user account was created
-- | Example: `"2023-01-15T12:34:56Z"`
-- | Format: date-time
-- | * `defaultrole`: `String` -
-- | Default authorization role for the user
-- | Example: `"user"`
-- | * `displayname`: `String` -
-- | User's display name
-- | Example: `"John Smith"`
-- | * `email` (Optional): `String` -
-- | User's email address
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `emailverified`: `Boolean` -
-- | Whether the user's email has been verified
-- | Example: `true`
-- | * `id`: `String` -
-- | Unique identifier for the user
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
-- | * `isanonymous`: `Boolean` -
-- | Whether this is an anonymous user account
-- | Example: `false`
-- | * `locale`: `String` -
-- | User's preferred locale (language code)
-- | Example: `"en"`
-- | MinLength: 2
-- | MaxLength: 2
-- | * `metadata`: `Object` -
-- | Custom metadata associated with the user
-- | Example: `{"firstName":"John","lastName":"Smith"}`
-- | * `phonenumber` (Optional): `String` -
-- | User's phone number
-- | Example: `"+12025550123"`
-- | * `phonenumberverified`: `Boolean` -
-- | Whether the user's phone number has been verified
-- | Example: `false`
-- | * `roles`: `Array String` -
-- | List of roles assigned to the user
-- | Example: `["user","customer"]`
-- | * `activemfatype` (Optional): `String` -
-- | Active MFA type for the user
type User =
  {avatarurl :: String --
-- | URL to the user's profile picture
-- | Example: `"https://myapp.com/avatars/user123.jpg"`
  , createdat :: String --
-- | Timestamp when the user account was created
-- | Example: `"2023-01-15T12:34:56Z"`
-- | Format: date-time
  , defaultrole :: String --
-- | Default authorization role for the user
-- | Example: `"user"`
  , displayname :: String --
-- | User's display name
-- | Example: `"John Smith"`
  , email :: Maybe (String) --
-- | User's email address
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , emailverified :: Boolean --
-- | Whether the user's email has been verified
-- | Example: `true`
  , id :: String --
-- | Unique identifier for the user
-- | Example: `"2c35b6f3-c4b9-48e3-978a-d4d0f1d42e24"`
-- | Pattern: \b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b
  , isanonymous :: Boolean --
-- | Whether this is an anonymous user account
-- | Example: `false`
  , locale :: String --
-- | User's preferred locale (language code)
-- | Example: `"en"`
-- | MinLength: 2
-- | MaxLength: 2
  , metadata :: Object --
-- | Custom metadata associated with the user
-- | Example: `{"firstName":"John","lastName":"Smith"}`
  , phonenumber :: Maybe (String) --
-- | User's phone number
-- | Example: `"+12025550123"`
  , phonenumberverified :: Boolean --
-- | Whether the user's phone number has been verified
-- | Example: `false`
  , roles :: Array String --
-- | List of roles assigned to the user
-- | Example: `["user","customer"]`
  , activemfatype :: Maybe (String) --
-- | Active MFA type for the user
  }

-- JSON instances for User
instance encodeJsonUser :: EncodeJson User where
  encodeJson record =
    "avatarurl" := record.avatarurl

    ~> "createdat" := record.createdat

    ~> "defaultrole" := record.defaultrole

    ~> "displayname" := record.displayname

    ~> "email" := record.email

    ~> "emailverified" := record.emailverified

    ~> "id" := record.id

    ~> "isanonymous" := record.isanonymous

    ~> "locale" := record.locale

    ~> "metadata" := record.metadata

    ~> "phonenumber" := record.phonenumber

    ~> "phonenumberverified" := record.phonenumberverified

    ~> "roles" := record.roles

    ~> "activemfatype" := record.activemfatype
    ~> jsonEmptyObject

instance decodeJsonUser :: DecodeJson User where
  decodeJson json = do
    obj <- decodeJson json
    avatarurl <- obj .: "avatarurl"
    createdat <- obj .: "createdat"
    defaultrole <- obj .: "defaultrole"
    displayname <- obj .: "displayname"
    email <- obj .:? "email"
    emailverified <- obj .: "emailverified"
    id <- obj .: "id"
    isanonymous <- obj .: "isanonymous"
    locale <- obj .: "locale"
    metadata <- obj .: "metadata"
    phonenumber <- obj .:? "phonenumber"
    phonenumberverified <- obj .: "phonenumberverified"
    roles <- obj .: "roles"
    activemfatype <- obj .:? "activemfatype"
    pure { avatarurl, createdat, defaultrole, displayname, email, emailverified, id, isanonymous, locale, metadata, phonenumber, phonenumberverified, roles, activemfatype }

-- | Which sign-in method to use
data UserDeanonymizeRequestSignInMethod
  = UserDeanonymizeRequestSignInMethod_EmailPassword
  | UserDeanonymizeRequestSignInMethod_Passwordless

derive instance genericUserDeanonymizeRequestSignInMethod :: Generic UserDeanonymizeRequestSignInMethod _
derive instance eqUserDeanonymizeRequestSignInMethod :: Eq UserDeanonymizeRequestSignInMethod
derive instance ordUserDeanonymizeRequestSignInMethod :: Ord UserDeanonymizeRequestSignInMethod

instance showUserDeanonymizeRequestSignInMethod :: Show UserDeanonymizeRequestSignInMethod where
  show = genericShow

userdeanonymizerequestsigninmethodCodec :: CJ.Codec UserDeanonymizeRequestSignInMethod
userdeanonymizerequestsigninmethodCodec = CJ.prismaticCodec "UserDeanonymizeRequestSignInMethod" dec enc CJ.string
  where
    dec = case _ of
      "EmailPassword" -> Just UserDeanonymizeRequestSignInMethod_EmailPassword
      "Passwordless" -> Just UserDeanonymizeRequestSignInMethod_Passwordless
      _ -> Nothing

    enc = case _ of
      UserDeanonymizeRequestSignInMethod_EmailPassword -> "EmailPassword"
      UserDeanonymizeRequestSignInMethod_Passwordless -> "Passwordless"
-- |
-- |
-- | * `signinmethod`: `UserDeanonymizeRequestSignInMethod` -
-- | Which sign-in method to use
-- | * `email`: `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `password` (Optional): `String` -
-- | A password of minimum 3 characters
-- | Example: `"Str0ngPassw#ord-94|%"`
-- | MinLength: 3
-- | MaxLength: 50
-- | * `connection` (Optional): `String` -
-- | Deprecated, will be ignored
-- | * `options` (Optional): `SignUpOptions` -
type UserDeanonymizeRequest =
  {signinmethod :: UserDeanonymizeRequestSignInMethod --
-- | Which sign-in method to use
  , email :: String --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , password :: Maybe (String) --
-- | A password of minimum 3 characters
-- | Example: `"Str0ngPassw#ord-94|%"`
-- | MinLength: 3
-- | MaxLength: 50
  , connection :: Maybe (String) --
-- | Deprecated, will be ignored
  , options :: Maybe (SignUpOptions) --
  }

-- JSON instances for UserDeanonymizeRequest
instance encodeJsonUserDeanonymizeRequest :: EncodeJson UserDeanonymizeRequest where
  encodeJson record =
    "signinmethod" := record.signinmethod

    ~> "email" := record.email

    ~> "password" := record.password

    ~> "connection" := record.connection

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonUserDeanonymizeRequest :: DecodeJson UserDeanonymizeRequest where
  decodeJson json = do
    obj <- decodeJson json
    signinmethod <- obj .: "signinmethod"
    email <- obj .: "email"
    password <- obj .:? "password"
    connection <- obj .:? "connection"
    options <- obj .:? "options"
    pure { signinmethod, email, password, connection, options }
-- |
-- |
-- | * `newemail`: `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `options` (Optional): `OptionsRedirectTo` -
type UserEmailChangeRequest =
  {newemail :: String --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , options :: Maybe (OptionsRedirectTo) --
  }

-- JSON instances for UserEmailChangeRequest
instance encodeJsonUserEmailChangeRequest :: EncodeJson UserEmailChangeRequest where
  encodeJson record =
    "newemail" := record.newemail

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonUserEmailChangeRequest :: DecodeJson UserEmailChangeRequest where
  decodeJson json = do
    obj <- decodeJson json
    newemail <- obj .: "newemail"
    options <- obj .:? "options"
    pure { newemail, options }
-- |
-- |
-- | * `email`: `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `options` (Optional): `OptionsRedirectTo` -
type UserEmailSendVerificationEmailRequest =
  {email :: String --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , options :: Maybe (OptionsRedirectTo) --
  }

-- JSON instances for UserEmailSendVerificationEmailRequest
instance encodeJsonUserEmailSendVerificationEmailRequest :: EncodeJson UserEmailSendVerificationEmailRequest where
  encodeJson record =
    "email" := record.email

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonUserEmailSendVerificationEmailRequest :: DecodeJson UserEmailSendVerificationEmailRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .: "email"
    options <- obj .:? "options"
    pure { email, options }
-- |
-- |
-- | * `name`: `String` -
-- | A human-palatable name for the entity
-- | * `displayname`: `String` -
-- | A human-palatable name for the user account, intended only for display
-- | * `id`: `String` -
-- | The user handle of the user account entity
type UserEntity =
  {name :: String --
-- | A human-palatable name for the entity
  , displayname :: String --
-- | A human-palatable name for the user account, intended only for display
  , id :: String --
-- | The user handle of the user account entity
  }

-- JSON instances for UserEntity
instance encodeJsonUserEntity :: EncodeJson UserEntity where
  encodeJson record =
    "name" := record.name

    ~> "displayname" := record.displayname

    ~> "id" := record.id
    ~> jsonEmptyObject

instance decodeJsonUserEntity :: DecodeJson UserEntity where
  decodeJson json = do
    obj <- decodeJson json
    name <- obj .: "name"
    displayname <- obj .: "displayname"
    id <- obj .: "id"
    pure { name, displayname, id }

-- | Type of MFA to activate. Use empty string to disable MFA.
data UserMfaRequestActiveMfaType
  = UserMfaRequestActiveMfaType_Totp
  | UserMfaRequestActiveMfaType_None

derive instance genericUserMfaRequestActiveMfaType :: Generic UserMfaRequestActiveMfaType _
derive instance eqUserMfaRequestActiveMfaType :: Eq UserMfaRequestActiveMfaType
derive instance ordUserMfaRequestActiveMfaType :: Ord UserMfaRequestActiveMfaType

instance showUserMfaRequestActiveMfaType :: Show UserMfaRequestActiveMfaType where
  show = genericShow

usermfarequestactivemfatypeCodec :: CJ.Codec UserMfaRequestActiveMfaType
usermfarequestactivemfatypeCodec = CJ.prismaticCodec "UserMfaRequestActiveMfaType" dec enc CJ.string
  where
    dec = case _ of
      "Totp" -> Just UserMfaRequestActiveMfaType_Totp
      "" -> Just UserMfaRequestActiveMfaType_None
      _ -> Nothing

    enc = case _ of
      UserMfaRequestActiveMfaType_Totp -> "Totp"
      UserMfaRequestActiveMfaType_None -> ""
-- | Request to activate or deactivate multi-factor authentication
-- |
-- | * `code`: `String` -
-- | Verification code from the authenticator app when activating MFA
-- | Example: `"123456"`
-- | * `activemfatype` (Optional): `UserMfaRequestActiveMfaType` -
-- | Type of MFA to activate. Use empty string to disable MFA.
-- | Example: `"totp"`
type UserMfaRequest =
  {code :: String --
-- | Verification code from the authenticator app when activating MFA
-- | Example: `"123456"`
  , activemfatype :: Maybe (UserMfaRequestActiveMfaType) --
-- | Type of MFA to activate. Use empty string to disable MFA.
-- | Example: `"totp"`
  }

-- JSON instances for UserMfaRequest
instance encodeJsonUserMfaRequest :: EncodeJson UserMfaRequest where
  encodeJson record =
    "code" := record.code

    ~> "activemfatype" := record.activemfatype
    ~> jsonEmptyObject

instance decodeJsonUserMfaRequest :: DecodeJson UserMfaRequest where
  decodeJson json = do
    obj <- decodeJson json
    code <- obj .: "code"
    activemfatype <- obj .:? "activemfatype"
    pure { code, activemfatype }
-- |
-- |
-- | * `newpassword`: `String` -
-- | A password of minimum 3 characters
-- | Example: `"Str0ngPassw#ord-94|%"`
-- | MinLength: 3
-- | MaxLength: 50
-- | * `ticket` (Optional): `String` -
-- | Ticket to reset the password, required if the user is not authenticated
-- | Pattern: ^passwordReset\:.*$
type UserPasswordRequest =
  {newpassword :: String --
-- | A password of minimum 3 characters
-- | Example: `"Str0ngPassw#ord-94|%"`
-- | MinLength: 3
-- | MaxLength: 50
  , ticket :: Maybe (String) --
-- | Ticket to reset the password, required if the user is not authenticated
-- | Pattern: ^passwordReset\:.*$
  }

-- JSON instances for UserPasswordRequest
instance encodeJsonUserPasswordRequest :: EncodeJson UserPasswordRequest where
  encodeJson record =
    "newpassword" := record.newpassword

    ~> "ticket" := record.ticket
    ~> jsonEmptyObject

instance decodeJsonUserPasswordRequest :: DecodeJson UserPasswordRequest where
  decodeJson json = do
    obj <- decodeJson json
    newpassword <- obj .: "newpassword"
    ticket <- obj .:? "ticket"
    pure { newpassword, ticket }
-- |
-- |
-- | * `email`: `String` -
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
-- | * `options` (Optional): `OptionsRedirectTo` -
type UserPasswordResetRequest =
  {email :: String --
-- | A valid email
-- | Example: `"john.smith@nhost.io"`
-- | Format: email
  , options :: Maybe (OptionsRedirectTo) --
  }

-- JSON instances for UserPasswordResetRequest
instance encodeJsonUserPasswordResetRequest :: EncodeJson UserPasswordResetRequest where
  encodeJson record =
    "email" := record.email

    ~> "options" := record.options
    ~> jsonEmptyObject

instance decodeJsonUserPasswordResetRequest :: DecodeJson UserPasswordResetRequest where
  decodeJson json = do
    obj <- decodeJson json
    email <- obj .: "email"
    options <- obj .:? "options"
    pure { email, options }

-- | A requirement for user verification for the operation
data UserVerificationRequirement
  = UserVerificationRequirement_Required
  | UserVerificationRequirement_Preferred
  | UserVerificationRequirement_Discouraged

derive instance genericUserVerificationRequirement :: Generic UserVerificationRequirement _
derive instance eqUserVerificationRequirement :: Eq UserVerificationRequirement
derive instance ordUserVerificationRequirement :: Ord UserVerificationRequirement

instance showUserVerificationRequirement :: Show UserVerificationRequirement where
  show = genericShow

userverificationrequirementCodec :: CJ.Codec UserVerificationRequirement
userverificationrequirementCodec = CJ.prismaticCodec "UserVerificationRequirement" dec enc CJ.string
  where
    dec = case _ of
      "Required" -> Just UserVerificationRequirement_Required
      "Preferred" -> Just UserVerificationRequirement_Preferred
      "Discouraged" -> Just UserVerificationRequirement_Discouraged
      _ -> Nothing

    enc = case _ of
      UserVerificationRequirement_Required -> "Required"
      UserVerificationRequirement_Preferred -> "Preferred"
      UserVerificationRequirement_Discouraged -> "Discouraged"
-- |
-- |
-- | * `credential`: `CredentialCreationResponse` -
-- | * `nickname` (Optional): `String` -
-- | Optional nickname for the security key
type VerifyAddSecurityKeyRequest =
  {credential :: CredentialCreationResponse --
  , nickname :: Maybe (String) --
-- | Optional nickname for the security key
  }

-- JSON instances for VerifyAddSecurityKeyRequest
instance encodeJsonVerifyAddSecurityKeyRequest :: EncodeJson VerifyAddSecurityKeyRequest where
  encodeJson record =
    "credential" := record.credential

    ~> "nickname" := record.nickname
    ~> jsonEmptyObject

instance decodeJsonVerifyAddSecurityKeyRequest :: DecodeJson VerifyAddSecurityKeyRequest where
  decodeJson json = do
    obj <- decodeJson json
    credential <- obj .: "credential"
    nickname <- obj .:? "nickname"
    pure { credential, nickname }
-- |
-- |
-- | * `id`: `String` -
-- | The ID of the newly added security key
-- | Example: `"123e4567-e89b-12d3-a456-426614174000"`
-- | * `nickname` (Optional): `String` -
-- | The nickname of the security key if provided
type VerifyAddSecurityKeyResponse =
  {id :: String --
-- | The ID of the newly added security key
-- | Example: `"123e4567-e89b-12d3-a456-426614174000"`
  , nickname :: Maybe (String) --
-- | The nickname of the security key if provided
  }

-- JSON instances for VerifyAddSecurityKeyResponse
instance encodeJsonVerifyAddSecurityKeyResponse :: EncodeJson VerifyAddSecurityKeyResponse where
  encodeJson record =
    "id" := record.id

    ~> "nickname" := record.nickname
    ~> jsonEmptyObject

instance decodeJsonVerifyAddSecurityKeyResponse :: DecodeJson VerifyAddSecurityKeyResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .: "id"
    nickname <- obj .:? "nickname"
    pure { id, nickname }
-- |
-- |
-- | * `token` (Optional): `String` -
-- | JWT token to verify
type VerifyTokenRequest =
  {token :: Maybe (String) --
-- | JWT token to verify
  }

-- JSON instances for VerifyTokenRequest
instance encodeJsonVerifyTokenRequest :: EncodeJson VerifyTokenRequest where
  encodeJson record =
    "token" := record.token
    ~> jsonEmptyObject

instance decodeJsonVerifyTokenRequest :: DecodeJson VerifyTokenRequest where
  decodeJson json = do
    obj <- decodeJson json
    token <- obj .:? "token"
    pure { token }

-- | Target URL for the redirect
type RedirectToQuery = String

redirecttoqueryCodec :: CJ.Codec RedirectToQuery
redirecttoqueryCodec = CJ.string

data SignInProvider
  = SignInProvider_Apple
  | SignInProvider_Github
  | SignInProvider_Google
  | SignInProvider_Linkedin
  | SignInProvider_Discord
  | SignInProvider_Spotify
  | SignInProvider_Twitch
  | SignInProvider_Gitlab
  | SignInProvider_Bitbucket
  | SignInProvider_Workos
  | SignInProvider_Azuread
  | SignInProvider_Strava
  | SignInProvider_Facebook
  | SignInProvider_Windowslive
  | SignInProvider_Twitter

derive instance genericSignInProvider :: Generic SignInProvider _
derive instance eqSignInProvider :: Eq SignInProvider
derive instance ordSignInProvider :: Ord SignInProvider

instance showSignInProvider :: Show SignInProvider where
  show = genericShow

signinproviderCodec :: CJ.Codec SignInProvider
signinproviderCodec = CJ.prismaticCodec "SignInProvider" dec enc CJ.string
  where
    dec = case _ of
      "Apple" -> Just SignInProvider_Apple
      "Github" -> Just SignInProvider_Github
      "Google" -> Just SignInProvider_Google
      "Linkedin" -> Just SignInProvider_Linkedin
      "Discord" -> Just SignInProvider_Discord
      "Spotify" -> Just SignInProvider_Spotify
      "Twitch" -> Just SignInProvider_Twitch
      "Gitlab" -> Just SignInProvider_Gitlab
      "Bitbucket" -> Just SignInProvider_Bitbucket
      "Workos" -> Just SignInProvider_Workos
      "Azuread" -> Just SignInProvider_Azuread
      "Strava" -> Just SignInProvider_Strava
      "Facebook" -> Just SignInProvider_Facebook
      "Windowslive" -> Just SignInProvider_Windowslive
      "Twitter" -> Just SignInProvider_Twitter
      _ -> Nothing

    enc = case _ of
      SignInProvider_Apple -> "Apple"
      SignInProvider_Github -> "Github"
      SignInProvider_Google -> "Google"
      SignInProvider_Linkedin -> "Linkedin"
      SignInProvider_Discord -> "Discord"
      SignInProvider_Spotify -> "Spotify"
      SignInProvider_Twitch -> "Twitch"
      SignInProvider_Gitlab -> "Gitlab"
      SignInProvider_Bitbucket -> "Bitbucket"
      SignInProvider_Workos -> "Workos"
      SignInProvider_Azuread -> "Azuread"
      SignInProvider_Strava -> "Strava"
      SignInProvider_Facebook -> "Facebook"
      SignInProvider_Windowslive -> "Windowslive"
      SignInProvider_Twitter -> "Twitter"

-- | Ticket
type TicketQuery = String

ticketqueryCodec :: CJ.Codec TicketQuery
ticketqueryCodec = CJ.string

-- | Type of the ticket
data TicketTypeQuery
  = TicketTypeQuery_EmailVerify
  | TicketTypeQuery_EmailConfirmChange
  | TicketTypeQuery_SigninPasswordless
  | TicketTypeQuery_PasswordReset

derive instance genericTicketTypeQuery :: Generic TicketTypeQuery _
derive instance eqTicketTypeQuery :: Eq TicketTypeQuery
derive instance ordTicketTypeQuery :: Ord TicketTypeQuery

instance showTicketTypeQuery :: Show TicketTypeQuery where
  show = genericShow

tickettypequeryCodec :: CJ.Codec TicketTypeQuery
tickettypequeryCodec = CJ.prismaticCodec "TicketTypeQuery" dec enc CJ.string
  where
    dec = case _ of
      "EmailVerify" -> Just TicketTypeQuery_EmailVerify
      "EmailConfirmChange" -> Just TicketTypeQuery_EmailConfirmChange
      "SigninPasswordless" -> Just TicketTypeQuery_SigninPasswordless
      "PasswordReset" -> Just TicketTypeQuery_PasswordReset
      _ -> Nothing

    enc = case _ of
      TicketTypeQuery_EmailVerify -> "EmailVerify"
      TicketTypeQuery_EmailConfirmChange -> "EmailConfirmChange"
      TicketTypeQuery_SigninPasswordless -> "SigninPasswordless"
      TicketTypeQuery_PasswordReset -> "PasswordReset"
-- |
-- |
-- | * `version`: `String` -
-- | The version of the authentication service
-- | Example: `"1.2.3"`
type GetVersionResponse200 =
  {version :: String --
-- | The version of the authentication service
-- | Example: `"1.2.3"`
  }

-- JSON instances for GetVersionResponse200
instance encodeJsonGetVersionResponse200 :: EncodeJson GetVersionResponse200 where
  encodeJson record =
    "version" := record.version
    ~> jsonEmptyObject

instance decodeJsonGetVersionResponse200 :: DecodeJson GetVersionResponse200 where
  decodeJson json = do
    obj <- decodeJson json
    version <- obj .: "version"
    pure { version }
-- | Parameters for the SignInProvider method.
type SignInProviderParams =
  {allowedroles :: Maybe (Array String) -- Array of allowed roles for the user
  , defaultrole :: Maybe String -- Default role for the user
  , displayname :: Maybe String -- Display name for the user
  , locale :: Maybe String -- A two-characters locale
  , metadata :: Maybe Object -- Additional metadata for the user (JSON encoded string)
  , redirectto :: Maybe String -- URI to redirect to
  , connect :: Maybe String -- If set, this means that the user is already authenticated and wants to link their account. This needs to be a valid JWT access token.
  }

signinproviderParamsCodec :: CJ.Codec SignInProviderParams
signinproviderParamsCodec =
  CJ.object $ CJR.record
    {allowedroles: CJ.maybe CJ.array CJ.string
    , defaultrole: CJ.maybe CJ.string
    , displayname: CJ.maybe CJ.string
    , locale: CJ.maybe CJ.string
    , metadata: CJ.maybe objectCodec
    , redirectto: CJ.maybe CJ.string
    , connect: CJ.maybe CJ.string
    }
-- | Parameters for the VerifyTicket method.
type VerifyTicketParams =
  {ticket :: TicketQuery -- Ticket
  , type_ :: Maybe TicketTypeQuery -- Type of the ticket. Deprecated, no longer used
  , redirectto :: RedirectToQuery -- Target URL for the redirect
  }

verifyticketParamsCodec :: CJ.Codec VerifyTicketParams
verifyticketParamsCodec =
  CJ.object $ CJR.record
    {ticket: ticketqueryCodec
    , type_: CJ.maybe tickettypequeryCodec
    , redirectto: redirecttoqueryCodec
    }

-- | API Client type
type getJWKsFn :: Aff (FetchResponse JWKSet)
type elevateWebauthnFn :: Aff (FetchResponse PublicKeyCredentialRequestOptions)
type verifyElevateWebauthnFn :: SignInWebauthnVerifyRequest -> Aff (FetchResponse SessionPayload)
type healthCheckGetFn :: Aff (FetchResponse OKResponse)
type healthCheckHeadFn :: Aff (FetchResponse void)
type linkIdTokenFn :: LinkIdTokenRequest -> Aff (FetchResponse OKResponse)
type changeUserMfaFn :: Aff (FetchResponse TotpGenerateResponse)
type createPATFn :: CreatePATRequest -> Aff (FetchResponse CreatePATResponse)
type signInAnonymousFn :: Maybe (SignInAnonymousRequest) -> Aff (FetchResponse SessionPayload)
type signInEmailPasswordFn :: SignInEmailPasswordRequest -> Aff (FetchResponse SignInEmailPasswordResponse)
type signInIdTokenFn :: SignInIdTokenRequest -> Aff (FetchResponse SessionPayload)
type verifySignInMfaTotpFn :: SignInMfaTotpRequest -> Aff (FetchResponse SessionPayload)
type signInOTPEmailFn :: SignInOTPEmailRequest -> Aff (FetchResponse OKResponse)
type verifySignInOTPEmailFn :: SignInOTPEmailVerifyRequest -> Aff (FetchResponse SignInOTPEmailVerifyResponse)
type signInPasswordlessEmailFn :: SignInPasswordlessEmailRequest -> Aff (FetchResponse OKResponse)
type signInPasswordlessSmsFn :: SignInPasswordlessSmsRequest -> Aff (FetchResponse OKResponse)
type verifySignInPasswordlessSmsFn :: SignInPasswordlessSmsOtpRequest -> Aff (FetchResponse SignInPasswordlessSmsOtpResponse)
type signInPATFn :: SignInPATRequest -> Aff (FetchResponse SessionPayload)
type signInProviderFn :: SignInProvider -> Maybe SignInProviderParams -> Aff (FetchResponse )
type signInWebauthnFn :: Maybe (SignInWebauthnRequest) -> Aff (FetchResponse PublicKeyCredentialRequestOptions)
type verifySignInWebauthnFn :: SignInWebauthnVerifyRequest -> Aff (FetchResponse SessionPayload)
type signOutFn :: SignOutRequest -> Aff (FetchResponse OKResponse)
type signUpEmailPasswordFn :: SignUpEmailPasswordRequest -> Aff (FetchResponse SessionPayload)
type signUpWebauthnFn :: SignUpWebauthnRequest -> Aff (FetchResponse PublicKeyCredentialCreationOptions)
type verifySignUpWebauthnFn :: SignUpWebauthnVerifyRequest -> Aff (FetchResponse SessionPayload)
type refreshTokenFn :: RefreshTokenRequest -> Aff (FetchResponse Session)
type verifyTokenFn :: Maybe (VerifyTokenRequest) -> Aff (FetchResponse String)
type getUserFn :: Aff (FetchResponse User)
type deanonymizeUserFn :: UserDeanonymizeRequest -> Aff (FetchResponse OKResponse)
type changeUserEmailFn :: UserEmailChangeRequest -> Aff (FetchResponse OKResponse)
type sendVerificationEmailFn :: UserEmailSendVerificationEmailRequest -> Aff (FetchResponse OKResponse)
type verifyChangeUserMfaFn :: UserMfaRequest -> Aff (FetchResponse OKResponse)
type changeUserPasswordFn :: UserPasswordRequest -> Aff (FetchResponse OKResponse)
type sendPasswordResetEmailFn :: UserPasswordResetRequest -> Aff (FetchResponse OKResponse)
type addSecurityKeyFn :: Aff (FetchResponse PublicKeyCredentialCreationOptions)
type verifyAddSecurityKeyFn :: VerifyAddSecurityKeyRequest -> Aff (FetchResponse VerifyAddSecurityKeyResponse)
type verifyTicketFn :: Maybe VerifyTicketParams -> Aff (FetchResponse )
type getVersionFn :: Aff (FetchResponse GetVersionResponse200)