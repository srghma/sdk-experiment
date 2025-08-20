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
-- | * `appid` (Optional): `Maybe Boolean` - Application identifier extension output
-- | * `credprops` (Optional): `Maybe CredentialPropertiesOutput` - Credential properties extension output
-- | * `hmaccreatesecret` (Optional): `Maybe Boolean` - HMAC secret extension output
type AuthenticationExtensionsClientOutputs =
  { appid :: Maybe Boolean -- Application identifier extension output
  , credprops :: Maybe CredentialPropertiesOutput -- Credential properties extension output
  , hmaccreatesecret :: Maybe Boolean -- HMAC secret extension output
  }

authenticationextensionsclientoutputsCodec :: CJ.Codec AuthenticationExtensionsClientOutputs
authenticationextensionsclientoutputsCodec =
  CJ.object $ CJR.record
    { appid: CJR.optional CJ.boolean
    , credprops: CJR.optional credentialpropertiesoutputCodec
    , hmaccreatesecret: CJR.optional CJ.boolean
    }

-- |
-- | * `clientdatajson`: `String` - Base64url encoded client data JSON
-- | * `authenticatordata`: `String` - Base64url encoded authenticator data
-- | * `signature`: `String` - Base64url encoded assertion signature
-- | * `userhandle` (Optional): `Maybe String` - Base64url encoded user handle
type AuthenticatorAssertionResponse =
  { clientdatajson :: String -- Base64url encoded client data JSON
  , authenticatordata :: String -- Base64url encoded authenticator data
  , signature :: String -- Base64url encoded assertion signature
  , userhandle :: Maybe String -- Base64url encoded user handle
  }

authenticatorassertionresponseCodec :: CJ.Codec AuthenticatorAssertionResponse
authenticatorassertionresponseCodec =
  CJ.object $ CJR.record
    { clientdatajson: CJ.identity CJ.string
    , authenticatordata: CJ.identity CJ.string
    , signature: CJ.identity CJ.string
    , userhandle: CJR.optional CJ.string
    }

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
-- | * `clientdatajson`: `String` - Base64url-encoded binary data
-- | * `transports` (Optional): `Maybe (Array String)` - The authenticator transports
-- | * `authenticatordata` (Optional): `Maybe String` - Base64url-encoded binary data
-- | * `publickey` (Optional): `Maybe String` - Base64url-encoded binary data
-- | * `publickeyalgorithm` (Optional): `Maybe Int` - The public key algorithm identifier
-- | * `attestationobject`: `String` - Base64url-encoded binary data
type AuthenticatorAttestationResponse =
  { clientdatajson :: String -- Base64url-encoded binary data
  , transports :: Maybe (Array String) -- The authenticator transports
  , authenticatordata :: Maybe String -- Base64url-encoded binary data
  , publickey :: Maybe String -- Base64url-encoded binary data
  , publickeyalgorithm :: Maybe Int -- The public key algorithm identifier
  , attestationobject :: String -- Base64url-encoded binary data
  }

authenticatorattestationresponseCodec :: CJ.Codec AuthenticatorAttestationResponse
authenticatorattestationresponseCodec =
  CJ.object $ CJR.record
    { clientdatajson: CJ.identity CJ.string
    , transports: CJR.optional CJ.array CJ.string
    , authenticatordata: CJR.optional CJ.string
    , publickey: CJR.optional CJ.string
    , publickeyalgorithm: CJR.optional CJ.int
    , attestationobject: CJ.identity CJ.string
    }

-- |
-- | * `authenticatorattachment` (Optional): `Maybe AuthenticatorAttachment` - The authenticator attachment modality
-- | * `requireresidentkey` (Optional): `Maybe Boolean` - Whether the authenticator must create a client-side-resident public key credential source
-- | * `residentkey` (Optional): `Maybe ResidentKeyRequirement` - The resident key requirement
-- | * `userverification` (Optional): `Maybe UserVerificationRequirement` - A requirement for user verification for the operation
type AuthenticatorSelection =
  { authenticatorattachment :: Maybe AuthenticatorAttachment -- The authenticator attachment modality
  , requireresidentkey :: Maybe Boolean -- Whether the authenticator must create a client-side-resident public key credential source
  , residentkey :: Maybe ResidentKeyRequirement -- The resident key requirement
  , userverification :: Maybe UserVerificationRequirement -- A requirement for user verification for the operation
  }

authenticatorselectionCodec :: CJ.Codec AuthenticatorSelection
authenticatorselectionCodec =
  CJ.object $ CJR.record
    { authenticatorattachment: CJR.optional authenticatorattachmentCodec
    , requireresidentkey: CJR.optional CJ.boolean
    , residentkey: CJR.optional residentkeyrequirementCodec
    , userverification: CJR.optional userverificationrequirementCodec
    }

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
-- | * `expiresat`: `String` - Expiration date of the PAT
-- | * `metadata` (Optional): `Maybe J.JObject`
type CreatePATRequest =
  { expiresat :: String -- Expiration date of the PAT
  , metadata :: Maybe J.JObject
  }

createpatrequestCodec :: CJ.Codec CreatePATRequest
createpatrequestCodec =
  CJ.object $ CJR.record
    { expiresat: CJ.identity CJ.string
    , metadata: CJR.optional CJ.jobject
    }

-- |
-- | * `id`: `String` - ID of the PAT
-- | * `personalaccesstoken`: `String` - PAT
type CreatePATResponse =
  { id :: String -- ID of the PAT
  , personalaccesstoken :: String -- PAT
  }

createpatresponseCodec :: CJ.Codec CreatePATResponse
createpatresponseCodec =
  CJ.object $ CJR.record
    { id: CJ.identity CJ.string
    , personalaccesstoken: CJ.identity CJ.string
    }

-- |
-- | * `id`: `String` - The credential's identifier
-- | * `type_`: `String` - The credential type represented by this object
-- | * `rawid`: `String` - Base64url-encoded binary data
-- | * `clientextensionresults` (Optional): `Maybe AuthenticationExtensionsClientOutputs` - Map of extension outputs from the client
-- | * `authenticatorattachment` (Optional): `Maybe String` - The authenticator attachment
-- | * `response`: `AuthenticatorAssertionResponse`
type CredentialAssertionResponse =
  { id :: String -- The credential's identifier
  , type_ :: String -- The credential type represented by this object
  , rawid :: String -- Base64url-encoded binary data
  , clientextensionresults :: Maybe AuthenticationExtensionsClientOutputs -- Map of extension outputs from the client
  , authenticatorattachment :: Maybe String -- The authenticator attachment
  , response :: AuthenticatorAssertionResponse
  }

