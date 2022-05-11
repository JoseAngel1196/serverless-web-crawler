######################
# Env Setup Commands #
######################

# Deploy

.PHONY: deploy
deploy:
	serverless deploy --aws-profile developer_jhidalgo

# Kill lambda

.PHONY: kill
kill:
	serverless remove --aws-profile developer_jhidalgo

# Invoke functions
.PHONY: invoke_enqueuer
invoke_enqueuer:
	serverless invoke -f enqueuer --log --aws-profile developer_jhidalgo

.PHONY: invoke_scanner
invoke_scanner:
	serverless invoke -f scanner --log --aws-profile developer_jhidalgo