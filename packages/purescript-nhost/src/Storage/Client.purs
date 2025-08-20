-- | This file is auto-generated. Do not edit manually.
module Storage.Client where

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

-- | Date in RFC 2822 format
type RFC2822Date = String

rfc2822dateCodec :: CJ.Codec RFC2822Date
rfc2822dateCodec = CJ.string

-- | Error details.
-- |
-- | * `message`: `String` - Human-readable error message.
-- | * `data_` (Optional): `Maybe J.JObject` - Additional data related to the error, if any.
type ErrorResponseError =
  { message :: String -- Human-readable error message.
  , data_ :: Maybe J.JObject -- Additional data related to the error, if any.
  }

errorresponseerrorCodec :: CJ.Codec ErrorResponseError
errorresponseerrorCodec =
  CJ.object $ CJR.record
    { message: CJ.identity CJ.string
    , data_: CJR.optional CJ.jobject
    }

-- | Error information returned by the API.
-- |
-- | * `error` (Optional): `Maybe ErrorResponseError` - Error details.
type ErrorResponse =
  { error :: Maybe ErrorResponseError -- Error details.
  }

errorresponseCodec :: CJ.Codec ErrorResponse
errorresponseCodec =
  CJ.object $ CJR.record
    { error: CJR.optional errorresponseerrorCodec
    }

-- | Error details.
-- |
-- | * `message`: `String` - Human-readable error message.
-- | * `data_` (Optional): `Maybe J.JObject` - Additional data related to the error, if any.
type ErrorResponseWithProcessedFilesError =
  { message :: String -- Human-readable error message.
  , data_ :: Maybe J.JObject -- Additional data related to the error, if any.
  }

errorresponsewithprocessedfileserrorCodec :: CJ.Codec ErrorResponseWithProcessedFilesError
errorresponsewithprocessedfileserrorCodec =
  CJ.object $ CJR.record
    { message: CJ.identity CJ.string
    , data_: CJR.optional CJ.jobject
    }

-- | Error information returned by the API.
-- |
-- | * `processedfiles` (Optional): `Maybe (Array FileMetadata)` - List of files that were successfully processed before the error occurred.
-- | * `error` (Optional): `Maybe ErrorResponseWithProcessedFilesError` - Error details.
type ErrorResponseWithProcessedFiles =
  { processedfiles :: Maybe (Array FileMetadata) -- List of files that were successfully processed before the error occurred.
  , error :: Maybe ErrorResponseWithProcessedFilesError -- Error details.
  }

errorresponsewithprocessedfilesCodec :: CJ.Codec ErrorResponseWithProcessedFiles
errorresponsewithprocessedfilesCodec =
  CJ.object $ CJR.record
    { processedfiles: CJR.optional CJ.array filemetadataCodec
    , error: CJR.optional errorresponsewithprocessedfileserrorCodec
    }

-- | Comprehensive metadata information about a file in storage.
-- |
-- | * `id`: `String` - Unique identifier for the file.
-- | * `name`: `String` - Name of the file including extension.
-- | * `size`: `Int` - Size of the file in bytes.
-- | * `bucketid`: `String` - ID of the bucket containing the file.
-- | * `etag`: `String` - Entity tag for cache validation.
-- | * `createdat`: `String` - Timestamp when the file was created.
-- | * `updatedat`: `String` - Timestamp when the file was last updated.
-- | * `isuploaded`: `Boolean` - Whether the file has been successfully uploaded.
-- | * `mimetype`: `String` - MIME type of the file.
-- | * `uploadedbyuserid` (Optional): `Maybe String` - ID of the user who uploaded the file.
-- | * `metadata` (Optional): `Maybe J.JObject` - Custom metadata associated with the file.
type FileMetadata =
  { id :: String -- Unique identifier for the file.
  , name :: String -- Name of the file including extension.
  , size :: Int -- Size of the file in bytes.
  , bucketid :: String -- ID of the bucket containing the file.
  , etag :: String -- Entity tag for cache validation.
  , createdat :: String -- Timestamp when the file was created.
  , updatedat :: String -- Timestamp when the file was last updated.
  , isuploaded :: Boolean -- Whether the file has been successfully uploaded.
  , mimetype :: String -- MIME type of the file.
  , uploadedbyuserid :: Maybe String -- ID of the user who uploaded the file.
  , metadata :: Maybe J.JObject -- Custom metadata associated with the file.
  }