credentialassertionresponseCodec :: CJ.Codec CredentialAssertionResponse
credentialassertionresponseCodec =
  CJ.object $ CJR.record
    { id: CJ.identity CJ.string
    , type_: CJ.identity CJ.string
    , rawid: CJ.identity CJ.string
    , clientextensionresults: CJR.optional authenticationextensionsclientoutputsCodec
    , authenticatorattachment: CJR.optional CJ.string
    , response: CJ.identity authenticatorassertionresponseCodec
    }

-- |
-- | * `id`: `String` - The credential's identifier
-- | * `type_`: `String` - The credential type represented by this object
-- | * `rawid`: `String` - Base64url-encoded binary data
-- | * `clientextensionresults` (Optional): `Maybe AuthenticationExtensionsClientOutputs` - Map of extension outputs from the client
-- | * `authenticatorattachment` (Optional): `Maybe String` - The authenticator attachment
-- | * `response`: `AuthenticatorAttestationResponse`
type CredentialCreationResponse =
  { id :: String -- The credential's identifier
  , type_ :: String -- The credential type represented by this object
  , rawid :: String -- Base64url-encoded binary data
  , clientextensionresults :: Maybe AuthenticationExtensionsClientOutputs -- Map of extension outputs from the client
  , authenticatorattachment :: Maybe String -- The authenticator attachment
  , response :: AuthenticatorAttestationResponse
  }

credentialcreationresponseCodec :: CJ.Codec CredentialCreationResponse
credentialcreationresponseCodec =
  CJ.object $ CJR.record
    { id: CJ.identity CJ.string
    , type_: CJ.identity CJ.string
    , rawid: CJ.identity CJ.string
    , clientextensionresults: CJR.optional authenticationextensionsclientoutputsCodec
    , authenticatorattachment: CJR.optional CJ.string
    , response: CJ.identity authenticatorattestationresponseCodec
    }

-- |
-- | * `type_`: `CredentialType` - The valid credential types
-- | * `alg`: `Int` - The cryptographic algorithm identifier
type CredentialParameter =
  { type_ :: CredentialType -- The valid credential types
  , alg :: Int -- The cryptographic algorithm identifier
  }

credentialparameterCodec :: CJ.Codec CredentialParameter
credentialparameterCodec =
  CJ.object $ CJR.record
    { type_: CJ.identity credentialtypeCodec
    , alg: CJ.identity CJ.int
    }

-- | Credential properties extension output
-- |
-- | * `rk` (Optional): `Maybe Boolean` - Indicates if the credential is a resident key
type CredentialPropertiesOutput =
  { rk :: Maybe Boolean -- Indicates if the credential is a resident key
  }

credentialpropertiesoutputCodec :: CJ.Codec CredentialPropertiesOutput
credentialpropertiesoutputCodec =
  CJ.object $ CJR.record
    { rk: CJR.optional CJ.boolean
    }

-- | The valid credential types
data CredentialType = CredentialType_PublicKey

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
-- | * `status`: `Int` - HTTP status error code
-- | * `message`: `String` - Human-friendly error message
-- | * `error`: `ErrorResponseError` - Error code identifying the specific application error
type ErrorResponse =
  { status :: Int -- HTTP status error code
  , message :: String -- Human-friendly error message
  , error :: ErrorResponseError -- Error code identifying the specific application error
  }

errorresponseCodec :: CJ.Codec ErrorResponse
errorresponseCodec =
  CJ.object $ CJR.record
    { status: CJ.identity CJ.int
    , message: CJ.identity CJ.string
    , error: CJ.identity errorresponseerrorCodec
    }

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
-- | * `alg`: `String` - Algorithm used with this key
-- | * `e`: `String` - RSA public exponent
-- | * `kid`: `String` - Key ID
-- | * `kty`: `String` - Key type
-- | * `n`: `String` - RSA modulus
-- | * `use`: `String` - Key usage
type JWK =
  { alg :: String -- Algorithm used with this key
  , e :: String -- RSA public exponent
  , kid :: String -- Key ID
  , kty :: String -- Key type
  , n :: String -- RSA modulus
  , use :: String -- Key usage
  }

jwkCodec :: CJ.Codec JWK
jwkCodec =
  CJ.object $ CJR.record
    { alg: CJ.identity CJ.string
    , e: CJ.identity CJ.string
    , kid: CJ.identity CJ.string
    , kty: CJ.identity CJ.string
    , n: CJ.identity CJ.string
    , use: CJ.identity CJ.string
    }

-- | JSON Web Key Set for verifying JWT signatures
-- |
-- | * `keys`: `Array JWK` - Array of public keys
type JWKSet =
  { keys :: Array JWK -- Array of public keys
  }

jwksetCodec :: CJ.Codec JWKSet
jwksetCodec =
  CJ.object $ CJR.record
    { keys: CJ.identity CJ.array jwkCodec
    }

-- |
-- | * `provider`: `IdTokenProvider`
-- | * `idtoken`: `String` - Apple ID token
-- | * `nonce` (Optional): `Maybe String` - Nonce used during sign in process
type LinkIdTokenRequest =
  { provider :: IdTokenProvider
  , idtoken :: String -- Apple ID token
  , nonce :: Maybe String -- Nonce used during sign in process
  }

linkidtokenrequestCodec :: CJ.Codec LinkIdTokenRequest
linkidtokenrequestCodec =
  CJ.object $ CJR.record
    { provider: CJ.identity idtokenproviderCodec
    , idtoken: CJ.identity CJ.string
    , nonce: CJR.optional CJ.string
    }

-- | Challenge payload for multi-factor authentication
-- |
-- | * `ticket`: `String` - Ticket to use when completing the MFA challenge
type MFAChallengePayload =
  { ticket :: String -- Ticket to use when completing the MFA challenge
  }

