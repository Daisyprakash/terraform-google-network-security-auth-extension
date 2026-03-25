# Google Cloud Network Services AuthzExtension

This module creates a `google_network_services_authz_extension` resource, which allows for flexible authorization policies in a service mesh by integrating with an external gRPC authorizer. It is used to configure how traffic is authorized before it reaches a backend service.

## Usage

Here is a basic example of how to use this module:

```hcl
module "authz_extension" {
  source                  = "./" # Or a path to this module
  project_id              = "your-gcp-project-id"
  name                    = "my-custom-authz-extension"
  location                = "global"
  service                 = "projects/your-gcp-project-id/global/backendServices/my-ext-authz-backend-service"
  authority               = "auth.example.com"
  timeout                 = "5s"
  load_balancing_scheme   = "INTERNAL_MANAGED"
  description             = "Authorization extension for my service mesh."
  labels = {
    env = "production"
  }
}
```

## Requirements

The following requirements are needed by this module.

### Software

The following software is required:
- [Terraform](https://www.terraform.io/downloads.html) >= 1.3
- [Terraform Provider for GCP](https://github.com/hashicorp/terraform-provider-google) ~> 5.25

### APIs

The following APIs must be enabled on the project:
- [Network Services API](https://console.cloud.google.com/apis/library/networkservices.googleapis.com): `networkservices.googleapis.com`

### Permissions

The service account or user account executing Terraform must have the following permissions on the project:
- `networkservices.authzExtensions.create`
- `networkservices.authzExtensions.get`
- `networkservices.authzExtensions.update`
- `networkservices.authzExtensions.delete`

The predefined `roles/networkservices.admin` role contains the necessary permissions.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| authority | Required. The authority header of the gRPC request. | `string` | `"authz-ext.example.com"` | no |
| description | A free-text description of the resource. | `string` | `null` | no |
| fail\_open | Determines how the proxy behaves if the call to the extension fails. TRUE to continue, FALSE to error. | `bool` | `false` | no |
| forward\_headers | List of HTTP headers to forward to the extension. If omitted, all headers are sent. | `list(string)` | `null` | no |
| labels | A set of key/value label pairs to assign to the resource. | `map(string)` | `{}` | no |
| load\_balancing\_scheme | The load balancing scheme for which the AuthzExtension is applicable. Must be one of `INTERNAL_MANAGED` or `EXTERNAL_MANAGED`. | `string` | `null` | no |
| location | The location of the AuthzExtension resource. | `string` | n/a | yes |
| metadata | Metadata included as part of the ProcessingRequest message. Supports {forwarding\_rule\_id} substitution. | `map(string)` | `{}` | no |
| name | The name of the AuthzExtension resource. | `string` | `"my-authz-extension"` | no |
| project\_id | The ID of the project in which the resource belongs. If not provided, the provider project is used. | `string` | n/a | yes |
| service | The service that runs the extension (e.g., a BackendService URI or iap.googleapis.com). | `string` | n/a | yes |
| timeout | Specifies the timeout for each individual message on the stream (between 10-10000ms). Format: '0.1s'. | `string` | `"10s"` | no |
| wire\_format | The format of communication supported. Possible values: WIRE\_FORMAT\_UNSPECIFIED, EXT\_PROC\_GRPC, EXT\_AUTHZ\_GRPC. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| create\_time | The timestamp when the resource was created. |
| effective\_labels | All labels present on the resource in GCP, including those from Terraform and other sources. |
| id | The fully qualified identifier of the AuthzExtension resource. |
| name | The name of the created AuthzExtension resource. |
| terraform\_labels | The combination of labels configured directly on the resource and default provider labels. |
| update\_time | The timestamp when the resource was last updated. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->