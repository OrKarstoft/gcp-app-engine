_default:
  @just -l

@create GCP_PROJECT_ID GCP_REGION="europe-west":
  # Create the Google App Engine
  gcloud app create --project {{GCP_PROJECT_ID}} --region {{GCP_REGION}}

@deploy GCP_PROJECT_ID:
  # Make a temporary copy of the yaml files and replace the placeholder with the actual project ID
  sed 's/%GCP_PROJECT_ID%/{{GCP_PROJECT_ID}}/g' frontend/frontend.yaml > frontend/frontend.tmp.yaml
  sed 's/%GCP_PROJECT_ID%/{{GCP_PROJECT_ID}}/g' backend/backend.yaml > backend/backend.tmp.yaml

  # Deploy the app
  # The exclemation mark is Just syntax to continue even if the command fails. This will ensure cleanup is always done.
  - gcloud app deploy backend/backend.tmp.yaml frontend/frontend.tmp.yaml --project {{GCP_PROJECT_ID}}

  # Clean up the temporary files
  rm frontend/frontend.tmp.yaml
  rm backend/backend.tmp.yaml