mfachallengepayloadCodec :: CJ.Codec MFAChallengePayload
mfachallengepayloadCodec =
  CJ.object $ CJR.record
    { ticket: CJ.identity CJ.string
    }

data OKResponse = OKResponse_OK

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
-- | * `redirectto` (Optional): `Maybe String`
type OptionsRedirectTo =
  { redirectto :: Maybe String
  }

optionsredirecttoCodec :: CJ.Codec OptionsRedirectTo
optionsredirecttoCodec =
  CJ.object $ CJR.record
    { redirectto: CJR.optional CJ.string
    }

-- |
-- | * `rp`: `RelyingPartyEntity`
-- | * `user`: `UserEntity`
-- | * `challenge`: `String` - Base64url-encoded binary data
-- | * `pubkeycredparams`: `Array CredentialParameter` - The desired credential types and their respective cryptographic parameters
-- | * `timeout` (Optional): `Maybe Int` - A time, in milliseconds, that the caller is willing to wait for the call to complete
-- | * `excludecredentials` (Optional): `Maybe (Array PublicKeyCredentialDescriptor)` - A list of PublicKeyCredentialDescriptor objects representing public key credentials that are not acceptable to the caller
-- | * `authenticatorselection` (Optional): `Maybe AuthenticatorSelection`
-- | * `hints` (Optional): `Maybe (Array PublicKeyCredentialHints)` - Hints to help guide the user through the experience
-- | * `attestation` (Optional): `Maybe ConveyancePreference` - The attestation conveyance preference
-- | * `attestationformats` (Optional): `Maybe (Array AttestationFormat)` - The preferred attestation statement formats
-- | * `extensions` (Optional): `Maybe J.JObject` - Additional parameters requesting additional processing by the client and authenticator
type PublicKeyCredentialCreationOptions =
  { rp :: RelyingPartyEntity
  , user :: UserEntity
  , challenge :: String -- Base64url-encoded binary data
  , pubkeycredparams :: Array CredentialParameter -- The desired credential types and their respective cryptographic parameters
  , timeout :: Maybe Int -- A time, in milliseconds, that the caller is willing to wait for the call to complete
  , excludecredentials :: Maybe (Array PublicKeyCredentialDescriptor) -- A list of PublicKeyCredentialDescriptor objects representing public key credentials that are not acceptable to the caller
  , authenticatorselection :: Maybe AuthenticatorSelection
  , hints :: Maybe (Array PublicKeyCredentialHints) -- Hints to help guide the user through the experience
  , attestation :: Maybe ConveyancePreference -- The attestation conveyance preference
  , attestationformats :: Maybe (Array AttestationFormat) -- The preferred attestation statement formats
  , extensions :: Maybe J.JObject -- Additional parameters requesting additional processing by the client and authenticator
  }

publickeycredentialcreationoptionsCodec :: CJ.Codec PublicKeyCredentialCreationOptions
publickeycredentialcreationoptionsCodec =
  CJ.object $ CJR.record
    { rp: CJ.identity relyingpartyentityCodec
    , user: CJ.identity userentityCodec
    , challenge: CJ.identity CJ.string
    , pubkeycredparams: CJ.identity CJ.array credentialparameterCodec
    , timeout: CJR.optional CJ.int
    , excludecredentials: CJR.optional CJ.array publickeycredentialdescriptorCodec
    , authenticatorselection: CJR.optional authenticatorselectionCodec
    , hints: CJR.optional CJ.array publickeycredentialhintsCodec
    , attestation: CJR.optional conveyancepreferenceCodec
    , attestationformats: CJR.optional CJ.array attestationformatCodec
    , extensions: CJR.optional CJ.jobject
    }

-- |
-- | * `type_`: `CredentialType` - The valid credential types
-- | * `id`: `String` - Base64url-encoded binary data
-- | * `transports` (Optional): `Maybe (Array AuthenticatorTransport)` - The authenticator transports that can be used
type PublicKeyCredentialDescriptor =
  { type_ :: CredentialType -- The valid credential types
  , id :: String -- Base64url-encoded binary data
  , transports :: Maybe (Array AuthenticatorTransport) -- The authenticator transports that can be used
  }

publickeycredentialdescriptorCodec :: CJ.Codec PublicKeyCredentialDescriptor
publickeycredentialdescriptorCodec =
  CJ.object $ CJR.record
    { type_: CJ.identity credentialtypeCodec
    , id: CJ.identity CJ.string
    , transports: CJR.optional CJ.array authenticatortransportCodec
    }

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
-- | * `challenge`: `String` - Base64url-encoded binary data
-- | * `timeout` (Optional): `Maybe Int` - A time, in milliseconds, that the caller is willing to wait for the call to complete
-- | * `rpid` (Optional): `Maybe String` - The RP ID the credential should be scoped to
-- | * `allowcredentials` (Optional): `Maybe (Array PublicKeyCredentialDescriptor)` - A list of CredentialDescriptor objects representing public key credentials acceptable to the caller
-- | * `userverification` (Optional): `Maybe UserVerificationRequirement` - A requirement for user verification for the operation
-- | * `hints` (Optional): `Maybe (Array PublicKeyCredentialHints)` - Hints to help guide the user through the experience
-- | * `extensions` (Optional): `Maybe J.JObject` - Additional parameters requesting additional processing by the client and authenticator
type PublicKeyCredentialRequestOptions =
  { challenge :: String -- Base64url-encoded binary data
  , timeout :: Maybe Int -- A time, in milliseconds, that the caller is willing to wait for the call to complete
  , rpid :: Maybe String -- The RP ID the credential should be scoped to
  , allowcredentials :: Maybe (Array PublicKeyCredentialDescriptor) -- A list of CredentialDescriptor objects representing public key credentials acceptable to the caller
  , userverification :: Maybe UserVerificationRequirement -- A requirement for user verification for the operation
  , hints :: Maybe (Array PublicKeyCredentialHints) -- Hints to help guide the user through the experience
  , extensions :: Maybe J.JObject -- Additional parameters requesting additional processing by the client and authenticator
  }