filemetadataCodec :: CJ.Codec FileMetadata
filemetadataCodec =
  CJ.object $ CJR.record
    { id: CJ.identity CJ.string
    , name: CJ.identity CJ.string
    , size: CJ.identity CJ.int
    , bucketid: CJ.identity CJ.string
    , etag: CJ.identity CJ.string
    , createdat: CJ.identity CJ.string
    , updatedat: CJ.identity CJ.string
    , isuploaded: CJ.identity CJ.boolean
    , mimetype: CJ.identity CJ.string
    , uploadedbyuserid: CJR.optional CJ.string
    , metadata: CJR.optional CJ.jobject
    }

-- | Basic information about a file in storage.
-- |
-- | * `id`: `String` - Unique identifier for the file.
-- | * `name`: `String` - Name of the file including extension.
-- | * `bucketid`: `String` - ID of the bucket containing the file.
-- | * `isuploaded`: `Boolean` - Whether the file has been successfully uploaded.
type FileSummary =
  { id :: String -- Unique identifier for the file.
  , name :: String -- Name of the file including extension.
  , bucketid :: String -- ID of the bucket containing the file.
  , isuploaded :: Boolean -- Whether the file has been successfully uploaded.
  }

filesummaryCodec :: CJ.Codec FileSummary
filesummaryCodec =
  CJ.object $ CJR.record
    { id: CJ.identity CJ.string
    , name: CJ.identity CJ.string
    , bucketid: CJ.identity CJ.string
    , isuploaded: CJ.identity CJ.boolean
    }

-- | Contains a presigned URL for direct file operations.
-- |
-- | * `url`: `String` - The presigned URL for file operations.
-- | * `expiration`: `Int` - The time in seconds until the URL expires.
type PresignedURLResponse =
  { url :: String -- The presigned URL for file operations.
  , expiration :: Int -- The time in seconds until the URL expires.
  }

presignedurlresponseCodec :: CJ.Codec PresignedURLResponse
presignedurlresponseCodec =
  CJ.object $ CJR.record
    { url: CJ.identity CJ.string
    , expiration: CJ.identity CJ.int
    }

-- | Metadata that can be updated for an existing file.
-- |
-- | * `name` (Optional): `Maybe String` - New name to assign to the file.
-- | * `metadata` (Optional): `Maybe J.JObject` - Updated custom metadata to associate with the file.
type UpdateFileMetadata =
  { name :: Maybe String -- New name to assign to the file.
  , metadata :: Maybe J.JObject -- Updated custom metadata to associate with the file.
  }

updatefilemetadataCodec :: CJ.Codec UpdateFileMetadata
updatefilemetadataCodec =
  CJ.object $ CJR.record
    { name: CJR.optional CJ.string
    , metadata: CJR.optional CJ.jobject
    }

-- | Metadata provided when uploading a new file.
-- |
-- | * `id` (Optional): `Maybe String` - Optional custom ID for the file. If not provided, a UUID will be generated.
-- | * `name` (Optional): `Maybe String` - Name to assign to the file. If not provided, the original filename will be used.
-- | * `metadata` (Optional): `Maybe J.JObject` - Custom metadata to associate with the file.
type UploadFileMetadata =
  { id :: Maybe String -- Optional custom ID for the file. If not provided, a UUID will be generated.
  , name :: Maybe String -- Name to assign to the file. If not provided, the original filename will be used.
  , metadata :: Maybe J.JObject -- Custom metadata to associate with the file.
  }

uploadfilemetadataCodec :: CJ.Codec UploadFileMetadata
uploadfilemetadataCodec =
  CJ.object $ CJR.record
    { id: CJR.optional CJ.string
    , name: CJR.optional CJ.string
    , metadata: CJR.optional CJ.jobject
    }

-- | Contains version information about the storage service.
-- |
-- | * `buildversion`: `String` - The version number of the storage service build.
type VersionInformation =
  { buildversion :: String -- The version number of the storage service build.
  }

versioninformationCodec :: CJ.Codec VersionInformation
versioninformationCodec =
  CJ.object $ CJR.record
    { buildversion: CJ.identity CJ.string
    }

-- | Output format for image files. Use 'auto' for content negotiation based on Accept header
data OutputImageFormat
  = OutputImageFormat_Auto
  | OutputImageFormat_Same
  | OutputImageFormat_Jpeg
  | OutputImageFormat_Webp
  | OutputImageFormat_Png
  | OutputImageFormat_Avif

