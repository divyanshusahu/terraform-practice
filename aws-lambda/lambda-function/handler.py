import boto3

def handler(event, context):
    client = boto3.client("s3")
    response = client.list_objects(
        Bucket="search-service-solr-response"
    )

    contents = []
    for content in response["Contents"]:
        contents.append(content["Key"])

    return {
        "objects": contents
    }