publickeycredentialrequestoptionsCodec :: CJ.Codec PublicKeyCredentialRequestOptions
publickeycredentialrequestoptionsCodec =
  CJ.object $ CJR.record
    { challenge: CJ.identity CJ.string
    , timeout: CJR.optional CJ.int
    , rpid: CJR.optional CJ.string
    , allowcredentials: CJR.optional CJ.array publickeycredentialdescriptorCodec
    , userverification: CJR.optional userverificationrequirementCodec
    , hints: CJR.optional CJ.array publickeycredentialhintsCodec
    , extensions: CJR.optional CJ.jobject
    }

-- | Request to refresh an access token
-- |
-- | * `refreshtoken`: `String` - Refresh token used to generate a new access token
type RefreshTokenRequest =
  { refreshtoken :: String -- Refresh token used to generate a new access token
  }

refreshtokenrequestCodec :: CJ.Codec RefreshTokenRequest
refreshtokenrequestCodec =
  CJ.object $ CJR.record
    { refreshtoken: CJ.identity CJ.string
    }

-- |
-- | * `name`: `String` - A human-palatable name for the entity
-- | * `id`: `String` - A unique identifier for the Relying Party entity, which sets the RP ID
type RelyingPartyEntity =
  { name :: String -- A human-palatable name for the entity
  , id :: String -- A unique identifier for the Relying Party entity, which sets the RP ID
  }

relyingpartyentityCodec :: CJ.Codec RelyingPartyEntity
relyingpartyentityCodec =
  CJ.object $ CJR.record
    { name: CJ.identity CJ.string
    , id: CJ.identity CJ.string
    }

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
-- | * `accesstoken`: `String` - JWT token for authenticating API requests
-- | * `accesstokenexpiresin`: `Int` - Expiration time of the access token in seconds
-- | * `refreshtokenid`: `String` - Identifier for the refresh token
-- | * `refreshtoken`: `String` - Token used to refresh the access token
-- | * `user` (Optional): `Maybe User` - User profile and account information
type Session =
  { accesstoken :: String -- JWT token for authenticating API requests
  , accesstokenexpiresin :: Int -- Expiration time of the access token in seconds
  , refreshtokenid :: String -- Identifier for the refresh token
  , refreshtoken :: String -- Token used to refresh the access token
  , user :: Maybe User -- User profile and account information
  }

sessionCodec :: CJ.Codec Session
sessionCodec =
  CJ.object $ CJR.record
    { accesstoken: CJ.identity CJ.string
    , accesstokenexpiresin: CJ.identity CJ.int
    , refreshtokenid: CJ.identity CJ.string
    , refreshtoken: CJ.identity CJ.string
    , user: CJR.optional userCodec
    }

-- | Container for session information
-- |
-- | * `session` (Optional): `Maybe Session` - User authentication session containing tokens and user information
type SessionPayload =
  { session :: Maybe Session -- User authentication session containing tokens and user information
  }

sessionpayloadCodec :: CJ.Codec SessionPayload
sessionpayloadCodec =
  CJ.object $ CJR.record
    { session: CJR.optional sessionCodec
    }

-- |
-- | * `displayname` (Optional): `Maybe String`
-- | * `locale` (Optional): `Maybe String` - A two-characters locale
-- | * `metadata` (Optional): `Maybe J.JObject`
type SignInAnonymousRequest =
  { displayname :: Maybe String
  , locale :: Maybe String -- A two-characters locale
  , metadata :: Maybe J.JObject
  }

signinanonymousrequestCodec :: CJ.Codec SignInAnonymousRequest
signinanonymousrequestCodec =
  CJ.object $ CJR.record
    { displayname: CJR.optional CJ.string
    , locale: CJR.optional CJ.string
    , metadata: CJR.optional CJ.jobject
    }

-- | Request to authenticate using email and password
-- |
-- | * `email`: `String` - User's email address
-- | * `password`: `String` - User's password
type SignInEmailPasswordRequest =
  { email :: String -- User's email address
  , password :: String -- User's password
  }

signinemailpasswordrequestCodec :: CJ.Codec SignInEmailPasswordRequest
signinemailpasswordrequestCodec =
  CJ.object $ CJR.record
    { email: CJ.identity CJ.string
    , password: CJ.identity CJ.string
    }

-- | Response for email-password authentication that may include a session or MFA challenge
-- |
-- | * `session` (Optional): `Maybe Session` - User authentication session containing tokens and user information
-- | * `mfa` (Optional): `Maybe MFAChallengePayload` - Challenge payload for multi-factor authentication
type SignInEmailPasswordResponse =
  { session :: Maybe Session -- User authentication session containing tokens and user information
  , mfa :: Maybe MFAChallengePayload -- Challenge payload for multi-factor authentication
  }

signinemailpasswordresponseCodec :: CJ.Codec SignInEmailPasswordResponse
signinemailpasswordresponseCodec =
  CJ.object $ CJR.record
    { session: CJR.optional sessionCodec
    , mfa: CJR.optional mfachallengepayloadCodec
    }

-- |
-- | * `provider`: `IdTokenProvider`
-- | * `idtoken`: `String` - Apple ID token
-- | * `nonce` (Optional): `Maybe String` - Nonce used during sign in process
-- | * `options` (Optional): `Maybe SignUpOptions`
type SignInIdTokenRequest =
  { provider :: IdTokenProvider
  , idtoken :: String -- Apple ID token
  , nonce :: Maybe String -- Nonce used during sign in process
  , options :: Maybe SignUpOptions
  }

signinidtokenrequestCodec :: CJ.Codec SignInIdTokenRequest
signinidtokenrequestCodec =
  CJ.object $ CJR.record
    { provider: CJ.identity idtokenproviderCodec
    , idtoken: CJ.identity CJ.string
    , nonce: CJR.optional CJ.string
    , options: CJR.optional signupoptionsCodec
    }

-- |
-- | * `ticket`: `String` - Ticket
-- | * `otp`: `String` - One time password
type SignInMfaTotpRequest =
  { ticket :: String -- Ticket
  , otp :: String -- One time password
  }

signinmfatotprequestCodec :: CJ.Codec SignInMfaTotpRequest
signinmfatotprequestCodec =
  CJ.object $ CJR.record
    { ticket: CJ.identity CJ.string
    , otp: CJ.identity CJ.string
    }

-- |
-- | * `email`: `String` - A valid email
-- | * `options` (Optional): `Maybe SignUpOptions`
type SignInOTPEmailRequest =
  { email :: String -- A valid email
  , options :: Maybe SignUpOptions
  }