derive instance genericOutputImageFormat :: Generic OutputImageFormat _
derive instance eqOutputImageFormat :: Eq OutputImageFormat
derive instance ordOutputImageFormat :: Ord OutputImageFormat

instance showOutputImageFormat :: Show OutputImageFormat where
  show = genericShow

outputimageformatCodec :: CJ.Codec OutputImageFormat
outputimageformatCodec = CJ.prismaticCodec "OutputImageFormat" dec enc CJ.string
  where
  dec = case _ of
    "Auto" -> Just OutputImageFormat_Auto
    "Same" -> Just OutputImageFormat_Same
    "Jpeg" -> Just OutputImageFormat_Jpeg
    "Webp" -> Just OutputImageFormat_Webp
    "Png" -> Just OutputImageFormat_Png
    "Avif" -> Just OutputImageFormat_Avif
    _ -> Nothing

  enc = case _ of
    OutputImageFormat_Auto -> "Auto"
    OutputImageFormat_Same -> "Same"
    OutputImageFormat_Jpeg -> "Jpeg"
    OutputImageFormat_Webp -> "Webp"
    OutputImageFormat_Png -> "Png"
    OutputImageFormat_Avif -> "Avif"

-- |
-- | * `bucketid` (Optional): `Maybe String` - Target bucket identifier where files will be stored.
-- | * `metadataarray` (Optional): `Maybe (Array UploadFileMetadata)` - Optional custom metadata for each uploaded file. Must match the order of the file[] array.
-- | * `filearray`: `Array Blob` - Array of files to upload.
type UploadFilesBody =
  { bucketid :: Maybe String -- Target bucket identifier where files will be stored.
  , metadataarray :: Maybe (Array UploadFileMetadata) -- Optional custom metadata for each uploaded file. Must match the order of the file[] array.
  , filearray :: Array Blob -- Array of files to upload.
  }

uploadfilesbodyCodec :: CJ.Codec UploadFilesBody
uploadfilesbodyCodec =
  CJ.object $ CJR.record
    { bucketid: CJR.optional CJ.string
    , metadataarray: CJR.optional CJ.array uploadfilemetadataCodec
    , filearray: CJ.identity CJ.array CJ.string -- Blob as base64 string
    }

-- |
-- | * `processedfiles`: `Array FileMetadata` - List of successfully processed files with their metadata.
type UploadFilesResponse201 =
  { processedfiles :: Array FileMetadata -- List of successfully processed files with their metadata.
  }

uploadfilesresponse201Codec :: CJ.Codec UploadFilesResponse201
uploadfilesresponse201Codec =
  CJ.object $ CJR.record
    { processedfiles: CJ.identity CJ.array filemetadataCodec
    }

-- |
-- | * `metadata` (Optional): `Maybe UpdateFileMetadata` - Metadata that can be updated for an existing file.
-- | * `file` (Optional): `Maybe Blob` - New file content to replace the existing file
type ReplaceFileBody =
  { metadata :: Maybe UpdateFileMetadata -- Metadata that can be updated for an existing file.
  , file :: Maybe Blob -- New file content to replace the existing file
  }

replacefilebodyCodec :: CJ.Codec ReplaceFileBody
replacefilebodyCodec =
  CJ.object $ CJR.record
    { metadata: CJR.optional updatefilemetadataCodec
    , file: CJR.optional CJ.string -- Blob as base64 string
    }

-- |
-- | * `metadata` (Optional): `Maybe (Array FileSummary)`
type DeleteBrokenMetadataResponse200 =
  { metadata :: Maybe (Array FileSummary)
  }

deletebrokenmetadataresponse200Codec :: CJ.Codec DeleteBrokenMetadataResponse200
deletebrokenmetadataresponse200Codec =
  CJ.object $ CJR.record
    { metadata: CJR.optional CJ.array filesummaryCodec
    }

-- |
-- | * `files` (Optional): `Maybe (Array String)`
type DeleteOrphanedFilesResponse200 =
  { files :: Maybe (Array String)
  }

deleteorphanedfilesresponse200Codec :: CJ.Codec DeleteOrphanedFilesResponse200
deleteorphanedfilesresponse200Codec =
  CJ.object $ CJR.record
    { files: CJR.optional CJ.array CJ.string
    }

-- |
-- | * `metadata` (Optional): `Maybe (Array FileSummary)`
type ListBrokenMetadataResponse200 =
  { metadata :: Maybe (Array FileSummary)
  }

