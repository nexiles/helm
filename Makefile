GCS_HELM_BUCKET=gs://$(shell gcloud info --format='value(config.project)')-helm-repo


all: helm-odoo

package:  package-odoo

push: push-odoo

package-odoo:
	@helm package ./odoo

push-odoo:
	for p in odoo-*.tgz; do helm gcs push $$p ${GCS_HELM_BUCKET}; done