signinotpemailrequestCodec :: CJ.Codec SignInOTPEmailRequest
signinotpemailrequestCodec =
  CJ.object $ CJR.record
    { email: CJ.identity CJ.string
    , options: CJR.optional signupoptionsCodec
    }

-- |
-- | * `otp`: `String` - One time password
-- | * `email`: `String` - A valid email
type SignInOTPEmailVerifyRequest =
  { otp :: String -- One time password
  , email :: String -- A valid email
  }

signinotpemailverifyrequestCodec :: CJ.Codec SignInOTPEmailVerifyRequest
signinotpemailverifyrequestCodec =
  CJ.object $ CJR.record
    { otp: CJ.identity CJ.string
    , email: CJ.identity CJ.string
    }

-- |
-- | * `session` (Optional): `Maybe Session` - User authentication session containing tokens and user information
type SignInOTPEmailVerifyResponse =
  { session :: Maybe Session -- User authentication session containing tokens and user information
  }

signinotpemailverifyresponseCodec :: CJ.Codec SignInOTPEmailVerifyResponse
signinotpemailverifyresponseCodec =
  CJ.object $ CJR.record
    { session: CJR.optional sessionCodec
    }

-- |
-- | * `personalaccesstoken`: `String` - PAT
type SignInPATRequest =
  { personalaccesstoken :: String -- PAT
  }

signinpatrequestCodec :: CJ.Codec SignInPATRequest
signinpatrequestCodec =
  CJ.object $ CJR.record
    { personalaccesstoken: CJ.identity CJ.string
    }

-- |
-- | * `email`: `String` - A valid email
-- | * `options` (Optional): `Maybe SignUpOptions`
type SignInPasswordlessEmailRequest =
  { email :: String -- A valid email
  , options :: Maybe SignUpOptions
  }

signinpasswordlessemailrequestCodec :: CJ.Codec SignInPasswordlessEmailRequest
signinpasswordlessemailrequestCodec =
  CJ.object $ CJR.record
    { email: CJ.identity CJ.string
    , options: CJR.optional signupoptionsCodec
    }

-- |
-- | * `phonenumber`: `String` - Phone number of the user
-- | * `otp`: `String` - One-time password received by SMS
type SignInPasswordlessSmsOtpRequest =
  { phonenumber :: String -- Phone number of the user
  , otp :: String -- One-time password received by SMS
  }

signinpasswordlesssmsotprequestCodec :: CJ.Codec SignInPasswordlessSmsOtpRequest
signinpasswordlesssmsotprequestCodec =
  CJ.object $ CJR.record
    { phonenumber: CJ.identity CJ.string
    , otp: CJ.identity CJ.string
    }

-- |
-- | * `session` (Optional): `Maybe Session` - User authentication session containing tokens and user information
-- | * `mfa` (Optional): `Maybe MFAChallengePayload` - Challenge payload for multi-factor authentication
type SignInPasswordlessSmsOtpResponse =
  { session :: Maybe Session -- User authentication session containing tokens and user information
  , mfa :: Maybe MFAChallengePayload -- Challenge payload for multi-factor authentication
  }

signinpasswordlesssmsotpresponseCodec :: CJ.Codec SignInPasswordlessSmsOtpResponse
signinpasswordlesssmsotpresponseCodec =
  CJ.object $ CJR.record
    { session: CJR.optional sessionCodec
    , mfa: CJR.optional mfachallengepayloadCodec
    }

-- |
-- | * `phonenumber`: `String` - Phone number of the user
-- | * `options` (Optional): `Maybe SignUpOptions`
type SignInPasswordlessSmsRequest =
  { phonenumber :: String -- Phone number of the user
  , options :: Maybe SignUpOptions
  }

signinpasswordlesssmsrequestCodec :: CJ.Codec SignInPasswordlessSmsRequest
signinpasswordlesssmsrequestCodec =
  CJ.object $ CJR.record
    { phonenumber: CJ.identity CJ.string
    , options: CJR.optional signupoptionsCodec
    }

-- |
-- | * `email` (Optional): `Maybe String` - A valid email
type SignInWebauthnRequest =
  { email :: Maybe String -- A valid email
  }

signinwebauthnrequestCodec :: CJ.Codec SignInWebauthnRequest
signinwebauthnrequestCodec =
  CJ.object $ CJR.record
    { email: CJR.optional CJ.string
    }

-- |
-- | * `email` (Optional): `Maybe String` - A valid email. Deprecated, no longer used
-- | * `credential`: `CredentialAssertionResponse`
type SignInWebauthnVerifyRequest =
  { email :: Maybe String -- A valid email. Deprecated, no longer used
  , credential :: CredentialAssertionResponse
  }

signinwebauthnverifyrequestCodec :: CJ.Codec SignInWebauthnVerifyRequest
signinwebauthnverifyrequestCodec =
  CJ.object $ CJR.record
    { email: CJR.optional CJ.string
    , credential: CJ.identity credentialassertionresponseCodec
    }

-- |
-- | * `refreshtoken` (Optional): `Maybe String` - Refresh token for the current session
-- | * `all` (Optional): `Maybe Boolean` - Sign out from all connected devices
type SignOutRequest =
  { refreshtoken :: Maybe String -- Refresh token for the current session
  , all :: Maybe Boolean -- Sign out from all connected devices
  }

signoutrequestCodec :: CJ.Codec SignOutRequest
signoutrequestCodec =
  CJ.object $ CJR.record
    { refreshtoken: CJR.optional CJ.string
    , all: CJR.optional CJ.boolean
    }

-- | Request to register a new user with email and password
-- |
-- | * `email`: `String` - Email address for the new user account
-- | * `password`: `String` - Password for the new user account
-- | * `options` (Optional): `Maybe SignUpOptions`
type SignUpEmailPasswordRequest =
  { email :: String -- Email address for the new user account
  , password :: String -- Password for the new user account
  , options :: Maybe SignUpOptions
  }

signupemailpasswordrequestCodec :: CJ.Codec SignUpEmailPasswordRequest
signupemailpasswordrequestCodec =
  CJ.object $ CJR.record
    { email: CJ.identity CJ.string
    , password: CJ.identity CJ.string
    , options: CJR.optional signupoptionsCodec
    }