listbrokenmetadataresponse200Codec :: CJ.Codec ListBrokenMetadataResponse200
listbrokenmetadataresponse200Codec =
  CJ.object $ CJR.record
    { metadata: CJR.optional CJ.array filesummaryCodec
    }

-- |
-- | * `metadata` (Optional): `Maybe (Array FileSummary)`
type ListFilesNotUploadedResponse200 =
  { metadata :: Maybe (Array FileSummary)
  }

listfilesnotuploadedresponse200Codec :: CJ.Codec ListFilesNotUploadedResponse200
listfilesnotuploadedresponse200Codec =
  CJ.object $ CJR.record
    { metadata: CJR.optional CJ.array filesummaryCodec
    }

-- |
-- | * `files` (Optional): `Maybe (Array String)`
type ListOrphanedFilesResponse200 =
  { files :: Maybe (Array String)
  }

listorphanedfilesresponse200Codec :: CJ.Codec ListOrphanedFilesResponse200
listorphanedfilesresponse200Codec =
  CJ.object $ CJR.record
    { files: CJR.optional CJ.array CJ.string
    }

-- | Parameters for the GetFile method.
type GetFileParams =
  { q :: Maybe Int -- Image quality (1-100). Only applies to JPEG, WebP and PNG files
  , h :: Maybe Int -- Maximum height to resize image to while maintaining aspect ratio. Only applies to image files
  , w :: Maybe Int -- Maximum width to resize image to while maintaining aspect ratio. Only applies to image files
  , b :: Maybe Number -- Blur the image using this sigma value. Only applies to image files
  , f :: Maybe OutputImageFormat -- Output format for image files. Use 'auto' for content negotiation based on Accept header
  }

getfileParamsCodec :: CJ.Codec GetFileParams
getfileParamsCodec =
  CJ.object $ CJR.record
    { q: CJ.maybe CJ.int
    , h: CJ.maybe CJ.int
    , w: CJ.maybe CJ.int
    , b: CJ.maybe CJ.number
    , f: CJ.maybe outputimageformatCodec
    }

-- | Parameters for the GetFileMetadataHeaders method.
type GetFileMetadataHeadersParams =
  { q :: Maybe Int -- Image quality (1-100). Only applies to JPEG, WebP and PNG files
  , h :: Maybe Int -- Maximum height to resize image to while maintaining aspect ratio. Only applies to image files
  , w :: Maybe Int -- Maximum width to resize image to while maintaining aspect ratio. Only applies to image files
  , b :: Maybe Number -- Blur the image using this sigma value. Only applies to image files
  , f :: Maybe OutputImageFormat -- Output format for image files. Use 'auto' for content negotiation based on Accept header
  }

getfilemetadataheadersParamsCodec :: CJ.Codec GetFileMetadataHeadersParams
getfilemetadataheadersParamsCodec =
  CJ.object $ CJR.record
    { q: CJ.maybe CJ.int
    , h: CJ.maybe CJ.int
    , w: CJ.maybe CJ.int
    , b: CJ.maybe CJ.number
    , f: CJ.maybe outputimageformatCodec
    }

-- | API Client type
type APIClient fetchResponse =
  { uploadFiles :: UploadFilesBody -> Aff (fetchResponse UploadFilesResponse201)
  , deleteFile :: String -> Aff (fetchResponse Unit)
  , getFile :: String -> Maybe GetFileParams -> Aff (fetchResponse Blob)
  , getFileMetadataHeaders :: String -> Maybe GetFileMetadataHeadersParams -> Aff (fetchResponse Unit)
  , replaceFile :: String -> ReplaceFileBody -> Aff (fetchResponse FileMetadata)
  , getFilePresignedURL :: String -> Aff (fetchResponse PresignedURLResponse)
  , deleteBrokenMetadata :: Aff (fetchResponse DeleteBrokenMetadataResponse200)
  , deleteOrphanedFiles :: Aff (fetchResponse DeleteOrphanedFilesResponse200)
  , listBrokenMetadata :: Aff (fetchResponse ListBrokenMetadataResponse200)
  , listFilesNotUploaded :: Aff (fetchResponse ListFilesNotUploadedResponse200)
  , listOrphanedFiles :: Aff (fetchResponse ListOrphanedFilesResponse200)
  , getVersion :: Aff (fetchResponse VersionInformation)
  }