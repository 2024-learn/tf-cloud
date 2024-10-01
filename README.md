# Terraform Cloud
- `terraform login`: opens browser where you can generate a token. you can then post this token on the CLI and authenticate the CLI with the cloud
- `export TOKEN=F34qzMyPwZP9fg.......`
- `curl --header "Authorization: Bearer $TOKEN" --header "Content-Type: application/vnd.api+json" --request GET https://app.terraform.io/api/v2/organizations/likimani-tf-cloud | jq `: Displays the organization's metadata
- `terraform logout`
- Authenticating with the cloud:
  - Created Service account for terraform. Created keys. Granted the role: `roles/iam.serviceAccountTokenCreator`
    - Authenticating with GCP on Terraform cloud. Other roles given: Viewer, Editor: <https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#using-terraform-cloud> 
  - AWS credentials added as variables. Remember to mark the secret access key as sensitive!
    - Add the variables in a `variables.tf` file
      
      ```
        variable "AWS_ACCESS_KEY_ID"{}
        variable "AWS_SECRET_ACCESS_KEY" {}
        variable "GOOGLE_CREDENTIALS"{}
      ```

## Authenticate TF cloud with the VCS:
  - Organization > Settings > Version Control > Providers > Add a VCS Provider
    - Connect to VCS (choose VCS) > register a new Oauth Application >
    - Provide these details to github and register the application, which will generate a Client ID. Provide this to TF, then also generate a client secret and provide to TF > Connect and Continue
  - Workspace > Settings > Version Control > Version Control Workflow > Github.com(custom) > Choose Repo > Update VCS Settings

## Policy as Code
  - Terraform provides two policy frameworks:
    - Sentinel policies - provided by Hashicorp, written in sentinel language
    - OPA (Open Policy Agent) policies are written in REGO
  - Both Sentinel and OPA policies are used between the plan and apply phase. The cannot control resources that were applied previously that violate the policies. They also do not monitor the resources after they are created. They cannot detect any resources that violate the policies after they are formed.
  - Sentinel policies can be set as advisory, soft-mandatory or hard-mandatory
  - Policy is a file with a `.sentinel` or `.rego` extension
  - Git repo dedicaed to policies is a prerequisite. Policy is what gets connected to TFC
  - Policy Set is a grouping of one or more like sentinel/OPA policies
  - Policy sets is a file with a `.hcl` extension. Sentinel policy set is defined in code as a single `sentinel.hcl`, OPA policy set is defined in a single `policies.hcl` within a directory
  - Policy files can exist in the same directory as Policy Set or in a different directory depending on the strategy
  - Resources for writing sentinel policies: 
    - [Sentinel policies on Github](https://github.com/hashicorp/terraform-guides/tree/master/governance)
    - [Sentinel policies on Hashicorp registry](https://registry.terraform.io/browse/policies)
  - The policies an be set at org or workspace level

- You can set up notifications at workspace level
- 