-- |
-- | * `allowedroles` (Optional): `Maybe (Array String)`
-- | * `defaultrole` (Optional): `Maybe String`
-- | * `displayname` (Optional): `Maybe String`
-- | * `locale` (Optional): `Maybe String` - A two-characters locale
-- | * `metadata` (Optional): `Maybe J.JObject`
-- | * `redirectto` (Optional): `Maybe String`
type SignUpOptions =
  { allowedroles :: Maybe (Array String)
  , defaultrole :: Maybe String
  , displayname :: Maybe String
  , locale :: Maybe String -- A two-characters locale
  , metadata :: Maybe J.JObject
  , redirectto :: Maybe String
  }

signupoptionsCodec :: CJ.Codec SignUpOptions
signupoptionsCodec =
  CJ.object $ CJR.record
    { allowedroles: CJR.optional CJ.array CJ.string
    , defaultrole: CJR.optional CJ.string
    , displayname: CJR.optional CJ.string
    , locale: CJR.optional CJ.string
    , metadata: CJR.optional CJ.jobject
    , redirectto: CJR.optional CJ.string
    }

-- |
-- | * `email`: `String` - A valid email
-- | * `options` (Optional): `Maybe SignUpOptions`
type SignUpWebauthnRequest =
  { email :: String -- A valid email
  , options :: Maybe SignUpOptions
  }

signupwebauthnrequestCodec :: CJ.Codec SignUpWebauthnRequest
signupwebauthnrequestCodec =
  CJ.object $ CJR.record
    { email: CJ.identity CJ.string
    , options: CJR.optional signupoptionsCodec
    }

-- |
-- | * `credential`: `CredentialCreationResponse`
-- | * `options` (Optional): `Maybe SignUpOptions`
-- | * `nickname` (Optional): `Maybe String` - Nickname for the security key
type SignUpWebauthnVerifyRequest =
  { credential :: CredentialCreationResponse
  , options :: Maybe SignUpOptions
  , nickname :: Maybe String -- Nickname for the security key
  }

signupwebauthnverifyrequestCodec :: CJ.Codec SignUpWebauthnVerifyRequest
signupwebauthnverifyrequestCodec =
  CJ.object $ CJR.record
    { credential: CJ.identity credentialcreationresponseCodec
    , options: CJR.optional signupoptionsCodec
    , nickname: CJR.optional CJ.string
    }

-- | Response containing TOTP setup information for MFA
-- |
-- | * `imageurl`: `String` - URL to QR code image for scanning with an authenticator app
-- | * `totpsecret`: `String` - TOTP secret key for manual setup with an authenticator app
type TotpGenerateResponse =
  { imageurl :: String -- URL to QR code image for scanning with an authenticator app
  , totpsecret :: String -- TOTP secret key for manual setup with an authenticator app
  }

totpgenerateresponseCodec :: CJ.Codec TotpGenerateResponse
totpgenerateresponseCodec =
  CJ.object $ CJR.record
    { imageurl: CJ.identity CJ.string
    , totpsecret: CJ.identity CJ.string
    }

-- | Base64url-encoded binary data
type URLEncodedBase64 = String

urlencodedbase64Codec :: CJ.Codec URLEncodedBase64
urlencodedbase64Codec = CJ.string

-- | User profile and account information
-- |
-- | * `avatarurl`: `String` - URL to the user's profile picture
-- | * `createdat`: `String` - Timestamp when the user account was created
-- | * `defaultrole`: `String` - Default authorization role for the user
-- | * `displayname`: `String` - User's display name
-- | * `email` (Optional): `Maybe String` - User's email address
-- | * `emailverified`: `Boolean` - Whether the user's email has been verified
-- | * `id`: `String` - Unique identifier for the user
-- | * `isanonymous`: `Boolean` - Whether this is an anonymous user account
-- | * `locale`: `String` - User's preferred locale (language code)
-- | * `metadata`: `J.JObject` - Custom metadata associated with the user
-- | * `phonenumber` (Optional): `Maybe String` - User's phone number
-- | * `phonenumberverified`: `Boolean` - Whether the user's phone number has been verified
-- | * `roles`: `Array String` - List of roles assigned to the user
-- | * `activemfatype` (Optional): `Maybe String` - Active MFA type for the user
type User =
  { avatarurl :: String -- URL to the user's profile picture
  , createdat :: String -- Timestamp when the user account was created
  , defaultrole :: String -- Default authorization role for the user
  , displayname :: String -- User's display name
  , email :: Maybe String -- User's email address
  , emailverified :: Boolean -- Whether the user's email has been verified
  , id :: String -- Unique identifier for the user
  , isanonymous :: Boolean -- Whether this is an anonymous user account
  , locale :: String -- User's preferred locale (language code)
  , metadata :: J.JObject -- Custom metadata associated with the user
  , phonenumber :: Maybe String -- User's phone number
  , phonenumberverified :: Boolean -- Whether the user's phone number has been verified
  , roles :: Array String -- List of roles assigned to the user
  , activemfatype :: Maybe String -- Active MFA type for the user
  }

userCodec :: CJ.Codec User
userCodec =
  CJ.object $ CJR.record
    { avatarurl: CJ.identity CJ.string
    , createdat: CJ.identity CJ.string
    , defaultrole: CJ.identity CJ.string
    , displayname: CJ.identity CJ.string
    , email: CJR.optional CJ.string
    , emailverified: CJ.identity CJ.boolean
    , id: CJ.identity CJ.string
    , isanonymous: CJ.identity CJ.boolean
    , locale: CJ.identity CJ.string
    , metadata: CJ.identity CJ.jobject
    , phonenumber: CJR.optional CJ.string
    , phonenumberverified: CJ.identity CJ.boolean
    , roles: CJ.identity CJ.array CJ.string
    , activemfatype: CJR.optional CJ.string
    }

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
-- | * `signinmethod`: `UserDeanonymizeRequestSignInMethod` - Which sign-in method to use
-- | * `email`: `String` - A valid email
-- | * `password` (Optional): `Maybe String` - A password of minimum 3 characters
-- | * `connection` (Optional): `Maybe String` - Deprecated, will be ignored
-- | * `options` (Optional): `Maybe SignUpOptions`
type UserDeanonymizeRequest =
  { signinmethod :: UserDeanonymizeRequestSignInMethod -- Which sign-in method to use
  , email :: String -- A valid email
  , password :: Maybe String -- A password of minimum 3 characters
  , connection :: Maybe String -- Deprecated, will be ignored
  , options :: Maybe SignUpOptions
  }

