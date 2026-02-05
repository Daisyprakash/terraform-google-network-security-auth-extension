/**
 * Copyright 2026 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "create_time" {
  description = "The timestamp when the resource was created."
  value       = google_network_services_authz_extension.this.create_time
}

output "id" {
  description = "The fully qualified identifier of the AuthzExtension resource."
  value       = google_network_services_authz_extension.this.id
}

output "name" {
  description = "The name of the created AuthzExtension resource."
  value       = google_network_services_authz_extension.this.name
}

output "update_time" {
  description = "The timestamp when the resource was last updated."
  value       = google_network_services_authz_extension.this.update_time
}