userdeanonymizerequestCodec :: CJ.Codec UserDeanonymizeRequest
userdeanonymizerequestCodec =
  CJ.object $ CJR.record
    { signinmethod: CJ.identity userdeanonymizerequestsigninmethodCodec
    , email: CJ.identity CJ.string
    , password: CJR.optional CJ.string
    , connection: CJR.optional CJ.string
    , options: CJR.optional signupoptionsCodec
    }

-- |
-- | * `newemail`: `String` - A valid email
-- | * `options` (Optional): `Maybe OptionsRedirectTo`
type UserEmailChangeRequest =
  { newemail :: String -- A valid email
  , options :: Maybe OptionsRedirectTo
  }

useremailchangerequestCodec :: CJ.Codec UserEmailChangeRequest
useremailchangerequestCodec =
  CJ.object $ CJR.record
    { newemail: CJ.identity CJ.string
    , options: CJR.optional optionsredirecttoCodec
    }

-- |
-- | * `email`: `String` - A valid email
-- | * `options` (Optional): `Maybe OptionsRedirectTo`
type UserEmailSendVerificationEmailRequest =
  { email :: String -- A valid email
  , options :: Maybe OptionsRedirectTo
  }

useremailsendverificationemailrequestCodec :: CJ.Codec UserEmailSendVerificationEmailRequest
useremailsendverificationemailrequestCodec =
  CJ.object $ CJR.record
    { email: CJ.identity CJ.string
    , options: CJR.optional optionsredirecttoCodec
    }

-- |
-- | * `name`: `String` - A human-palatable name for the entity
-- | * `displayname`: `String` - A human-palatable name for the user account, intended only for display
-- | * `id`: `String` - The user handle of the user account entity
type UserEntity =
  { name :: String -- A human-palatable name for the entity
  , displayname :: String -- A human-palatable name for the user account, intended only for display
  , id :: String -- The user handle of the user account entity
  }

userentityCodec :: CJ.Codec UserEntity
userentityCodec =
  CJ.object $ CJR.record
    { name: CJ.identity CJ.string
    , displayname: CJ.identity CJ.string
    , id: CJ.identity CJ.string
    }

-- | Type of MFA to activate. Use empty string to disable MFA.
data UserMfaRequestActiveMfaType
  = UserMfaRequestActiveMfaType_Totp
  | UserMfaRequestActiveMfaType_Empty

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
    "" -> Just UserMfaRequestActiveMfaType_Empty
    _ -> Nothing

  enc = case _ of
    UserMfaRequestActiveMfaType_Totp -> "Totp"
    UserMfaRequestActiveMfaType_Empty -> ""

-- | Request to activate or deactivate multi-factor authentication
-- |
-- | * `code`: `String` - Verification code from the authenticator app when activating MFA
-- | * `activemfatype` (Optional): `Maybe UserMfaRequestActiveMfaType` - Type of MFA to activate. Use empty string to disable MFA.
type UserMfaRequest =
  { code :: String -- Verification code from the authenticator app when activating MFA
  , activemfatype :: Maybe UserMfaRequestActiveMfaType -- Type of MFA to activate. Use empty string to disable MFA.
  }

usermfarequestCodec :: CJ.Codec UserMfaRequest
usermfarequestCodec =
  CJ.object $ CJR.record
    { code: CJ.identity CJ.string
    , activemfatype: CJR.optional usermfarequestactivemfatypeCodec
    }

-- |
-- | * `newpassword`: `String` - A password of minimum 3 characters
-- | * `ticket` (Optional): `Maybe String` - Ticket to reset the password, required if the user is not authenticated
type UserPasswordRequest =
  { newpassword :: String -- A password of minimum 3 characters
  , ticket :: Maybe String -- Ticket to reset the password, required if the user is not authenticated
  }

userpasswordrequestCodec :: CJ.Codec UserPasswordRequest
userpasswordrequestCodec =
  CJ.object $ CJR.record
    { newpassword: CJ.identity CJ.string
    , ticket: CJR.optional CJ.string
    }

-- |
-- | * `email`: `String` - A valid email
-- | * `options` (Optional): `Maybe OptionsRedirectTo`
type UserPasswordResetRequest =
  { email :: String -- A valid email
  , options :: Maybe OptionsRedirectTo
  }

userpasswordresetrequestCodec :: CJ.Codec UserPasswordResetRequest
userpasswordresetrequestCodec =
  CJ.object $ CJR.record
    { email: CJ.identity CJ.string
    , options: CJR.optional optionsredirecttoCodec
    }

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
-- | * `credential`: `CredentialCreationResponse`
-- | * `nickname` (Optional): `Maybe String` - Optional nickname for the security key
type VerifyAddSecurityKeyRequest =
  { credential :: CredentialCreationResponse
  , nickname :: Maybe String -- Optional nickname for the security key
  }

verifyaddsecuritykeyrequestCodec :: CJ.Codec VerifyAddSecurityKeyRequest
verifyaddsecuritykeyrequestCodec =
  CJ.object $ CJR.record
    { credential: CJ.identity credentialcreationresponseCodec
    , nickname: CJR.optional CJ.string
    }

-- |
-- | * `id`: `String` - The ID of the newly added security key
-- | * `nickname` (Optional): `Maybe String` - The nickname of the security key if provided
type VerifyAddSecurityKeyResponse =
  { id :: String -- The ID of the newly added security key
  , nickname :: Maybe String -- The nickname of the security key if provided
  }

verifyaddsecuritykeyresponseCodec :: CJ.Codec VerifyAddSecurityKeyResponse
verifyaddsecuritykeyresponseCodec =
  CJ.object $ CJR.record
    { id: CJ.identity CJ.string
    , nickname: CJR.optional CJ.string
    }

-- |
-- | * `token` (Optional): `Maybe String` - JWT token to verify
type VerifyTokenRequest =
  { token :: Maybe String -- JWT token to verify
  }

verifytokenrequestCodec :: CJ.Codec VerifyTokenRequest
verifytokenrequestCodec =
  CJ.object $ CJR.record
    { token: CJR.optional CJ.string
    }

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
-- | * `version`: `String` - The version of the authentication service
type GetVersionResponse200 =
  { version :: String -- The version of the authentication service
  }

getversionresponse200Codec :: CJ.Codec GetVersionResponse200
getversionresponse200Codec =
  CJ.object $ CJR.record
    { version: CJ.identity CJ.string
    }

-- | Parameters for the SignInProvider method.
type SignInProviderParams =
  { allowedroles :: Maybe (Array String) -- Array of allowed roles for the user
  , defaultrole :: Maybe String -- Default role for the user
  , displayname :: Maybe String -- Display name for the user
  , locale :: Maybe String -- A two-characters locale
  , metadata :: Maybe J.JObject -- Additional metadata for the user (JSON encoded string)
  , redirectto :: Maybe String -- URI to redirect to
  , connect :: Maybe String -- If set, this means that the user is already authenticated and wants to link their account. This needs to be a valid JWT access token.
  }

signinproviderParamsCodec :: CJ.Codec SignInProviderParams
signinproviderParamsCodec =
  CJ.object $ CJR.record
    { allowedroles: CJ.maybe CJ.array CJ.string
    , defaultrole: CJ.maybe CJ.string
    , displayname: CJ.maybe CJ.string
    , locale: CJ.maybe CJ.string
    , metadata: CJ.maybe CJ.jobject
    , redirectto: CJ.maybe CJ.string
    , connect: CJ.maybe CJ.string
    }

-- | Parameters for the VerifyTicket method.
type VerifyTicketParams =
  { ticket :: TicketQuery -- Ticket
  , type_ :: Maybe TicketTypeQuery -- Type of the ticket. Deprecated, no longer used
  , redirectto :: RedirectToQuery -- Target URL for the redirect
  }

verifyticketParamsCodec :: CJ.Codec VerifyTicketParams
verifyticketParamsCodec =
  CJ.object $ CJR.record
    { ticket: ticketqueryCodec
    , type_: CJ.maybe tickettypequeryCodec
    , redirectto: redirecttoqueryCodec
    }

-- | API Client type
type APIClient fetchResponse =
  { getJWKs :: Aff (fetchResponse JWKSet)
  , elevateWebauthn :: Aff (fetchResponse PublicKeyCredentialRequestOptions)
  , verifyElevateWebauthn :: SignInWebauthnVerifyRequest -> Aff (fetchResponse SessionPayload)
  , healthCheckGet :: Aff (fetchResponse OKResponse)
  , healthCheckHead :: Aff (fetchResponse Unit)
  , linkIdToken :: LinkIdTokenRequest -> Aff (fetchResponse OKResponse)
  , changeUserMfa :: Aff (fetchResponse TotpGenerateResponse)
  , createPAT :: CreatePATRequest -> Aff (fetchResponse CreatePATResponse)
  , signInAnonymous :: Maybe SignInAnonymousRequest -> Aff (fetchResponse SessionPayload)
  , signInEmailPassword :: SignInEmailPasswordRequest -> Aff (fetchResponse SignInEmailPasswordResponse)
  , signInIdToken :: SignInIdTokenRequest -> Aff (fetchResponse SessionPayload)
  , verifySignInMfaTotp :: SignInMfaTotpRequest -> Aff (fetchResponse SessionPayload)
  , signInOTPEmail :: SignInOTPEmailRequest -> Aff (fetchResponse OKResponse)
  , verifySignInOTPEmail :: SignInOTPEmailVerifyRequest -> Aff (fetchResponse SignInOTPEmailVerifyResponse)
  , signInPasswordlessEmail :: SignInPasswordlessEmailRequest -> Aff (fetchResponse OKResponse)
  , signInPasswordlessSms :: SignInPasswordlessSmsRequest -> Aff (fetchResponse OKResponse)
  , verifySignInPasswordlessSms :: SignInPasswordlessSmsOtpRequest -> Aff (fetchResponse SignInPasswordlessSmsOtpResponse)
  , signInPAT :: SignInPATRequest -> Aff (fetchResponse SessionPayload)
  , signInProvider :: SignInProvider -> Maybe SignInProviderParams -> Aff (fetchResponse)
  , signInWebauthn :: Maybe SignInWebauthnRequest -> Aff (fetchResponse PublicKeyCredentialRequestOptions)
  , verifySignInWebauthn :: SignInWebauthnVerifyRequest -> Aff (fetchResponse SessionPayload)
  , signOut :: SignOutRequest -> Aff (fetchResponse OKResponse)
  , signUpEmailPassword :: SignUpEmailPasswordRequest -> Aff (fetchResponse SessionPayload)
  , signUpWebauthn :: SignUpWebauthnRequest -> Aff (fetchResponse PublicKeyCredentialCreationOptions)
  , verifySignUpWebauthn :: SignUpWebauthnVerifyRequest -> Aff (fetchResponse SessionPayload)
  , refreshToken :: RefreshTokenRequest -> Aff (fetchResponse Session)
  , verifyToken :: Maybe VerifyTokenRequest -> Aff (fetchResponse String)
  , getUser :: Aff (fetchResponse User)
  , deanonymizeUser :: UserDeanonymizeRequest -> Aff (fetchResponse OKResponse)
  , changeUserEmail :: UserEmailChangeRequest -> Aff (fetchResponse OKResponse)
  , sendVerificationEmail :: UserEmailSendVerificationEmailRequest -> Aff (fetchResponse OKResponse)
  , verifyChangeUserMfa :: UserMfaRequest -> Aff (fetchResponse OKResponse)
  , changeUserPassword :: UserPasswordRequest -> Aff (fetchResponse OKResponse)
  , sendPasswordResetEmail :: UserPasswordResetRequest -> Aff (fetchResponse OKResponse)
  , addSecurityKey :: Aff (fetchResponse PublicKeyCredentialCreationOptions)
  , verifyAddSecurityKey :: VerifyAddSecurityKeyRequest -> Aff (fetchResponse VerifyAddSecurityKeyResponse)
  , verifyTicket :: Maybe VerifyTicketParams -> Aff (fetchResponse)
  , getVersion :: Aff (fetchResponse GetVersionResponse200)
  }